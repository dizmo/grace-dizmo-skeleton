#= require dizmo

# define namespace
window.##PROJECTNAME## or= {}

class ##PROJECTNAME##.Main
    @init: ->
        self = this

        do self._initEvents

    @_initEvents: ->
        self = this

        jQuery('.done-btn').on 'click', -> do ##PROJECTNAME##.Dizmo.showFront
