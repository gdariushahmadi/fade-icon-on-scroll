# Fade Icon on Scroll - Flutter App

## Overview
This Flutter application demonstrates an interactive UI behavior where the app's icon changes with a fade animation based on the scroll position. When the user scrolls down a predetermined threshold, the icon in the AppBar transitions from an image icon to a list icon with a smooth fading effect. This example also showcases how to use a ScrollController to listen to scroll events and trigger state changes in the Flutter app.

## Features
- **Dynamic Icon Change:** Icons in the AppBar change based on the scroll position.
- **Fade Animation:** Utilizes AnimatedSwitcher for a smooth transition between icons.
- **ScrollController:** Monitors scroll events to trigger the icon change.

## Getting Started
### Prerequisites
Ensure you have the following installed:
- Flutter (latest version)
- Dart (latest version)
- An IDE (e.g., VS Code, Android Studio)

### Installation
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/gdariushahmadi/fade-icon-on-scroll.git
2. Navigate to the project directory:
   ```bash
   cd fade-icon-on-scroll
3. Get Flutter dependencies:
    ```bash
   flutter pub get
4. Run the app on a connected device or emulator:
    ```bash
   flutter run

## Usage
Simply scroll down the list in the app. As you reach the specified scroll threshold, observe the icon in the top right corner of the AppBar. It will transition from an image icon to a list icon with a fade animation. Scrolling back up reverses the effect.

## Contributing
Contributions to enhance this example app are welcome. Please follow these steps:

## Fork the repository.
Create your feature branch (git checkout -b feature/AmazingFeature).
Commit your changes (git commit -m 'Add some AmazingFeature').
Push to the branch (git push origin feature/AmazingFeature).
Open a Pull Request.
## License
Distributed under the MIT License. 