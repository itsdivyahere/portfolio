# Quick Start Guide - Add Your Profile Image & Resume

## Step 1: Save Your Profile Image

You uploaded a beautiful profile photo. Here's how to add it to your portfolio:

### Option A: Using Finder (macOS)
1. Right-click on the image you uploaded in our chat
2. Save it to your Downloads folder
3. Rename it to: `profile.png`
4. Copy/Move it to: `/Users/divya1.pawar/portfolio_divya_pawar/assets/images/profile.png`

### Option B: Command Line
```bash
# Navigate to the images folder
cd /Users/divya1.pawar/portfolio_divya_pawar/assets/images/

# If you saved the image from chat to Downloads:
cp ~/Downloads/[your-image-name].png ./profile.png

# Or use this if the image name is different
mv ~/Downloads/[your-image-name].png profile.png
```

### Option C: Direct Screenshot/Scan
If you need to use the image again:
1. Take a screenshot of the image
2. Save it as `profile.png`
3. Place in: `assets/images/profile.png`

## Step 2: Add Your Resume PDF

1. Save your resume as PDF
2. Name it: `Divya_Pawar_Resume.pdf`
3. Place it in: `/Users/divya1.pawar/portfolio_divya_pawar/assets/resume/Divya_Pawar_Resume.pdf`

## Step 3: Quick Firebase Setup (5 minutes)

### Easy Way (Recommended):
```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase (this will prompt you to login and select/create project)
cd /Users/divya1.pawar/portfolio_divya_pawar
flutterfire configure
```

This automatically:
- Creates/selects Firebase project
- Generates correct `firebase_options.dart`
- Sets up all platforms

### Manual Way:
1. Go to https://console.firebase.google.com/
2. Create new project: "portfolio-divya-pawar"
3. Add web app
4. Enable Firestore Database
5. Copy config to `lib/firebase_options.dart`

### Firestore Rules (Copy-Paste):
In Firebase Console > Firestore > Rules:
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

## Step 4: Install Dependencies & Run

```bash
cd /Users/divya1.pawar/portfolio_divya_pawar

# Get dependencies
flutter pub get

# Run on web
flutter run -d chrome
```

## Step 5: Test Everything

1. ✅ Check if profile image loads in hero section
2. ✅ Click "Download Resume" button
3. ✅ Fill in the form (Name, Email, Phone)
4. ✅ Click Download
5. ✅ Verify resume downloads
6. ✅ Check Firebase Console > Firestore > resume_downloads collection
7. ✅ You should see the download record!

## View Download Analytics

### Quick Access Menu (Optional)
Add this to your portfolio to easily access downloads dashboard.

In `lib/main.dart`, add inside the Scaffold:
```dart
appBar: AppBar(
  actions: [
    IconButton(
      icon: const Icon(Icons.analytics),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DownloadsTrackingPage(),
          ),
        );
      },
      tooltip: 'View Downloads',
    ),
  ],
),
```

Don't forget to import:
```dart
import 'presentation/pages/downloads_tracking_page.dart';
```

## That's It! 🎉

Your portfolio now tracks every resume download with complete user information!

## Troubleshooting

**Image not showing?**
- Make sure filename is exactly: `profile.jpg`
- Check it's in: `assets/images/profile.jpg`
- Run: `flutter clean && flutter pub get`

**Resume not downloading?**
- Make sure filename is exactly: `Divya_Pawar_Resume.pdf`
- Check it's in: `assets/resume/Divya_Pawar_Resume.pdf`

**Firebase errors?**
- Make sure you ran `flutterfire configure`
- Or manually updated `lib/firebase_options.dart` with your config

**Need help?**
- Check `IMPLEMENTATION_SUMMARY.md` for detailed info
- Check `DOWNLOAD_TRACKING_SETUP.md` for Firebase details

