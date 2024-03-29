# Introduction to GUI Programming with Python and PyQt5
PyQt5 has three major modules: [_QtWidgets_](https://docs.huihoo.com/pyqt/PyQt5/QtWidgets.html), [_QtGui_](https://docs.huihoo.com/pyqt/PyQt5/QtGui.html) and [_QtCore_](https://docs.huihoo.com/pyqt/PyQt5/QtCore.html), each of which contains a set of tools necessary for creating a user interface (UI). <br />
Qt uses an [event-driven system](https://www.technologyuk.net/computing/software-development/software-design/event-driven-programming.shtml) which responds to user input
by spawning an event, which then results in action.

## Creating and Empty Window
The most simple thing you can do is create an empty window. Here, we use an empty widget to create an empty window. <br /> 
Any widget can be a window so we could have also just used _QPushButton_ to create an empty window with a single, labeless button.
```Python
from PyQt5.QtWidgets import QApplication, QWidget

# Create QApplication
app = QApplication([])  # QApplication is given no arguments (typically a list of strings)

# Create a widget (which we're using as a blank window) and then show it
window = QWidget()
window.show()        # <-- Show the window. Windows without a parent are hidden by default.

# Start the event loop (show the window)
app.exec_()
```
> [QApplication](https://doc.qt.io/qtforpython-5/PySide2/QtWidgets/QApplication.html#detailed-description) is a [singleton](https://en.wikipedia.org/wiki/Singleton_pattern) that contains the [event loop](https://en.wikipedia.org/wiki/Event_loop#:~:text=In%20computer%20science%2C%20the%20event,or%20messages%20in%20a%20program.&text=When%20the%20event%20loop%20forms,loop%20or%20main%20event%20loop.) necessary for the user to interact with the window. It is not optional.

## Creating the Basis of a GUI App with QMainWindow
[_QMainWindow_](https://doc.qt.io/qtforpython-5/PySide2/QtWidgets/QMainWindow.html) is a special class that inherits from the _QWidget_ class and is meant to be used as the basis
of a window that can then be built upon.

I know the main window looks exactly the same now, but later you'll see how _QMainWindow_'s methods allow you to do more than a normal widget.
```Python
from PyQt5.QtWidgets import QApplication, QMainWindow

# Create QApplication
app = QApplication([])  # QApplication is given no arguments (typically a list of strings)

# Create a main window and then show it
window = QMainWindow()
window.show()        # <-- Show the window. Windows without a parent are hidden by default.

# Start the event loop (show the window)
app.exec_()
```

## Creating a Custom Window via a Window Class
If you're going to create anything more than an empty window, you really should do it inside a class.

Note: Don't forget to call _super().\_\_init\_\_()_, otherwise the class won't get properly set up.
```Python
from PyQt5.QtWidgets import QApplication, QMainWindow, QPushButton

class MainWindow(QMainWindow):
    def __init__(self):
        # Call the constructor of 'QMainWindow'
        super().__init__()  

        # Give the window a title (text in the top-left corner)
        self.setWindowTitle("This entire window is a giant button!")
        
        # Add a single button the the window labeled 'This is a button!'
        button = QPushButton("This is a button!")
        self.setCentralWidget(button)  # Make the button the center of the whole window
        

def main():
    app = QApplication([])
    
    window = MainWindow()
    window.show()

    app.exec_()

if __name__ == '__main__':
    main()
```

## Setting a Fixed Window Size
You can set a fixed window size with the [_setFixedSize()_](https://www.geeksforgeeks.org/pyqt5-how-to-stop-resizing-of-window-setfixedsize-method/), [_setFixedHeight()_](https://www.geeksforgeeks.org/pyqt5-set-fix-window-size-for-height-or-width/), and [_setFixedWidth()_](https://www.geeksforgeeks.org/pyqt5-set-fix-window-size-for-height-or-width/) methods. All three functions take a [_QSize()_](https://doc.qt.io/qt-5/qsize.html) object (from QtCore) as a parameter.

These resizing methods can be used with _any_ widget. Not just windows.
```Python
from PyQt5.QtCore import QSize
from PyQt5.QtWidgets import QApplication

class MainWindow(QMainWindow):
    def __init__(self):
        # Call the constructor of 'QMainWindow'
        super().__init__()

        # Set a fixed window size
        self.setFixedSize(QSize(400, 300))
```
> Try changing the size of the window — you can't.
