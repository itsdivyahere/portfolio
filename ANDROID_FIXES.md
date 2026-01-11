# Android Mobile Fixes

## ✅ Fixed Issues:

### 1. LinkedIn & GitHub Links Not Opening
**Problem**: Links not opening in external browser on Android
**Fix**: Added `LaunchMode.externalApplication` to force external browser

### 2. Google Sign-In Error (ApiException: 10)
**Problem**: `DEVELOPER_ERROR` - SHA-1 not configured in Firebase
**Fix**: Follow steps below

---

## 🔧 Fix Google Sign-In on Android:

### Step 1: Get Debug SHA-1 Fingerprint

Run in terminal:
```bash
cd /Users/divya1.pawar/portfolio_divya_pawar/android
./gradlew signingReport
```

Look for **debug** variant SHA-1, copy it. Example:
```
SHA1: A1:B2:C3:D4:E5:F6:...
```

### Step 2: Add SHA-1 to Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Select project: **portfolio-50c3f**
3. Click ⚙️ **Settings** → **Project Settings**
4. Scroll to **Your apps** → Select **Android app**
   - Package: `com.divyapawar.portfolio_divya_pawar`
5. Scroll to **SHA certificate fingerprints**
6. Click **Add fingerprint**
7. Paste your SHA-1
8. Click **Save**

### Step 3: Download Updated google-services.json

1. In same screen, click **Download google-services.json**
2. Replace file at:
   ```
   /Users/divya1.pawar/portfolio_divya_pawar/android/app/google-services.json
   ```

### Step 4: Enable Google Sign-In

1. In Firebase Console → **Authentication**
2. Click **Sign-in method** tab
3. Click **Google**
4. Toggle **Enable**
5. Add support email: `divyapawar9420@gmail.com`
6. Click **Save**

### Step 5: Clean & Rebuild

```bash
cd /Users/divya1.pawar/portfolio_divya_pawar
flutter clean
cd android
./gradlew clean
cd ..
flutter pub get
flutter run
```

---

## 📱 Test After Changes:

1. **LinkedIn/GitHub Links**: Should open in browser
2. **Google Sign-In**: Should show Google account picker
3. **Resume Download**: Should work after sign-in

---

## 🚨 If Still Error:

### Check Android Manifest

File: `android/app/src/main/AndroidManifest.xml`

Should have:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### Verify google-services.json

Check if file exists:
```bash
cat android/app/google-services.json
```

Should have your project info with `client_id` ending in `.apps.googleusercontent.com`

---

## 📋 Quick Commands:

```bash
# 1. Get SHA-1
cd android && ./gradlew signingReport

# 2. After adding to Firebase, clean build
cd ..
flutter clean
flutter pub get

# 3. Run on device
flutter run
```

---

## ✅ Expected Result:

- ✅ LinkedIn icon → Opens browser → LinkedIn profile
- ✅ GitHub icon → Opens browser → GitHub profile  
- ✅ Download Resume → Google Sign-In popup → Resume downloads
- ✅ Email icon → Opens email app
- ✅ Phone icon → Opens dialer

---

**Priority**: Fix SHA-1 first, it's the main issue! 🎯


