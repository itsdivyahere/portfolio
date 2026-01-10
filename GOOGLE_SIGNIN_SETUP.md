# Google Sign-In Setup for Resume Download

## ✅ What Changed:

Instead of manual form input, users now:
1. Click **"Download Resume"**
2. **Google Sign-In popup** appears
3. User selects their Google account
4. Their **name, email automatically captured** from Google account
5. Resume downloads automatically
6. Data saved to Firebase

## 🔧 Firebase Setup Required:

### Step 1: Enable Google Sign-In in Firebase

1. Go to **Firebase Console**: https://console.firebase.google.com
2. Select your project: **portfolio-divya-pawar**
3. In left sidebar, click **"Authentication"**
4. Click **"Get started"** (if first time)
5. Go to **"Sign-in method"** tab
6. Find **"Google"** in the list
7. Click on it
8. Toggle **"Enable"**
9. **Important**: Add your **support email** (your email address)
10. Click **"Save"**

### Step 2: Install Dependencies

Run in terminal:
```bash
cd /Users/divya1.pawar/portfolio_divya_pawar
flutter pub get
```

### Step 3: Run Your App

```bash
flutter run -d chrome
```

## 🎯 How It Works Now:

### User Experience:
```
1. User clicks "Download Resume"
   ↓
2. Google Sign-In popup appears
   ↓
3. User selects Google account
   ↓
4. Auto-captures: Name, Email, Profile Photo
   ↓
5. Downloads resume automatically
   ↓
6. Saves to Firebase with timestamp
   ↓
7. User is signed out (clean up)
```

### Data Captured:
- ✅ **Name** (from Google account)
- ✅ **Email** (from Google account)  
- ✅ **Phone** (if available in Google account, else "Not provided")
- ✅ **Device Info** (browser user agent)
- ✅ **Browser Type** (Chrome, Firefox, etc.)
- ✅ **Timestamp** (when downloaded)
- ✅ **IP Address** (placeholder for now)

## 📊 Benefits:

✅ **No manual typing** - faster user experience
✅ **Verified emails** - real email addresses only
✅ **More secure** - authenticated users
✅ **Better data quality** - accurate information
✅ **Professional** - modern auth flow
✅ **Privacy friendly** - users see what's being collected

## 🔐 Privacy & Security:

- User must consent to sign in with Google
- Only basic profile info (name, email) is accessed
- User is signed out immediately after download
- Data stored securely in Firebase
- Transparent about what's collected

## 🧪 Testing:

1. Run the app
2. Click "Download Resume"
3. Google Sign-In popup appears
4. Sign in with your Google account
5. Resume downloads
6. Check Firebase → Firestore → resume_downloads
7. You'll see your data with Google account info!

## 🚀 Next Steps After Setup:

1. Enable Google Sign-In in Firebase Console
2. Run `flutter pub get`
3. Run `flutter run -d chrome`
4. Test the download
5. Check Firebase for tracked data

---

**Much better user experience! No forms to fill!** 🎉

