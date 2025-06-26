class Device:
    def _init_(self, name, connected_by):
        self.name = name
        self.connected_by = connected_by
        self.connected = True

    def _str_(self):
        return f"Device {self.name!r} ({self.connected_by})"

    def disconnect(self):
        self.connected = False
        print("Disconnected.")

class Printer(Device):
    def _init_(self, name, connected_by, capacity):
        super()._init_(name, connected_by)
        self.capacity = capacity
        self.remaining_pages = capacity