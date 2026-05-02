import 'package:flutter/material.dart';
import 'package:kabir_portfolio/views/sections/project_section.dart';
import 'package:kabir_portfolio/views/sections/service_section.dart';
import 'sections/home_section.dart';

import 'sections/skills_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  int _selectedIndex = 0;

  void _scrollToSection(GlobalKey key, int index) {
    setState(() {
      _selectedIndex = index;
    });

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final isTablet =
        MediaQuery.of(context).size.width >= 900 &&
        MediaQuery.of(context).size.width < 1200;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo
                  Text(
                    'Portfolio',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ).createShader(const Rect.fromLTWH(0, 0, 150, 50)),
                    ),
                  ),

                  // Desktop Navigation
                  if (!isMobile && !isTablet)
                    Row(
                      children: [
                        _buildNavButton('Home', 0, _homeKey),
                        _buildNavButton('Projects', 1, _projectsKey),
                        _buildNavButton('Services', 2, _servicesKey),
                        _buildNavButton('Skills', 3, _skillsKey),
                        _buildNavButton('Contact', 4, _contactKey),
                      ],
                    ),

                  // Tablet Navigation (compact)
                  if (isTablet && !isMobile)
                    Row(
                      children: [
                        _buildNavButton('Home', 0, _homeKey),
                        _buildNavButton('Projects', 1, _projectsKey),
                        _buildNavButton('Services', 2, _servicesKey),
                        _buildNavButton('Skills', 3, _skillsKey),
                        _buildNavButton('Contact', 4, _contactKey),
                      ],
                    ),

                  // Mobile Menu Button
                  if (isMobile)
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.blue),
                      onPressed: () => _showMobileMenu(context),
                      iconSize: 28,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              key: _homeKey,
              child: HomeSection(
                onViewWork: () => _scrollToSection(_projectsKey, 1),
                onHireMe: () => _scrollToSection(_contactKey, 4),
              ),
            ),
            _buildDivider(),
            Container(key: _projectsKey, child: const ProjectsSection()),
            _buildDivider(),
            Container(key: _servicesKey, child: const ServicesSection()),
            _buildDivider(),
            Container(key: _skillsKey, child: const SkillsSection()),
            _buildDivider(),
            Container(key: _contactKey, child: const ContactSection()),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Bottom Navigation Bar for Mobile
      bottomNavigationBar: isMobile
          ? Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      _scrollToSection(_homeKey, 0);
                      break;
                    case 1:
                      _scrollToSection(_projectsKey, 1);
                      break;
                    case 2:
                      _scrollToSection(_servicesKey, 2);
                      break;
                    case 3:
                      _scrollToSection(_skillsKey, 3);
                      break;
                    case 4:
                      _scrollToSection(_contactKey, 4);
                      break;
                  }
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.code),
                    label: 'Projects',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.design_services),
                    label: 'Services',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: 'Skills',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.contact_mail),
                    label: 'Contact',
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.transparent,
            Colors.blue,
            Colors.purple,
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String title, int index, GlobalKey key) {
    final isSelected = _selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => _scrollToSection(key, index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected
                ? Colors.blue.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: 400,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              _buildMobileMenuItem('Home', 0, _homeKey, context),
              _buildMobileMenuItem('Projects', 1, _projectsKey, context),
              _buildMobileMenuItem('Services', 2, _servicesKey, context),
              _buildMobileMenuItem('Skills', 3, _skillsKey, context),
              _buildMobileMenuItem('Contact', 4, _contactKey, context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuItem(
    String title,
    int index,
    GlobalKey key,
    BuildContext context,
  ) {
    return ListTile(
      leading: Icon(
        _getIconForIndex(index),
        color: _selectedIndex == index ? Colors.blue : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: _selectedIndex == index
              ? FontWeight.bold
              : FontWeight.normal,
          color: _selectedIndex == index ? Colors.blue : null,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(key, index);
      },
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.code;
      case 2:
        return Icons.design_services;
      case 3:
        return Icons.school;
      case 4:
        return Icons.contact_mail;
      default:
        return Icons.home;
    }
  }
}
