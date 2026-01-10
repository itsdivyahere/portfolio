# Resume Download & Tracking Architecture

## System Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                     PORTFOLIO WEBSITE                            │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │              HERO SECTION                                │   │
│  │                                                           │   │
│  │  ┌──────────────┐         ┌─────────────────────┐      │   │
│  │  │   Profile    │         │   Download Resume   │      │   │
│  │  │   Image      │         │      Button         │      │   │
│  │  │ (profile.jpg)│         └──────────┬──────────┘      │   │
│  │  └──────────────┘                    │                  │   │
│  └───────────────────────────────────────┼─────────────────┘   │
│                                          │                       │
│                                          ▼                       │
│                    ┌──────────────────────────────────┐         │
│                    │   Download Resume Dialog         │         │
│                    │                                  │         │
│                    │  📝 Name:    [_____________]     │         │
│                    │  📧 Email:   [_____________]     │         │
│                    │  📱 Phone:   [_____________]     │         │
│                    │                                  │         │
│                    │  [Cancel]      [Download]        │         │
│                    └──────────┬──────────────────────┘         │
└────────────────────────────────┼──────────────────────────────┘
                                 │
                                 ▼
                    ┌────────────────────────┐
                    │  Form Validation       │
                    │  • Name (min 2 chars)  │
                    │  • Email (valid format)│
                    │  • Phone (min 10 digits)│
                    └────────┬───────────────┘
                             │
                             ▼
            ┌────────────────────────────────────┐
            │  Resume Download Service           │
            │  (resume_download_service.dart)    │
            │                                    │
            │  ✓ Collect Device Info             │
            │  ✓ Detect Browser                  │
            │  ✓ Get IP Address                  │
            │  ✓ Create Tracking Record          │
            └────────┬───────────────────────────┘
                     │
        ┌────────────┴────────────┐
        │                         │
        ▼                         ▼
┌──────────────────┐    ┌─────────────────────┐
│  Firebase        │    │   File Download     │
│  Firestore       │    │                     │
│                  │    │  Divya_Pawar_       │
│  Collection:     │    │  Resume.pdf         │
│  resume_downloads│    │                     │
│                  │    │  → User's Device    │
│  Document:       │    └─────────────────────┘
│  {                │
│   id: timestamp  │
│   userName       │
│   userEmail      │
│   userPhone      │
│   deviceInfo     │
│   browserInfo    │
│   ipAddress      │
│   downloadedAt   │
│   location       │
│  }               │
└────────┬─────────┘
         │
         │ Real-time Stream
         │
         ▼
┌───────────────────────────────┐
│  Downloads Tracking Page      │
│  (downloads_tracking_page.dart)│
│                               │
│  ╔═══════════════════════╗   │
│  ║ Total Downloads: 15   ║   │
│  ╚═══════════════════════╝   │
│                               │
│  ┌─────────────────────────┐ │
│  │ 1. John Doe             │ │
│  │    Jan 10, 2026 2:30 PM │ │
│  │    ▼ Show Details       │ │
│  └─────────────────────────┘ │
│  ┌─────────────────────────┐ │
│  │ 2. Jane Smith           │ │
│  │    Jan 10, 2026 1:15 PM │ │
│  │    ▼ Show Details       │ │
│  └─────────────────────────┘ │
│  ...                          │
└───────────────────────────────┘
```

## Data Flow

### 1. User Interaction Flow
```
User Visits Portfolio
       ↓
Sees Profile Image & Download Button
       ↓
Clicks "Download Resume"
       ↓
Dialog Opens
       ↓
Enters: Name, Email, Phone
       ↓
Clicks "Download"
       ↓
[Validation] → Pass/Fail
       ↓
[Pass] → Processing...
       ↓
Data Saved to Firebase + File Downloads
       ↓
Success Message Shown
```

### 2. Tracking Data Collection
```
User Submits Form
       ↓
Service Collects:
├── User Input (Name, Email, Phone)
├── Device Info (User Agent String)
├── Browser Info (Chrome/Firefox/Safari/Edge)
├── Timestamp (Current Date/Time)
├── IP Address (via API or "Unknown")
└── Location (Geolocation or "Unknown")
       ↓
Creates DownloadTrackingModel
       ↓
Saves to Firestore: resume_downloads/{id}
       ↓
Triggers Download: assets/resume/Divya_Pawar_Resume.pdf
```

### 3. Analytics Viewing Flow
```
Admin Opens Dashboard
       ↓
Connects to Firestore Stream
       ↓
Real-time Updates Enabled
       ↓
Displays:
├── Total Count
├── List of Downloads
│   ├── User Name
│   ├── Timestamp
│   └── Expandable Details
│       ├── Email
│       ├── Phone
│       ├── Device
│       ├── Browser
│       ├── IP
│       └── Location
```

## File Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── theme/
│   │   ├── app_colors.dart ✨ (updated)
│   │   └── app_theme.dart
│   └── utils/
│       └── responsive_utils.dart
│
├── data/
│   ├── models/
│   │   ├── certification_model.dart
│   │   ├── project_model.dart
│   │   ├── skill_model.dart
│   │   └── download_tracking_model.dart ⭐ NEW
│   │
│   └── services/
│       └── resume_download_service.dart ⭐ NEW
│
├── presentation/
│   ├── pages/
│   │   └── downloads_tracking_page.dart ⭐ NEW
│   │
│   ├── sections/
│   │   ├── about_section.dart
│   │   ├── certifications_section.dart
│   │   ├── contact_section.dart
│   │   ├── hero_section.dart ✨ (updated)
│   │   └── projects_section.dart
│   │
│   └── widgets/
│       ├── animated_role_text.dart
│       ├── download_resume_dialog.dart ⭐ NEW
│       ├── project_card.dart
│       ├── section_title.dart
│       └── skill_card.dart
│
├── firebase_options.dart ⭐ NEW
└── main.dart ✨ (updated)

assets/
├── images/
│   ├── profile.jpg ⭐ REQUIRED
│   └── README.md
│
└── resume/
    ├── Divya_Pawar_Resume.pdf ⭐ REQUIRED
    └── README.md
```

## Technology Stack

```
┌─────────────────────────────────────┐
│         FRONTEND (Flutter)          │
├─────────────────────────────────────┤
│ • Flutter Web                       │
│ • Material Design 3                 │
│ • Responsive Layout                 │
│ • Form Validation                   │
│ • State Management (StatefulWidget) │
└─────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────┐
│         BACKEND (Firebase)          │
├─────────────────────────────────────┤
│ • Firebase Core                     │
│ • Cloud Firestore (Database)        │
│ • Real-time Streaming               │
│ • Automatic Sync                    │
└─────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────┐
│           FILE STORAGE              │
├─────────────────────────────────────┤
│ • Local Assets                      │
│ • Resume PDF                        │
│ • Profile Image                     │
│ • HTML Download Trigger             │
└─────────────────────────────────────┘
```

## Security Layers

```
┌──────────────────────────────────────────┐
│         User Input Validation            │
│  • Client-side form validation           │
│  • Email format check                    │
│  • Phone number validation               │
└────────────────┬─────────────────────────┘
                 │
                 ▼
┌──────────────────────────────────────────┐
│         Firebase Security Rules          │
│  • Firestore Rules (Production)          │
│  • Read: Authenticated only              │
│  • Write: Public (for tracking)          │
└────────────────┬─────────────────────────┘
                 │
                 ▼
┌──────────────────────────────────────────┐
│         Data Privacy                     │
│  • HTTPS encryption                      │
│  • Secure Firebase connection            │
│  • No sensitive data exposed             │
└──────────────────────────────────────────┘
```

## Key Components

### 1. DownloadTrackingModel
- Data structure for tracking information
- JSON serialization/deserialization
- Type-safe model with required fields

### 2. ResumeDownloadService
- Handles download logic
- Collects tracking data
- Saves to Firestore
- Triggers file download

### 3. DownloadResumeDialog
- User-friendly form
- Real-time validation
- Loading states
- Error handling
- Success feedback

### 4. DownloadsTrackingPage
- Real-time dashboard
- Stream-based updates
- Expandable cards
- Summary statistics
- Formatted display

## Integration Points

```
main.dart
  └── Firebase.initializeApp()
        └── firebase_options.dart (Config)

hero_section.dart
  ├── Profile Image Display
  │     └── assets/images/profile.jpg
  │
  └── Download Button
        └── DownloadResumeDialog
              └── ResumeDownloadService
                    ├── Firestore Write
                    │     └── resume_downloads/{id}
                    │
                    └── File Download
                          └── assets/resume/Divya_Pawar_Resume.pdf
```

## Success Criteria Checklist

✅ Profile image displays in hero section  
✅ Download button functional  
✅ User form collects required information  
✅ Form validation works correctly  
✅ Data saves to Firebase Firestore  
✅ Resume file downloads successfully  
✅ Tracking captures all required fields  
✅ Dashboard displays download records  
✅ Real-time updates work  
✅ Error handling implemented  
✅ Success/error messages display  
✅ Responsive design maintained  

---

**Legend:**
- ⭐ NEW: Newly created files
- ✨ Updated: Modified existing files
- 📦 Required: Files you need to add

