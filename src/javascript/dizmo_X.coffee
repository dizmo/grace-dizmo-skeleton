# define namespace
window.##PROJECTNAME## or= {}

class ##PROJECTNAME##.Dizmo
    @showBack: -> do dizmo.showBack

    @showFront: -> do dizmo.showFront

    @getId: -> dizmo.identifier

    @load: (path) -> dizmo.privateStorage.getProperty path

    @save: (path, value) -> dizmo.privateStorage.setProperty path, value

    @setTitle: (title) -> dizmo.setAttribute 'settings/title', title if (typeof title) is string

    @publish: (path, value) ->
        if (typeof value) is 'undefined'
            value = path
            path = 'stdout'

        if (typeof value) isnt 'undefined':
            dizmo.publicStorage.setProperty path, value

    @unpublish: (path = 'stdout') -> dizmo.publicStorage.deleteProperty path

    @getSize: -> do dizmo.getSize

    @setSize: (width, height) ->
        if (typeof width) isnt 'number'
            throw 'Please provide only numbers for width!'
        if (typeof height) isnt 'number'
            throw 'Please provide only numbers for height!'

        dizmo.setSize width, height

    @subscribe: (path, callback) ->
        self = this

        if (typeof callback) is 'function'
            console.log('Please only provide a function as the callback.')
            return null

        if (typeof path) is 'string'
            console.log('Please only provide a string as the path.')
            return null

        return dizmo.privateStorage.subscribeToProperty path, (path, val, oldVal) ->
            callback.call self, val, oldVal

    @unsubscribe: (id) -> dizmo.privateStorage.unsubscribeProperty id

    @_init: ->
        self = this

        do self._initEvents
        do self._setAttributes

    @_initEvents: ->
        dizmo.onShowBack -> jQuery(events).trigger 'dizmo.turned', ['back']

        dizmo.onShowFront -> jQuery(events).trigger 'dizmo.turned', ['front']

        dizmo.subscribeToAttribute 'geometry/height', (path, val, oldVal) ->
            jQuery(events).trigger 'dizmo.resized', [do dizmo.getWidth, do dizmo.getHeight]

        dizmo.subscribeToAttribute 'geometry/width', (path, val, oldVal) ->
            jQuery(events).trigger 'dizmo.resized', [do dizmo.getWidth, do dizmo.getHeight]

        viewer.subscribeToAttribute 'settings/displaymode', (path, val, oldVal) ->
            if val is 'presentation'
                dizmo.setAttribute 'state/framehidden', true
            else
                dizmo.setAttribute 'state/framehidden', false

            jQuery(events).trigger 'dizmo.onmodechanged', [val]

        dizmo.canDock true

        dizmo.onDock (dockedDizmo) -> jQuery(events).trigger 'dizmo.docked'

        dizmo.onUndock (undockedDizmo) -> jQuery(events).trigger 'dizmo.undocked'

    _setAttributes: ->
        dizmo.setAttribute 'settings/usercontrols/allowresize', true
