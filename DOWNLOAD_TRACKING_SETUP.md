# Resume Download Tracking Setup Guide

## Overview
This portfolio includes a resume download tracking feature that collects information about who downloads your resume. The data is stored in Firebase Firestore.

## Features
- **Profile Image**: Displays your profile picture in the hero section
- **Resume Download**: Users can download your resume after providing their details
- **Download Tracking**: Captures user information including:
  - Name
  - Email
  - Phone number
  - Device information
  - Browser information
  - IP address
  - Timestamp
  - Location (if available)

## Firebase Setup Instructions

### 1. Create a Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Enter project name: `portfolio-divya-pawar`
4. Follow the setup wizard

### 2. Enable Firestore Database
1. In Firebase Console, go to "Firestore Database"
2. Click "Create database"
3. Start in **production mode** or **test mode** (for development)
4. Choose your preferred location

### 3. Set Up Firestore Security Rules
Add the following rules to allow read/write access:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /resume_downloads/{document=**} {
      allow read, write: if true; // For development
      // For production, add proper authentication rules
    }
  }
}
```

### 4. Add Firebase to Your Web App
1. In Firebase Console, click the web icon (</>) to add a web app
2. Register your app with a nickname
3. Copy the Firebase configuration object
4. Create a file: `web/firebase-config.js`

```javascript
// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "YOUR_API_KEY",
  authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
  projectId: "YOUR_PROJECT_ID",
  storageBucket: "YOUR_PROJECT_ID.appspot.com",
  messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
  appId: "YOUR_APP_ID"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);
```

### 5. Update web/index.html
Add Firebase SDKs before the closing `</body>` tag:

```html
<!-- Firebase SDKs -->
<script src="https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/10.7.0/firebase-firestore-compat.js"></script>
<script src="firebase-config.js"></script>
```

### 6. Add Firebase Options for Flutter
Create `lib/firebase_options.dart`:

```dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    appId: 'YOUR_APP_ID',
    messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    authDomain: 'YOUR_PROJECT_ID.firebaseapp.com',
    storageBucket: 'YOUR_PROJECT_ID.appspot.com',
  );

  // Add other platforms as needed
}
```

## Assets Setup

### 1. Add Profile Image
- Save your profile image as: `assets/images/profile.jpg`
- Supported formats: jpg, png
- Recommended size: 800x800 pixels or larger (square)

### 2. Add Resume PDF
- Save your resume as: `assets/resume/Divya_Pawar_Resume.pdf`
- Make sure the filename matches exactly

## Accessing Download Tracking Data

### Option 1: Firebase Console
1. Go to Firebase Console > Firestore Database
2. Navigate to `resume_downloads` collection
3. View all download records with user details

### Option 2: In-App Page
Navigate to the Downloads Tracking Page to view all downloads in a formatted view:
- The page shows total downloads
- Lists all download records with expandable details
- Real-time updates when new downloads occur

To access this page, you can add a route or navigation button in your admin section.

## Environment Variables (Optional)
For production, consider using environment variables:
1. Create `.env` file (add to .gitignore)
2. Store Firebase config in environment variables
3. Use packages like `flutter_dotenv` to load them

## Security Best Practices

### Production Security Rules
Update Firestore rules for production:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /resume_downloads/{document=**} {
      // Only allow authenticated admin users to read
      allow read: if request.auth != null && request.auth.token.admin == true;
      // Allow anyone to write (for download tracking)
      allow write: if true;
    }
  }
}
```

### IP Address Tracking
To get actual IP addresses, you can:
1. Use a service like ipify.org API
2. Update the `_getIpAddress()` method in `ResumeDownloadService`

Example:
```dart
Future<String> _getIpAddress() async {
  try {
    final response = await http.get(Uri.parse('https://api.ipify.org?format=json'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['ip'] as String;
    }
  } catch (e) {
    return 'Unknown';
  }
  return 'Unknown';
}
```

## Testing

### Test Download Flow
1. Run the app: `flutter run -d chrome`
2. Click "Download Resume" button
3. Fill in the form with test data
4. Check Firebase Console for the new record

### Test Tracking Page
1. Navigate to Downloads Tracking Page
2. Verify all records are displayed
3. Check that data updates in real-time

## Deployment

### Web Deployment
1. Build for web: `flutter build web`
2. Deploy to hosting service (Firebase Hosting, Netlify, etc.)
3. Ensure Firebase config is properly included

### Firebase Hosting (Recommended)
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase hosting
firebase init hosting

# Build Flutter web
flutter build web

# Deploy
firebase deploy --only hosting
```

## Troubleshooting

### Common Issues

1. **Firebase not initialized**
   - Make sure Firebase is initialized in main.dart
   - Check that firebase_options.dart has correct configuration

2. **Downloads not saving**
   - Check Firestore security rules
   - Verify internet connection
   - Check browser console for errors

3. **Profile image not loading**
   - Verify image path: `assets/images/profile.jpg`
   - Check pubspec.yaml assets configuration
   - Run `flutter clean` and `flutter pub get`

4. **Resume not downloading**
   - Verify resume path: `assets/resume/Divya_Pawar_Resume.pdf`
   - Check browser permissions for downloads
   - Verify file is properly added to assets

## Privacy Considerations

Consider adding a privacy policy that informs users:
- What data is collected
- How it's used
- How long it's stored
- User rights regarding their data

You may want to add a checkbox in the download dialog for users to consent to data collection.

## Future Enhancements

Potential improvements:
1. Admin authentication for viewing downloads
2. Email notifications when resume is downloaded
3. Analytics dashboard with charts and graphs
4. Export downloads to CSV
5. Geolocation for more accurate location tracking
6. Download link expiry
7. Add CAPTCHA to prevent spam downloads

