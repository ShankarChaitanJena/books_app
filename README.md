# Books App

This Flutter project, "Books App," was developed as part of an internship assessment. The application makes a POST request to the provided API, displays the response in a ListView, and includes filtering functionality by name.

## Table of Contents
- ["Getting Started"](#getting-started)
  - ["Prerequisites"](#prerequisites)
  - ["Installation"](#installation)
- ["Project Structure"](#project-structure)
- ["Usage"](#usage)
  - ["API Integration"](#api-integration)
- ["Filtering"](#filtering)
- ["Screen Recording"](#screen-recording)
- ["Contributing"](#contributing)
- ["License"](#license)

## "Getting Started"

### "Prerequisites"

Before running the project, ensure you have the following installed:
- Flutter SDK: ["Install Flutter"](https://flutter.dev/docs/get-started/install)
- Dart SDK: ["Install Dart"](https://dart.dev/get-dart)

### "Installation"

1. Clone the repository:
   ```bash
   git clone https: https://github.com/ShankarChaitanJena/books_app
   cd books-app
  Install dependencies:
  ```flutter pub get```
### "Project Structure"
The project follows a standard Flutter structure:

lib/: Contains Dart code for the application.
test/: Includes test cases for the application.

### "Usage"
Run the Books App on an emulator or connected device:
```flutter run```
### "API Integration"

The app makes a POST request to the following API endpoint:

Endpoint: https://api.thenotary.app/lead/getLeads
```Request body:```
{
  "notaryId": "643074200605c500112e0902"
}

The response from the API will be displayed in a ListView.

###"Filtering"

The ListView is filterable by the "Name" field. Use the search bar or a separate filter input to filter the list dynamically.

###"Screen Recording"

```Watch a demonstration of the app's functionality in the screen recording.```

###"Contributing"

Contributions are welcome! If you find any issues or have suggestions, feel free to open an "issue" or create a "pull request".



