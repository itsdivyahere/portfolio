# Firebase Setup Instructions

## Quick Setup (5 minutes)

### 1. Create Firebase Project
- Go to: https://console.firebase.google.com
- Click "Add project"
- Name: `portfolio-divya-pawar`
- Create project

### 2. Enable Firestore
- Go to "Firestore Database"
- Click "Create database"
- Start in "Test mode"
- Select location: `asia-south1` (for India)
- Enable

### 3. Set Firestore Rules
Go to Rules tab and paste:
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /resume_downloads/{document=**} {
      allow read, write: if true;
    }
  }
}
```
Click "Publish"

### 4. Add Web App
- Go to Project Settings
- Scroll to "Your apps"
- Click Web icon (</>)
- Register app name: `portfolio-web`
- You'll get Firebase config

### 5. Configure Your Project

**EASY WAY (Recommended):**
```bash
dart pub global activate flutterfire_cli
cd /Users/divya1.pawar/portfolio_divya_pawar
flutterfire configure
```
Select your project from the list and it will auto-configure!

**MANUAL WAY:**
Copy your Firebase config from the console and update:
`lib/firebase_options.dart`

Replace the placeholder values with your actual config:
```dart
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'YOUR_API_KEY',           // From Firebase Console
  appId: 'YOUR_APP_ID',              // From Firebase Console
  messagingSenderId: 'YOUR_MSG_ID',  // From Firebase Console
  projectId: 'YOUR_PROJECT_ID',      // From Firebase Console
  authDomain: 'YOUR_PROJECT_ID.firebaseapp.com',
  storageBucket: 'YOUR_PROJECT_ID.appspot.com',
);
```

### 6. Test Your Setup
```bash
flutter run -d chrome
```

Try downloading your resume and check Firebase Console:
- Go to Firestore Database
- Look for `resume_downloads` collection
- You should see your download record!

## Finding Your Firebase Config Later

If you need to find your config again:
1. Go to Firebase Console
2. Click Settings gear ⚙️ → Project settings
3. Scroll down to "Your apps"
4. Find your web app
5. Click "Config" or look for "SDK setup and configuration"
6. Your config is shown there

## Firebase Console URL
Your project will be at:
```
https://console.firebase.google.com/project/portfolio-divya-pawar
```

## Need Help?
- Firebase Documentation: https://firebase.google.com/docs
- FlutterFire Documentation: https://firebase.flutter.dev/

