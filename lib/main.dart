import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'presentation/sections/hero_section.dart';
import 'presentation/sections/about_section.dart';
import 'presentation/sections/projects_section.dart';
import 'presentation/sections/certifications_section.dart';
import 'presentation/sections/contact_section.dart';
import 'presentation/widgets/portfolio_header.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // Firebase initialization failed - app will work without tracking
    debugPrint('Firebase initialization failed: $e');
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divya Pawar - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getLightTheme(),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();
  int _currentSection = 0;

  final List<Widget> _sections = const [
    HeroSection(),
    AboutSection(),
    ProjectsSection(),
    CertificationsSection(),
    ContactSection(),
  ];

  @override
  void initState() {
    super.initState();
    _itemPositionsListener.itemPositions.addListener(_onScroll);
  }

  void _onScroll() {
    final positions = _itemPositionsListener.itemPositions.value;
    if (positions.isNotEmpty) {
      // Find the section that is most visible on screen
      final visibleSection = positions
          .where((position) => 
              position.itemLeadingEdge < 0.5 && 
              position.itemTrailingEdge > 0.5)
          .toList();
      
      if (visibleSection.isNotEmpty) {
        // Get the first visible section
        final mostVisible = visibleSection.first;
        if (_currentSection != mostVisible.index) {
          setState(() {
            _currentSection = mostVisible.index;
          });
        }
      } else if (positions.isNotEmpty) {
        // Fallback: use the section with largest visible portion
        final mostVisible = positions.reduce((a, b) {
          final aVisible = (a.itemTrailingEdge - a.itemLeadingEdge).abs();
          final bVisible = (b.itemTrailingEdge - b.itemLeadingEdge).abs();
          return aVisible > bVisible ? a : b;
        });
        
        if (_currentSection != mostVisible.index) {
          setState(() {
            _currentSection = mostVisible.index;
          });
        }
      }
    }
  }

  void _scrollToSection(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PortfolioHeader(
            onMenuItemTap: _scrollToSection,
            currentSection: _currentSection,
          ),
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: _sections.length,
              itemBuilder: (context, index) => _sections[index],
              itemScrollController: _itemScrollController,
              itemPositionsListener: _itemPositionsListener,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scrollToSection(0),
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
