import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/job_provider.dart';
import 'providers/profile_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/applications_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/employer_dashboard.dart';
import 'screens/help_support_screen.dart';

void main() {
  runApp(const HireMeApp());
}

class HireMeApp extends StatelessWidget {
  const HireMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => JobProvider()),
            ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ],
          child: MaterialApp(
            title: 'HireMe',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.blue,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              colorSchemeSeed: Colors.blue,
            ),
            themeMode: ThemeMode.system,
            builder: (context, child) {
              if (isMobile) return child!;

              // Desktop/Web layout wrapped in mobile-like container
              return Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "This app is best viewed in mobile size.\nPlease zoom out or resize your browser.",
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 430,
                        height: 880,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: child!,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            home: const SplashScreen(),
            routes: {
              '/onboarding': (context) => const OnboardingScreen(),
              '/login': (context) => const LoginScreen(),
              '/home': (context) => const MainScreen(),
              '/employer': (context) => const EmployerDashboard(),
              '/settings': (context) => const SettingsScreen(),
              '/help': (context) => const HelpSupportScreen(),
            },
          ),
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ApplicationsScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work),
            label: 'Applications',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
