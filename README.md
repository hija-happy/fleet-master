
# SmartRouteX - Fleet Management System

## Overview

**SmartRouteX** is an innovative fleet management solution designed to simplify the complexities of managing fleets for businesses. The system integrates real-time tracking, efficient trip and driver management, and robust route planning. With support for multiple roles—drivers, operators, and users—SmartRouteX ensures smooth operations, effective communication, and a safer, smarter fleet.

## Features

- **Bus Management**: Efficiently manage the fleet of buses with real-time tracking and maintenance records.
- **Trip Management**: Plan, assign, and monitor trips, ensuring smooth operation and customer satisfaction.
- **Driver Management**: Manage driver assignments, track performance, and ensure compliance with schedules.
- **Route Management**: Create optimized routes, track vehicles in real-time, and adapt to route changes dynamically.
- **Event Triggers for Drivers**: Automatic event notifications using AWS Lambda to notify drivers based on specific fleet conditions.

## Technology Stack

- **Frontend**: Flutter for the mobile app interface.
- **Backend**: Firebase Firestore for real-time database management and AWS Lambda for event-driven functions.
- **Authentication**: Three types of logins (User, Operator, Driver) using Firebase Authentication.
  
## Setup Instructions

1. Clone the repository:
    ```bash
   git clone https://github.com/hija-happy/fleet-master.git'''
   ```
3. Navigate to the project directory:
   ```bash
   cd smartroutex
   ```
4. Install dependencies:
  ```bash
   flutter pub get
  ```
5. Configure Firebase:
   - Add your Firebase configuration files (\`google-services.json\` for Android, \`GoogleService-Info.plist\` for iOS).
6. Run the project:
    ```bash
   flutter run
    ```

## Usage

Once the app is set up, users can:
- **User Login**: Access real-time fleet tracking and reports.
- **Operator Login**: Manage fleets, assign drivers, and monitor routes.
- **Driver Login**: Receive trip details, update statuses, and access assigned routes.



## Contributing

We welcome contributions! Please see our [contributing guidelines](CONTRIBUTING.md) for more information.


