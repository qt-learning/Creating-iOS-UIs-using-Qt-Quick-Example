# Creating iOS UIs using Qt Quick Example

This example demonstrates how to create native-looking iOS user interfaces using Qt Quick Controls with the iOS style.

## Project Structure

```
├── main.cpp                # Application entry point
├── main.qml                # Main application window with navigation
├── HomePage.qml            # Home page view
├── TaskPage.qml            # Task page with date picker integration
├── SettingsPage.qml        # Settings page
├── NavBar.qml              # Custom navigation toolbar
├── Database.qml            # Singleton for local SQLite storage
├── qdatetimepicker.h       # Native iOS date picker (C++/Obj-C++ bridge)
├── qdatetimepicker.mm      # Native iOS date picker implementation
├── QtWS_iOSStyle.pro       # qmake project file
├── resources.qrc           # Qt resource file
├── qtquickcontrols2.conf   # Qt Quick Controls configuration
├── images/                 # UI assets (@1x, @2x, @3x)
└── LICENCES/               # License texts
```

## Getting Started

To build and run this project, you will need Qt and an IDE (e.g. Qt Creator) installed on your computer. You can download Qt and Qt Creator from the [Qt.io website](https://qt.io).

Open `QtWS_iOSStyle.pro` in Qt Creator or a compatible IDE, select an iOS kit, then build and run the project.

> Note that this example is iOS-only and requires a macOS host with Xcode installed.

## Resources

If you need additional help, the following resources may be helpful:

- Qt Documentation: https://doc.qt.io
- Qt Forum: https://forum.qt.io
- Qt Academy: https://qt.io/academy

## Licensing Information

```
Copyright (C) 2026 Qt Group.
SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
```

Creating iOS UIs using Qt Quick is a practical example of building native-looking iOS applications using the Qt Quick Controls iOS style with native platform integrations.

### Terms and Conditions

If you, your employer, or the legal entity you act on behalf of hold commercial license(s) with a Qt Group entity, this software package constitutes Pre-Release Code under the Qt License/Frame Agreement governing those licenses, and that agreement's terms and conditions govern your access and use of this software package.

This software package may provide links or access to third party libraries or code (collectively "Third-Party Software") to implement various functions. Use or distribution of Third-Party Software is discretionary and in all respects subject to applicable license terms of applicable third-party right holders.

### Third-Party Attributions

- The icons used in this project are sourced from [Material Symbols Library](https://fonts.google.com/icons) provided by Google. The icons are available under the [Apache License Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
