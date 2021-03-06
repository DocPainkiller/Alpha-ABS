do ->
    Game_AIBot::activate = ->
        return unless @_absParams.activateSwitch
        return if @_absParams.active == true
        @LOG.p 'Activate'
        key = [
            $gameMap.mapId()
            @eventId()
            @_absParams.activateSwitch
        ]
        $gameSelfSwitches.setValue key, true
        @refresh()
        SlowUpdateManager.register(@eventId(), @_stateMachine, 300)
        @initABS()
        return

    Game_AIBot::initABS = ->
        unless @battler()
            @_absParams.battler = new Game_EnemyABS(@_absParams.enemyId)
            @_absParams.battler.initABS()
            SlowUpdateManager.register(@eventId(), @_stateMachine, 300)
        @changeStateToFree()
        @showHpBarABS() if @isNeedHpBarShow()
        @refreshABSMotion()
        if @_checkActiveState()
            @_absParams.active = true
            @_checkDieSwitch()
            if @battler().enemy().actions.length == 0
                @LOG.p 'Not actions'
                @behaviorModel().noFight = true
        else
            @LOG.p 'Deactivated from start'
            @_deactivate()
        return

    #$[OVER I]
    Game_AIBot::isNeedHpBarShow = ->
        try
            if AlphaABS.Parameters.isLoaded()
                showFromPluginAlways = AlphaABS.Parameters.get_EnemyMiniHpBarOption() == 1
            else
                showFromPluginAlways = false
            showFromModel = @behaviorModel().showHP == 1
            return showFromPluginAlways || showFromModel
        catch e
            AlphaABS.error e, 'while read show enemy mini HP parameter'
            return false

    #@[ALIAS I]
    __super_selectOnMap = Game_AIBot::selectOnMap
    Game_AIBot::selectOnMap = (isSelect) ->
        __super_selectOnMap.call @, isSelect
        try
            if @_checkCanShowByParameters() is true
                if isSelect is true
                    @showHpBarABS()
                else
                    @hideHpBarABS() if @behaviorModel().showHP == 0
        catch e
            AlphaABS.error e, 'while read show enemy mini HP parameter on selection'

    Game_AIBot::deactivate = ->
        return unless @_absParams.activateSwitch
        return if @_absParams.active == false
        @LOG.p 'Deactivate'
        key = [
            $gameMap.mapId()
            @eventId()
            @_absParams.activateSwitch
        ]
        $gameSelfSwitches.setValue key, false
        @refresh()
        @_onBattleEnd()
        @battler().stopABS()
        @_deactivate()
        return

    __super_deactivate = Game_AIBot::_deactivate
    Game_AIBot::_deactivate = ->
        __super_deactivate.call @
        @hideHpBarABS()
        @refreshABSMotion()
        SlowUpdateManager.clear @eventId()

    Game_AIBot::loot = ->
        unless @_absParams.looted
            @_absParams.looted = true
            gold = @battler().gold()
            $gameParty.gainGold gold if gold > 0
            items = @battler().makeDropItems()
            if items.length > 0
                items.forEach (item) ->
                    $gameParty.gainItem item, 1
                    return
            @LOG.p 'Looted!'
            if !@inActive() then @_storeDeadData()
        else
            @LOG.p 'Already looted!'
        return


    Game_AIBot::_updateABS = ->
        if @inActive() and !@isErased()
            @battler().updateABS()
            @_stateMachine.update this
        else
            @_stateMachine.update this if @_stateMachine.inReturnState()

        if @inActive() and @isErased()
            @_deactivate()
        return

    Game_AIBot::_updateRevive = ->
        return if @_absParams.reviveTimer == null or @battler().isAlive()
        @_absParams.reviveTimer.update()
        @_revive() if @_absParams.reviveTimer.isReady()
        return

    Game_AIBot::_revive = ->
        if @isErased()
            @_absParams.reviveTimer = null
            return

        @locate @_absParams.myStartPosition.x, @_absParams.myStartPosition.y
        key = [
            $gameMap.mapId()
            @eventId()
            AlphaABS.Parameters.get_EnemyDeadSwitch()
        ]
        $gameSelfSwitches.setValue key, false
        @_absParams.battler = null
        @_absParams.reviveTimer = null
        @refresh()
        @initABS()
        @setRevive @behaviorModel().reviveTime
        @_absParams.active = true
        @_absParams.looted = false
        reviveAnimationId = AlphaABS.Parameters.get_EnemyReviveAnimationId()
        @requestAnimationABS reviveAnimationId if reviveAnimationId > 0
        @_absParams.myHomePosition = null
        @changeStateToFree()
        return


    Game_AIBot::setRevive = (time) ->
        if time == 0
            @_absParams.reviveTimer = null
            return
        t = time * AlphaABS.SYSTEM.FRAMES_PER_SECOND
        @LOG.p 'Set revive ' + time + ' secs.'
        if time
            @_absParams.reviveTimer = new Game_TimerABS()
            @_absParams.reviveTimer.start t
        return

    Game_AIBot::startCommonEvent = (commonEventId) ->
        return if commonEventId <= 0
        @LOG.p 'Try call outer Common Event ' + commonEventId
        commonEvent = $dataCommonEvents[commonEventId]
        if commonEvent
            list = commonEvent.list
            if list and list.length > 1
                @LOG.p 'Start outer Common Event '
                @_absParams.reservedCommonEvent = [ {
                    code: 117
                    indent: 0
                    parameters: [ commonEventId ]
                } ]
                @_starting = true
        return

    Game_AIBot::refreshABSMotion =  ->
        if @_absParams.absMotion?
            @_absParams.absMotion.clearMotion()
            @_absParams.absMotion = null
        if @behaviorModel().motion > 0 and @battler().isAlive()
            @_absParams.absMotion = new AlphaABS.LIBS.ABSMotion()
            @_absParams.absMotion.setMotion("main", @behaviorModel().motionOffset, this)
            @_absParams.absMotion.applyMotionIdle()

    Game_AIBot::inABSMotion = -> @_absParams.absMotion?

    Game_AIBot::_updateABSMotion = ->
        if @battler().isNeedABSMotionAction()
            @battler().onABSMotionActionDone()
            @_absParams.absMotion.applyMotionAction() if @_absParams.absMotion?

    Game_AIBot::refreshABSMotionState  = (toState) ->
        return unless @inABSMotion()
        if toState == true
            @_absParams.absMotion.applyMotionState()
        else
            @_absParams.absMotion.applyMotionIdle()

    #@[ALIAS I]
    __interface_method_performAction = Game_AIBot::_performAction
    Game_AIBot::_performAction = ->
        __interface_method_performAction.call this
        if @inABSMotion()
            @battler().requestABSMotionAction() if @battler().action(0).isAttack()
        return

    return
