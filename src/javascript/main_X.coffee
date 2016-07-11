#= require dizmo

# define namespace
window.##PROJECTNAME## or= {}

class ##PROJECTNAME##.Main
    @init: ->
        self = this

        self._initEvents()
        ##PROJECTNAME##.Dizmo.init()

    @_initEvents: ->
        self = this

        jQuery('.done-btn').on('click', -> ##PROJECTNAME##.Dizmo.showFront())
