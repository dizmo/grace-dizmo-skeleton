#= require main

###
Generally you do not need to edit this file. You can start writing
your code in the provided "Main" class.
###

# If your dizmo has a back side and you want to access it include this function,
# otherwise you can delete it!
window.showBack = -> dizmo.showBack()

# Helper object to attach all the events to
window.events = {}

# As soon as the dom is loaded, and the dizmo is ready, instantiate the main class
window.document.addEventListener 'dizmoready', ->
    ##PROJECTNAME##.Main.init()
