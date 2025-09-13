import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/mixer_screen.dart';
import 'screens/your_mix_screen.dart';
import 'screens/event_screen.dart';
import 'screens/blind_mixer_screen.dart';
import 'screens/profile_details_screen.dart';
import 'widgets/bottom_nav.dart';
import 'services/subscription_service.dart';

void main() {
  runApp(const MixerApp());
}

class MixerApp extends StatelessWidget {
  const MixerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SubscriptionService(),
      child: MaterialApp(
        title: 'Mixer UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: const Color(0xFF7B1FA2),
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const MixerScreen(),
    const YourMixScreen(),
    const EventScreen(),
    const BlindMixerScreen(),
    const ProfileDetailsScreen(),
  ];

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Current screen
          Positioned.fill(
            child: _screens[_selectedIndex],
          ),

          // Minimal logo (hidden on Blind Mix page = index 3)
          if (_selectedIndex != 3)
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 16,
              child: Text(
                'Mixer',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
