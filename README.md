# Running Flutter App with Different Flavors

### Step 1: Ensure You Have Configured Flavors
You should have already set up the flavors in your `pubspec.yaml` file using `flutter_flavorizr` as described. Ensure your Android and iOS configurations are correct.

### Step 2: Running the App with Different Flavors

Use the following commands to run the app in different flavors from the command line.

#### 1. **Running the Development Flavor (`dev`)**

To run the app in the `dev` flavor (debug mode):

```bash
flutter run --flavor dev -t lib/main_dev.dart
```

#### 2. **Running the QA Flavor (`qa`)**

To run the app in the `qa` flavor (debug mode):

```bash
flutter run --flavor qa -t lib/main_qa.dart
```

#### 3. **Running the Production Flavor (`debug mode`)**

To run the app in the `prod` flavor (debug mode):

```bash
flutter run --flavor prod -t lib/main_prod.dart
```

### Step 3: Build the App for Release

To build the app for a specific flavor in release mode:

#### 1. **Build the Development Flavor (`dev`)**

```bash
flutter build apk --flavor dev -t lib/main_dev.dart
```

```bash
flutter build ios --flavor dev -t lib/main_dev.dart
```

#### 2. **Build the QA Flavor (`qa`)**

```bash
flutter build apk --flavor qa -t lib/main_qa.dart
```

```bash
flutter build ios --flavor qa -t lib/main_qa.dart
```

#### 3. **Build the Production Flavor (`prod`)**

```bash
flutter build apk --flavor prod -t lib/main_prod.dart
```

```bash
flutter build ios --flavor prod -t lib/main_prod.dart
```
