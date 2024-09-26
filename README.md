# Social Media App

A simple social media application built with Flutter and Firebase.

## Overview

This app allows users to create accounts, share posts, view posts from other users, and manage their profiles. It uses Firebase for authentication and data storage.

## Features

- User authentication (sign up and sign in)
- Create and view posts
- User profiles
- List of all users

## Setup

1. Clone the repository
2. Ensure you have Flutter installed and set up
3. Run `flutter pub get` to install dependencies
4. Set up a Firebase project and add your configuration files
5. Run the app using `flutter run`

## Dependencies

- firebase_core
- firebase_auth
- cloud_firestore

## Firebase Setup

This app uses Firebase for authentication and Firestore for data storage. You'll need to:

1. Create a Firebase project
2. Enable Authentication and Firestore in your Firebase console
3. Add your Firebase configuration files to the project

## Data Structure

### Firestore Collections

- **Posts**: Stores user posts
  - Fields: userEmail, userPost, timestamp

- **Users**: Stores user information
  - Fields: username, email

## Pages

### Home Page

Displays user posts and allows creating new posts.

### Profile Page

Shows the current user's profile information.

### Users Page

Lists all users of the app.

## Contributing

Feel free to fork this project and submit pull requests with improvements or bug fixes.

## License

This project is open source and available under the [MIT License](LICENSE).
