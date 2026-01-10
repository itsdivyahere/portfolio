# Divya Pawar - Flutter Developer Portfolio

A professional portfolio website built with Flutter, featuring resume download tracking and analytics.

## ✨ Features

- 🖼️ **Profile Image Display** - Professional photo in hero section
- 📄 **Resume Download** - One-click PDF download with tracking
- 📊 **Download Analytics** - Track who downloads your resume
- 🔥 **Firebase Integration** - Real-time data storage and retrieval
- 📱 **Responsive Design** - Works on mobile, tablet, and desktop
- 🎨 **Modern UI** - Beautiful gradient design with Material Design 3
- ⚡ **Real-time Updates** - Live dashboard with download statistics

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (>=2.19.6 <3.0.0)
- Dart
- Firebase account (for download tracking)

### Setup in 3 Steps

1. **Add Your Assets**
   ```bash
   # Add your profile image
   cp /path/to/your/photo.jpg assets/images/profile.jpg
   
   # Add your resume PDF
   cp /path/to/your/resume.pdf assets/resume/Divya_Pawar_Resume.pdf
   ```

2. **Configure Firebase**
   ```bash
   # Easy way (recommended)
   dart pub global activate flutterfire_cli
   flutterfire configure
   
   # Or manually update lib/firebase_options.dart
   ```

3. **Run the App**
   ```bash
   flutter pub get
   flutter run -d chrome
   ```

📖 **Detailed Instructions**: See [QUICK_START.md](QUICK_START.md)

## 📂 Project Structure

```
lib/
├── core/                    # Core utilities and themes
├── data/
│   ├── models/             # Data models including download tracking
│   └── services/           # Business logic and Firebase services
└── presentation/
    ├── pages/              # Full-page widgets
    ├── sections/           # Homepage sections
    └── widgets/            # Reusable components

assets/
├── images/                 # Profile image
└── resume/                 # Resume PDF
```

## 🎯 Key Features

### Resume Download Tracking
When a user downloads your resume:
1. Form collects: Name, Email, Phone
2. System captures: Device info, Browser, IP, Timestamp
3. Data saved to Firebase Firestore
4. Resume PDF downloads automatically
5. Real-time analytics dashboard updates

### Downloads Dashboard
View comprehensive analytics:
- Total downloads count
- User details (name, email, phone)
- Device and browser information
- Download timestamps
- Real-time updates

## 📱 Sections

- **Hero** - Introduction with animated roles
- **About** - Experience highlights and technical skills
- **Projects** - Major projects and achievements
- **Certifications** - Professional certifications
- **Contact** - Social links and contact information

## 🛠️ Tech Stack

- **Frontend**: Flutter, Material Design 3
- **Backend**: Firebase (Firestore)
- **State Management**: StatefulWidget, Streams
- **Navigation**: MaterialPageRoute
- **Fonts**: Google Fonts
- **Icons**: Font Awesome

## 📊 Firebase Collections

### `resume_downloads`
```json
{
  "id": "timestamp",
  "userName": "John Doe",
  "userEmail": "john@example.com",
  "userPhone": "+1234567890",
  "deviceInfo": "User agent string",
  "browserInfo": "Chrome",
  "ipAddress": "123.45.67.89",
  "location": "City, Country",
  "downloadedAt": "2026-01-10T14:30:00Z"
}
```

## 🔐 Security

- Form validation for all user inputs
- Firestore security rules for data protection
- HTTPS encryption for all Firebase communications
- Privacy-compliant data collection

**Note**: Update Firestore rules for production (see [DOWNLOAD_TRACKING_SETUP.md](DOWNLOAD_TRACKING_SETUP.md))

## 📖 Documentation

- **[QUICK_START.md](QUICK_START.md)** - Get up and running in 5 minutes
- **[IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md)** - Complete feature overview
- **[DOWNLOAD_TRACKING_SETUP.md](DOWNLOAD_TRACKING_SETUP.md)** - Detailed Firebase setup
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - System architecture and data flow

## ✅ Verification

Run the setup check script:
```bash
./check_setup.sh
```

This verifies:
- ✅ Profile image exists
- ✅ Resume PDF exists
- ✅ Firebase configuration
- ✅ Dependencies installed
- ✅ Required files present

## 🚀 Deployment

### Firebase Hosting (Recommended)
```bash
# Build for web
flutter build web

# Deploy to Firebase
firebase init hosting
firebase deploy --only hosting
```

### Other Hosting Options
- Netlify
- Vercel
- GitHub Pages
- AWS S3

## 🧪 Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage

# Analyze code
flutter analyze
```

## 📈 Future Enhancements

- [ ] Email notifications on resume download
- [ ] Analytics charts and graphs
- [ ] Export downloads to CSV
- [ ] Geolocation tracking
- [ ] Admin authentication
- [ ] Dark mode toggle
- [ ] Multiple language support

## 👤 Author

**Divya Pawar**
- Role: Flutter Developer
- Company: Jio Platforms Limited
- Location: Navi Mumbai, India
- Email: divyapawar9420@gmail.com
- LinkedIn: [divya-pawar-85821b222](https://www.linkedin.com/in/divya-pawar-85821b222)
- GitHub: [divya-pawar](https://github.com/divya-pawar)

## 📄 License

This project is for personal portfolio use.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Font Awesome for icons
- Google Fonts for typography

---

**Need Help?**
- Check the documentation files listed above
- Open an issue on GitHub
- Contact via email or LinkedIn

**Made with ❤️ using Flutter**

# portfolio
