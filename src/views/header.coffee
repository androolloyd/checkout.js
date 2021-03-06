crowdcontrol = require 'crowdcontrol'
Events = crowdcontrol.Events
View = crowdcontrol.view.View

class Header extends View
  tag: 'header'
  html: require '../../templates/header.jade'

  # show the back button?
  showBack: true

  # Array index of screen form script being shown
  index: 0

  # array of referenced tags ot show
  scriptRefs: null

  events:
    "#{ Events.Screen.SyncScript }": (scriptRefs, index)->
      @syncScript scriptRefs, index

  syncScript: (@scriptRefs, @index)->
    if @scriptRefs? && @scriptRefs[@index]?
      @showBack = @scriptRefs[@index].showBack

    @update()

  back: ()->
    @obs.trigger "#{Events.Screen.Back}"

  close: ()->
    @obs.trigger "#{Events.Modal.Close}"

Header.register()

module.exports = Header
