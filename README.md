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

When someone downloads my resume, it's instant - no sign-ups, no forms, no friction. Just click and download!

Behind the scenes, I track anonymous analytics:
- Device type and browser
- Download timestamp
- Approximate location (via IP - anonymized)

This helps me understand who's interested in my work without being invasive. The tracking is non-blocking - if it fails, the download still works. Privacy matters!

## Tech I Used

- Flutter (obviously! 🦋)
- Firebase Firestore for anonymous download analytics
- Material Design 3 for the UI
- Google Fonts because default fonts are boring
- Platform-specific code for web vs mobile downloads

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
3. Set up Firebase Firestore for anonymous download tracking
4. Implemented platform-specific file downloads
5. Spent way too much time tweaking spacing and colors 😅

The download tracking was interesting - had to make it work differently for web (dart:html) and mobile (path_provider).

## Things I Learned

- Anonymous analytics with Firebase Firestore
- Platform-specific code in Flutter (kIsWeb, conditional imports)
- File downloads across web and mobile
- Responsive design is harder than it looks
- Sometimes simple is better - no sign-in needed!

## Known Issues

- Resume download on Android opens in browser (working on saving to Downloads folder)
- Some spacing issues on very small screens (fixing soon)
- IP-based location is approximate and sometimes unavailable
- Analytics tracking is anonymous - can't follow up with specific users

## What's Next?

- [ ] Improve mobile download (save to Downloads folder)
- [ ] Add a dashboard to view download analytics
- [ ] Maybe add IP geolocation for better location tracking
- [ ] Dark mode (everyone wants dark mode)
- [ ] Add more projects as I build them

## About Me

I'm Divya Pawar, a Flutter Developer currently working at Jio Platforms Limited in Navi Mumbai. I've been working with Flutter for 3+ years now, mainly on enterprise apps.

**Connect with me:**
- 📧 Email: divyapawar9420@gmail.com
- 💼 LinkedIn: [divya-pawar-85821b222](https://www.linkedin.com/in/divya-pawar-85821b222)
- 🐙 GitHub: [divya-pawar](https://github.com/itsdivyahere)
- 📱 Phone: +91 7020709761

## Want to Use This?

Feel free to fork it and make it your own! Just:
1. Replace my info with yours
2. Update the Firebase config
3. Add your own profile pic and resume
4. Customize the colors/theme to your taste

**Built with Flutter**

*P.S. - If you download my resume and like what you see, let's talk! Always open to interesting opportunities.*
