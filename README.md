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

When someone downloads my resume, I get to know:
- Their name and email (they fill a quick form)
- What device/browser they used
- When they downloaded it

This helps me follow up with recruiters and potential collaborators. All data goes to Firebase Firestore.

## Tech I Used

- Flutter (obviously! 🦋)
- Firebase for storing download info
- Material Design 3 for the UI
- Google Fonts because default fonts are boring

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
3. Added Firebase to track resume downloads
4. Spent way too much time tweaking spacing and colors 😅

## Things I Learned

- Firebase integration with Flutter web
- Making forms that don't look ugly
- Responsive design is harder than it looks
- User experience matters (a lot!)

## Known Issues

- Google Sign-In on mobile needs SHA-1 setup (documented in `ANDROID_GOOGLE_SIGNIN_SETUP.md`)
- Resume download is web-only for now (working on mobile version)
- Some spacing issues on very small screens (fixing soon)

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
- 📱 Phone: +91 9420626655

## Want to Use This?

Feel free to fork it and make it your own! Just:
1. Replace my info with yours
2. Update the Firebase config
3. Add your own profile pic and resume
4. Customize the colors/theme to your taste

## A Quick Thanks

- Flutter team for making cross-platform development actually enjoyable
- Firebase for making backend stuff easy
- Stack Overflow for... well, everything 😂
- Coffee ☕

---

**Built with Flutter 💙**

*P.S. - If you download my resume and like what you see, let's talk! Always open to interesting opportunities.*
