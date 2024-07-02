```markdown
# CT-WebSDK-Flutter

## Overview
CT-WebSDK-Flutter is a Flutter application integrated with CleverTap's Web SDK for user
analytics and engagement.

## Getting Started
To get started with CT-WebSDK-Flutter, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/rohkode/CT-WebSDK-Flutter.git
   ```
2. Open the project in your preferred Flutter development environment (e.g., Visual Studio Code, Android Studio).

3. Install dependencies by running the following command in the project directory:
   ```bash
   flutter pub get
   ```

4. Configure CleverTap:
   - Initialize CleverTap with your CleverTap account ID in the `init` method of your main file (`main.dart`).
   - Enable Web Push notifications using the `enableWebPush` method in the `initState` method of your main file (`main.dart`). Configure the push notification settings accordingly.

## Usage
Once the project is set up, you can use the following features:

- **OnUserLogin Method:** Identify users with their name, email, identity, and phone number using the `onUserLogin` method.
- **Custom Event:** Record custom events with properties such as product name and category using the `recordEvent` method.
- **Charged Event:** Record charged events with detailed information such as the total amount, payment mode, and items purchased using the `recordChargedEvent` method.

## Contributing
Contributions to CT-WebSDK-Flutter are welcome! If you find any issues or have suggestions for improvements, feel free to submit a pull request.
