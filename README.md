# USB Printer App

A Flutter application designed for seamless USB POS printing and integrated webview functionalities. This app is designed to manage and print invoices directly to USB serial thermal printers, alongside displaying a specialized web view for DineFood.

## 🚀 Features

* **USB POS Printing:** Connects to USB thermal receipt printers to print invoices and receipts using `usb_serial` and `flutter_pos_printer_platform_image_3`.
* **Print Preview:** Generates an invoice view and allows users to preview it before sending it to the printer.
* **ESC/POS Support:** Utilizes `esc_pos_utils_plus` for advanced ESC/POS command formatting.
* **Invoice Screenshot & Generation:** Uses the `screenshot` package to capture UI widgets and convert them into printable image formats.
* **Integrated Web View:** Features a secure, dedicated webview pointing to `https://dinefood.in`. 
* **Screenshot Prevention:** Utilizes `flutter_windowmanager` to prevent users from taking screenshots while on the Webview screen for added security.
* **Connectivity Monitoring:** Actively monitors the internet connection using `connectivity_plus` and `internet_connection_checker`, gracefully routing to a 'No Internet' screen when the connection drops.

## 📦 Key Dependencies

This project relies on several key packages:

- [flutter_pos_printer_platform_image_3](https://pub.dev/packages/flutter_pos_printer_platform_image_3) - Universal POS Printer Platform.
- [esc_pos_utils_plus](https://pub.dev/packages/esc_pos_utils_plus) - ESC/POS print commands.
- [usb_serial](https://pub.dev/packages/usb_serial) - Access to USB serial ports.
- [screenshot](https://pub.dev/packages/screenshot) - To capture widgets as images for printing.
- [webview_flutter](https://pub.dev/packages/webview_flutter) - For rendering the web interface.
- [flutter_windowmanager](https://pub.dev/packages/flutter_windowmanager) - Used for adding `FLAG_SECURE` to prevent screenshots on specific screens.
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) & [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) - For network state management.
- [lottie](https://pub.dev/packages/lottie) - For displaying animations (e.g., in the 'No Internet' screen).

## 🛠️ Getting Started

To get a local copy up and running, follow these steps.

### Prerequisites

* Flutter SDK (Version `>=3.3.2 <4.0.0`)
* Android Studio / VS Code
* An Android device (for testing USB OTG printing features, an emulator won't suffice).

### Installation

1. Clone the repository or extract the project files.
2. Navigate to the project directory in your terminal:
   ```bash
   cd usb_printer_flutter/usb_printer
   ```
3. Install the required Flutter dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## 📱 Application Flow

1. **Main Screen (`main.dart`):** Serves as the entry point for testing printer settings (`PrinterSettingScreen`) and previewing invoices (`PrintPreviewScreen`).
2. **Web View App (`home.dart`):** The production-focused screen that loads the dining platform. It continuously checks for active network connections and enforces security policies to block screenshots.
3. **Printer Services (`lib/printer_services/`):** Contains the core logic for discovering USB devices, formatting ESC/POS data, and transmitting it to the printer.

## 📝 Configuration

- **Android configuration:** Make sure the required INTERNET permissions are added in `android/app/src/main/AndroidManifest.xml` (added by default by Flutter). Furthermore, USB host permissions are natively requested by the `usb_serial` plugin.
- **Web URL:** The targeted URL configured in `home.dart` is currently set to `https://dinefood.in`.

## 🆘 Troubleshooting

- **Printer not detected:** Ensure your Android device supports USB OTG, and that the OTG settings are enabled in the phone's system settings.
- **Can't build project:** Ensure you are on a compatible Flutter SDK version as defined in the `pubspec.yaml` environment constraints.
