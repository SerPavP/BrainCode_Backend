
from abc import ABC, abstractmethod

class Device(ABC):
    @abstractmethod
    def connect(self):
        pass

class Printer(Device):
    def connect(self):
        return "Connected to printer"
    
    def get_status(self):
        return "Printer is ready to print"

class Scanner(Device):
    def connect(self):
        return "Connected to scanner"
    
    def get_status(self):
        return "Scanner is scanning"

printer = Printer()
scanner = Scanner()

print(printer.connect())
print(printer.get_status())

print(scanner.connect())
print(scanner.get_status())
