# Google Sign-In Setup for Android

## ✅ Changes Applied

Updated `auth_service.dart` to support both **Web** and **Mobile** platforms:
- **Web**: Uses `signInWithPopup()` 
- **Mobile (Android/iOS)**: Uses `google_sign_in` package with `signInWithCredential()`

## 🔧 Android Setup Required

To make Google Sign-In work on Android emulator/device, you need to add SHA-1 fingerprint to Firebase:

### Step 1: Get SHA-1 Fingerprint

Run this command in your project directory:

```bash
cd android
./gradlew signingReport
```

Look for the **SHA-1** fingerprint under **debug** variant. It will look like:
```
SHA1: A1:B2:C3:D4:E5:F6:...
```

### Step 2: Add SHA-1 to Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Select your project: **portfolio-50c3f**
3. Click the **Settings gear** (⚙️) → **Project Settings**
4. Scroll down to **Your apps** section
5. Select your **Android app** (com.divyapawar.portfolio_divya_pawar)
6. Scroll to **SHA certificate fingerprints**
7. Click **Add fingerprint**
8. Paste your SHA-1 fingerprint
9. Click **Save**

### Step 3: Download Updated google-services.json

1. After adding SHA-1, click **Download google-services.json**
2. Replace the existing file at: `android/app/google-services.json`

### Step 4: Rebuild the App

```bash
flutter clean
flutter pub get
cd android
./gradlew clean
cd ..
flutter run
```

## 📱 Testing

1. Run on **Android Emulator** or **Real Device**
2. Click **Download Resume** button
3. Google Sign-In screen should appear
4. Select your Google account
5. Resume will download and tracking data will be saved to Firestore

## 🌐 Web

No additional setup needed for web - it works automatically!

## 🍎 iOS Setup (if needed)

For iOS, you need to:
1. Add your iOS app to Firebase (if not already added)
2. Download `GoogleService-Info.plist`
3. Add it to `ios/Runner/` folder
4. Update `ios/Runner/Info.plist` with URL schemes

---

## Troubleshooting

### Error: "Sign-in cancelled or failed"
- Make sure SHA-1 is added to Firebase
- Check that google-services.json is updated
- Verify Google Sign-In is enabled in Firebase Authentication

### Error: "10: Developer Error"
- This means SHA-1 is not configured correctly
- Re-check SHA-1 fingerprint in Firebase Console
- Make sure you're using the debug SHA-1 for testing

### Still not working?
- Try `flutter clean` and rebuild
- Make sure you have internet connection
- Check Firebase Console → Authentication → Sign-in method → Google (should be enabled)

