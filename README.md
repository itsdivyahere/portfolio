# My Portfolio

Hey! This is my personal portfolio built with Flutter. It's where I showcase my work and share my resume.

## What's This About?

I needed a portfolio website that looks good and helps me track who's interested in my work. Instead of using a template, I built it myself using Flutter because, well, that's what I do! 😄

## What You'll Find Here

- **About Me** - Who I am and what I do
- **Projects** - The apps I've worked on (PeopleFirst and NiyantranPro)
- **Skills** - Technologies I work with
- **Certifications** - Courses I've completed
- **Resume Download** - Grab my resume if you're interested

## The Cool Part

When someone downloads my resume, they just need to sign in with their Google account. That's it! No boring forms to fill.

I get to know:
- Their name and email (from their Google account)
- What device/browser they used
- When they downloaded it

This helps me follow up with recruiters and potential collaborators. All data goes to Firebase Firestore, and they stay signed in only for the download - then automatically signed out for privacy.

## Tech I Used

- Flutter (obviously! 🦋)
- Firebase Authentication (Google Sign-In)
- Firebase Firestore for storing download info
- Material Design 3 for the UI
- Google Fonts because default fonts are boring
- Platform-specific code for web vs mobile

## Running This Locally

If you want to check it out or use it as reference:

```bash
# Clone it
git clone <your-repo-url>

# Install dependencies
flutter pub get

# Run it
flutter run -d chrome
```

**Note**: You'll need to set up your own Firebase project. I've added instructions in `QUICK_START.md`.

## How I Built This

Started with the basics:
1. Created sections (Hero, About, Projects, etc.)
2. Made it responsive (looks good on phone, tablet, desktop)
3. Added Firebase Authentication with Google Sign-In
4. Set up Firestore to track resume downloads
5. Spent way too much time tweaking spacing and colors 😅

The Google Sign-In was tricky - had to make it work differently for web (popup) and mobile (credential flow).

## Things I Learned

- Firebase Authentication with Google Sign-In (web vs mobile is different!)
- Platform-specific code in Flutter (kIsWeb, conditional imports)
- Making buttons that look consistent across platforms
- Responsive design is harder than it looks
- User experience matters - one-click Google Sign-In beats boring forms!

## Known Issues

- Google Sign-In on Android needs SHA-1 fingerprint setup (documented in `ANDROID_GOOGLE_SIGNIN_SETUP.md`)
- Mobile download uses Google Sign-In properly now, but needs Firebase config
- Some spacing issues on very small screens (fixing soon)
- Download tracking works best on web, mobile testing ongoing

## What's Next?

- [ ] Make resume download work on mobile
- [ ] Add a proper dashboard to view analytics
- [ ] Maybe add a blog section?
- [ ] Dark mode (everyone wants dark mode)

## About Me

I'm Divya Pawar, a Flutter Developer currently working at Jio Platforms Limited in Navi Mumbai. I've been working with Flutter for 3+ years now, mainly on enterprise apps.

**Connect with me:**
- 📧 Email: divyapawar9420@gmail.com
- 💼 LinkedIn: [divya-pawar-85821b222](https://www.linkedin.com/in/divya-pawar-85821b222)
- 🐙 GitHub: [divya-pawar](https://github.com/divya-pawar)
- 📱 Phone: +91 7020709761

## Want to Use This?

Feel free to fork it and make it your own! Just:
1. Replace my info with yours
2. Update the Firebase config
3. Add your own profile pic and resume
4. Customize the colors/theme to your taste

**Built with Flutter**

*P.S. - If you download my resume and like what you see, let's talk! Always open to interesting opportunities.*
