def show_back():
    dizmo.showBack()

def show_front():
    dizmo.showFront()

def get_id():
    dizmo.getId()

def load(path, default=None):
    dizmo.privateStorage.getProperty(path, {
        'default': default
    })

def save(path, value):
    dizmo.privateStorage.setProperty(path, value)

def set_title(title):
    if isinstance(title, str):
        dizmo.setAttribute('title', title)

def publish(value, path='stdout'):
    dizmo.publicStorage.setProperty(path, value)

def unpublish(path='stdout'):
    dizmo.publicStorage.deleteProperty(path)

def get_size():
    return dizmo.getSize()

def set_size(width, height):
    dizmo.setSize(width, height)

def subscribe(path, callback):
    def f(path, val, oldVal):
        callback(val, oldVal)

    return dizmo.privateStorage.subscribeToProperty(path, f)

def unsubscribe(id):
    dizmo.privateStorage.unsubscribeProperty(id)

def candock(callback):
    dizmo.canDock(callback)

def ondock(callback):
    dizmo.onDock(callback)

def onundock(callback):
    dizmo.onUndock(callback)

def set_attribute(path, value):
    dizmo.setAttribute(path, value)


def setup():
    set_attribute('settings/usercontrols/allowresize', True)
    candock(True)

    def displaymode_cb(path, val, old_val):
        if val == 'presentation':
            set_attribute('state/framehidden', True)
        else:
            set_attribute('state/framehidden', False)

    viewer.subscribeToAttribute('settings/displaymode', displaymode_cb)
