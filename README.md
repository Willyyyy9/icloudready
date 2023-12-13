# ICloudReady Task Project - README.md

## Project Overview

This is a Flutter application that allows users to:

* **Browse a paginated list of items:** Initially, 20 items display on the home screen, with easy loading of more.
* **Dive into details:** Clicking an item takes you to a dedicated screen with more information.
* **Search with ease:** Utilize the search button to find specific items by name or filter by properties.
* **Refresh on demand:** Pull down to refresh the home screen list with fresh data from the backend.
* **Experience cached convenience:** The home screen list data is cached, saving time on subsequent visits.
* **Embrace different languages:** The app supports both English and Arabic for global accessibility.
* **Switch between themes:** Choose between light and dark modes for optimal viewing comfort.

## Data Sources

This project utilizes two data sources, depending on the chosen branch:

* **Main Branch:** Leverages a published dummy API featuring Rick and Morty characters.
* **local-backend branch:** Uses a locally developed backend project for more realistic data interaction. (https://github.com/Willyyyy9/icloudreadybackend.git)

**Setting Up the local-backend branch:**

1. Clone the local-backend project.
2. Follow its Readme instructions for proper configuration.
3. In `Lib/app/resources/string_manager.dart`, change `base_url` to your local IP address.

## Flutter Version

This project uses Flutter version 3.13.9.

## Developed by

Mohamed Walaa Eldeen

## Getting Started

1. Clone this repository.
2. Install Flutter and necessary dependencies.
3. Run `flutter doctor` to confirm your environment readiness.

**Main Branch:**

1. Launch the app with the dummy API by running `flutter run`.

**local-backend branch:**

1. Follow the local-backend project's Readme for initial setup.
2. Update `baseUrl` in `Lib/app/resources/string_manager.dart` to your local IP address.
3. Run `flutter run` to use the local backend with the app.

## Additional Resources

* Local-backend project: https://github.com/Willyyyy9/icloudreadybackend.git
* Flutter documentation: https://docs.flutter.dev/

## Feedback and Contributions

We encourage feedback and contributions. Feel free to open issues or pull requests on the GitHub repository.

**Thank you for exploring the ICloudReady Task Project!**
