from module import dizmo

class Main:
    def __init__(self):
        dizmo.setup()

        self._init_events()

    def _init_events(self):
        jQuery('.done-btn').on('click', dizmo.show_front)
