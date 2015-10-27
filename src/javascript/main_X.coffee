#= require dizmo

# define namespace
window.##PROJECTNAME## or= {}

class ##PROJECTNAME##.Main
    dizmo: new ##PROJECTNAME##.Dizmo()

    constructor: ->
        self = this

        self._initEvents()

    _initEvents: ->
        self = this

        jQuery('.done-btn').on 'click' () ->
            ##PROJECTNAME##.Dizmo.showFront()
