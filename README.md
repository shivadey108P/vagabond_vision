# Vagabond Vision

Vagabond Vision is a Flutter-based mobile application that allows users to discover and explore the best travel destinations, including restaurants, hotels, sites, beaches, and more. It utilizes Firebase for authentication, notification management, and Firestore for storing user data.

![App Screenshot](./images/img.gif) 

## Table of Contents
- [Description](#description)
- [Features](#features)
- [Getting Started](#getting-started)
- [Dependencies](#dependencies)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Description
Vagabond Vision is designed to help users explore new places, keep track of their favorite spots, and receive personalized notifications for places they might like. Users can log in using email and password authentication, and Firebase is used to store user data and manage notifications.

## Features
- Firebase Authentication for user login and sign-up.
- Navigation to different screens through a bottom navigation bar.
- Ability to mark favorite places and view them in a separate section.
- Notification management using Firebase Cloud Messaging.
- Use of Geolocator and Geocoding to fetch and display user location.
- Integration with Google Maps for getting directions to places.

## Getting Started
To get started with this project, you'll need to have Flutter and Dart installed. If you don't have Flutter installed, follow [the official guide](https://flutter.dev/docs/get-started/install) to install it on your system.

### Installation
1. Clone the repository to your local system:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   ```
2. Navigate to the project directory:
```bash
   cd your-repo-name
```

3. Install the necessary dependencies:
```
flutter pub get
```
### Firebase Setup
To set up Firebase for this project, follow these steps:

1. Create a Firebase project and add your Flutter app to it. You can follow this guide for more information.
2. Download the google-services.json (for Android) or GoogleService-Info.plist (for iOS) and place them in the correct location in your project.
3. Configure the Firebase options in your project.

### Usage
Once the setup is complete, you can run the app with the following command:
```
flutter run
```
This will launch the app on a connected device or emulator. You can explore different features such as authentication, notifications, favorite places, and more.

### Contributing
Contributions are welcome! If you'd like to contribute to the project, please open an issue or submit a pull request. Make sure to follow the project's coding style and include appropriate tests for your changes.

### License
This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

### Additional Resources
1. Project Documentation
2. [Video Recordings](https://drive.google.com/file/d/1_0ZPFXp6MQNerKrKEUXMM4Bu3og3aO4C/view?usp=sharing) <!--Yet to add links-->
