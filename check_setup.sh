#!/bin/bash

# Portfolio Setup Verification Script
# This script checks if all necessary files are in place

echo "🔍 Checking Portfolio Setup..."
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

PROJECT_DIR="/Users/divya1.pawar/portfolio_divya_pawar"
cd "$PROJECT_DIR" || exit

ERRORS=0
WARNINGS=0

# Check profile image
echo "📸 Checking Profile Image..."
if [ -f "assets/images/profile.png" ] || [ -f "assets/images/profile.jpg" ]; then
    if [ -f "assets/images/profile.png" ]; then
        SIZE=$(wc -c < "assets/images/profile.png")
        FILE="profile.png"
    else
        SIZE=$(wc -c < "assets/images/profile.jpg")
        FILE="profile.jpg"
    fi
    if [ "$SIZE" -gt 0 ]; then
        echo -e "${GREEN}✅ Profile image found: $FILE ($(numfmt --to=iec-i --suffix=B $SIZE))${NC}"
    else
        echo -e "${RED}❌ Profile image is empty${NC}"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo -e "${RED}❌ Profile image not found${NC}"
    echo -e "${YELLOW}   Please add your profile image as profile.png or profile.jpg${NC}"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Check resume PDF
echo "📄 Checking Resume PDF..."
if [ -f "assets/resume/Divya_Pawar_Resume.pdf" ]; then
    SIZE=$(wc -c < "assets/resume/Divya_Pawar_Resume.pdf")
    if [ "$SIZE" -gt 0 ]; then
        echo -e "${GREEN}✅ Resume PDF found ($(numfmt --to=iec-i --suffix=B $SIZE))${NC}"
    else
        echo -e "${RED}❌ Resume PDF is empty${NC}"
        ERRORS=$((ERRORS + 1))
    fi
else
    echo -e "${RED}❌ Resume PDF not found at: assets/resume/Divya_Pawar_Resume.pdf${NC}"
    echo -e "${YELLOW}   Please add your resume PDF${NC}"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Check Firebase configuration
echo "🔥 Checking Firebase Configuration..."
if [ -f "lib/firebase_options.dart" ]; then
    if grep -q "YOUR_API_KEY_HERE" "lib/firebase_options.dart"; then
        echo -e "${YELLOW}⚠️  Firebase options file contains placeholder values${NC}"
        echo -e "${YELLOW}   Run: flutterfire configure${NC}"
        echo -e "${YELLOW}   Or manually update: lib/firebase_options.dart${NC}"
        WARNINGS=$((WARNINGS + 1))
    else
        echo -e "${GREEN}✅ Firebase configuration appears to be set${NC}"
    fi
else
    echo -e "${RED}❌ Firebase options file not found${NC}"
    ERRORS=$((ERRORS + 1))
fi
echo ""

# Check dependencies
echo "📦 Checking Dependencies..."
if [ -f "pubspec.lock" ]; then
    echo -e "${GREEN}✅ Dependencies installed (pubspec.lock exists)${NC}"
else
    echo -e "${YELLOW}⚠️  Dependencies not installed${NC}"
    echo -e "${YELLOW}   Run: flutter pub get${NC}"
    WARNINGS=$((WARNINGS + 1))
fi
echo ""

# Check for required files
echo "📂 Checking Project Structure..."
REQUIRED_FILES=(
    "lib/data/models/download_tracking_model.dart"
    "lib/data/services/resume_download_service.dart"
    "lib/presentation/widgets/download_resume_dialog.dart"
    "lib/presentation/pages/downloads_tracking_page.dart"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✅ $file${NC}"
    else
        echo -e "${RED}❌ Missing: $file${NC}"
        ERRORS=$((ERRORS + 1))
    fi
done
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 SETUP SUMMARY"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}🎉 Perfect! Everything is set up correctly!${NC}"
    echo ""
    echo "You can now run your portfolio:"
    echo "  flutter run -d chrome"
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠️  Setup is mostly complete with $WARNINGS warning(s)${NC}"
    echo ""
    echo "Your app should work, but please address the warnings above."
else
    echo -e "${RED}❌ Setup incomplete: $ERRORS error(s), $WARNINGS warning(s)${NC}"
    echo ""
    echo "Please fix the errors above before running the app."
fi

echo ""
echo "For detailed setup instructions, see:"
echo "  - QUICK_START.md (fastest way to get started)"
echo "  - IMPLEMENTATION_SUMMARY.md (complete overview)"
echo "  - DOWNLOAD_TRACKING_SETUP.md (Firebase details)"
echo ""

exit $ERRORS

