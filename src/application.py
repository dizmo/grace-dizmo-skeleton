from module.main import Main

# Generally you do not need to edit this file. You can start writing
# your code in the provided "Main" class.

# If your dizmo has a back side and you want to access it include this function,
# otherwise you can delete it!
def show_back():
    dizmo.showBack()

# As soon as the dom is loaded, and the dizmo is ready, instantiate the main class
def on_dizmo_ready():
    Main()

window.document.addEventListener('dizmoready', on_dizmo_ready)
window.showBack = show_back
