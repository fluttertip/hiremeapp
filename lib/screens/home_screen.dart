import 'package:flutter/material.dart';
import 'package:hiremeapp/screens/applications_screen.dart';
import 'package:hiremeapp/screens/chat_screen.dart';
import 'package:hiremeapp/screens/profile_screen.dart';
import 'package:hiremeapp/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import '../providers/job_provider.dart';
import '../widgets/job_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/filter_modal.dart';
import 'job_details_screen.dart';
import 'post_job_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final _screens = [
      MainHomeScreen(),
      ApplicationsScreen(),
      ChatScreen(),
      ProfileScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases),
            label: 'Applications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
      appBar: AppBar(
        title: const Text('HireMe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Navigate to notifications screen
            },
          ),
        ],
      ),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  String _searchQuery = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    setState(() => _isLoading = true);
    // Simulate loading delay
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const FilterModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadJobs,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchBar(
                    onChanged: (value) {
                      setState(() => _searchQuery = value);
                    },
                    onFilterPressed: _showFilterModal,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Featured Jobs',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<JobProvider>(
                    builder: (context, jobProvider, child) {
                      final featuredJobs = jobProvider.featuredJobs;
                      return SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: featuredJobs.length,
                          itemBuilder: (context, index) {
                            final job = featuredJobs[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: SizedBox(
                                width: 280,
                                child: JobCard(
                                  job: job,
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => JobDetailsScreen(job: job),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Recent Jobs',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else
            Consumer<JobProvider>(
              builder: (context, jobProvider, child) {
                final jobs = _searchQuery.isEmpty
                    ? jobProvider.jobs
                    : jobProvider.searchJobs(_searchQuery);
                if (jobs.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(child: Text('No jobs found')),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final job = jobs[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: JobCard(
                          job: job,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => JobDetailsScreen(job: job),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      );
                    }, childCount: jobs.length),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
