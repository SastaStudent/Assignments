# Flutter Project

## Overview

This Flutter application provides a simple Login Page with Username and Email input fields. Upon successful login, the user is navigated to a Dashboard Page.

## Features

- **Login Page**
  - Username and Email input fields
  - Login button to navigate to the Dashboard
- **Dashboard Page**
  - Displays a list of projects with their status, due date, section, and issues
  - Search functionality to filter projects
  - Navigation to project details on selection
  - Floating Action Button (FAB) for adding a new snag
  - Bottom Navigation Bar with multiple sections
- **Create Snag Page**
  - Allows users to create a snag with the following fields:
    - Project selection
    - Section selection
    - Assign to selection
    - Due date selection via a date picker
    - Status selection
    - Description input with character count
  - Cancel button to discard changes
  - Create button to submit the snag, showing a success message
- **Project Details Page**
  - Displays detailed project information
  - Shows project name, status, start date, and due date
  - Section name, issue details, and description
  - Attachments preview for related images or documents
  - Timeline section with snag creation and updates
  - "Update" button to modify project details
- **Dark Mode Support**
  - Implements dark mode for improved user experience
  - Uses `ThemeMode.system` to adapt to the device's settings
  - Allows manual toggling between light and dark mode
- **Stateful Widgets**
  - Used for managing UI state
- **Navigation**
  - Uses `Navigator.push` to navigate between screens

## Project Structure

```
/lib
  ├── main.dart           # Entry point of the application
  ├── DashboardPage.dart  # Dashboard screen displaying project details
  ├── CreateProject.dart  # Screen to create a new project/snag
  ├── CreateSnagPage.dart # Screen to create a new snag
  ├── ProjectDetails.dart # Screen showing detailed project information
```

## Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/SastaStudent/Assignments.git
   ```
2. **Navigate to the project directory**
   ```sh
   cd testingapp
   ```
3. **Install dependencies**
   ```sh
   flutter pub get
   ```
4. **Run the application**
   ```sh
   flutter run
   ```

## Dependencies

1. This project uses Flutter’s built-in material library, so no additional dependencies are required.
2. I have also used the intl.dart library for date formatting.

## How It Works

- The app starts with `main.dart`, which sets `LoginPage` as the home screen.
- LoginPage have username and password (current not set ).
- The user enters their details and presses the login button.
- On pressing login, the app navigates to `DashboardPage`, displaying projects.
- The dashboard allows searching for projects and navigating to their details.
- A floating action button enables users to create a new snag.
- The `CreateSnagPage` allows users to fill in snag details and submit them.
- The `ProjectDetailsPage` provides in-depth information, attachments, and timeline updates.
- The app supports dark mode, adapting to system settings or allowing manual toggling.

## Future Improvements

- Add authentication (Firebase/Auth API)
- Improve UI with animations and better styling
- Implement user validation for login fields
- Allow editing and deleting projects/snags
- Integrate backend for project management

---



