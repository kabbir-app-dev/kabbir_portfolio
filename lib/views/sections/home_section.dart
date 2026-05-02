import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../controllers/particle_controller.dart';
import '../../utils/constants.dart';
import '../widgets/particle_chip.dart';
import 'package:get/get.dart';

class HomeSection extends StatefulWidget {
  final VoidCallback onViewWork;
  final VoidCallback onHireMe;

  const HomeSection({
    super.key,
    required this.onViewWork,
    required this.onHireMe,
  });

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final ParticleController particleController = Get.put(ParticleController());
  String displayedText = "";
  int currentIndex = 0;
  final String fullText =
      "Crafting beautiful, performant cross-platform apps with Flutter. 5+ years of experience delivering production-grade solutions.";
  Timer? _typingTimer;

  bool _isLoading = true;

  // Updated chipData with asset images instead of icons
  final List<Map<String, dynamic>> chipData = [
    {
      'text': 'Flutter',
      'image': 'assets/logos/flutter.png',
      'color': Colors.blue,
    },
    {'text': 'Dart', 'image': 'assets/logos/dart.png', 'color': Colors.cyan},
    // android and ios logos
    {
      'text': 'Android',
      'image': 'assets/logos/android.png',
      'color': Colors.teal.shade700,
    },
    {'text': 'iOS', 'image': 'assets/logos/ios.png', 'color': Colors.grey},
    {
      'text': 'Firebase',
      'image': 'assets/logos/firebase.png',
      'color': Colors.orange,
    },
    {
      'text': 'UI/UX',
      'image': 'assets/logos/design.png',
      'color': Colors.purple,
    },
    // {
    //   'text': 'API',
    //   'image': 'assets/logos/rest_api.png',
    //   'color': Colors.green,
    // },
    // {
    //   'text': 'Anim',
    //   'image': 'assets/logos/animation.png',
    //   'color': Colors.pink,
    // },
    // {'text': 'Bloc', 'image': 'assets/logos/cube.png', 'color': Colors.teal},
    // {
    //   'text': 'Riverpod',
    //   'image': 'assets/logos/flutter.png',
    //   'color': Colors.indigo,
    // },
    // {
    //   'text': 'GetX',
    //   'image': 'assets/logos/dart.png',
    //   'color': Colors.blueGrey,
    // },
    // {'text': 'Git', 'image': 'assets/logos/git.png', 'color': Colors.brown},
    // {
    //   'text': 'CI/CD',
    //   'image': 'assets/logos/cicd.png',
    //   'color': Colors.deepPurple,
    // },
    // {
    //   'text': 'Testing',
    //   'image': 'assets/logos/testing.png',
    //   'color': Colors.deepOrange,
    // },
    // security notification, video call, chat payment logos
    {
      'text': 'Alert',
      'image': 'assets/logos/notification.png',
      'color': Colors.amber,
    },
    {
      'text': 'Security',
      'image': 'assets/logos/security.png',
      'color': Colors.redAccent,
    },
    {
      'text': 'V-Call',
      'image': 'assets/logos/video_call.png',
      'color': Colors.blueAccent,
    },
    {
      'text': 'Chat',
      'image': 'assets/logos/chat.png',
      'color': Colors.greenAccent,
    },
    {
      'text': 'Payment',
      'image': 'assets/logos/payment.png',
      'color': Colors.orangeAccent,
    },
  ];

  final List<Map<String, dynamic>> achievements = [
    {'text': '🏆 10+ Apps Delivered', 'color': Colors.amber},
    {'text': '💡 24/7 Support', 'color': Colors.blue},
    {'text': '⚡ 60fps UI', 'color': Colors.purple},
    {'text': '🔒 Secure Apps', 'color': Colors.red},
    {'text': '🚀 Fast Delivery', 'color': Colors.green},
    {'text': '📞 Free Consultation', 'color': Colors.teal},
    {'text': '🎨 Premium UI/UX', 'color': Colors.pink},
  ];

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final size = MediaQuery.of(context).size;
        final rightSectionWidth = (size.width / 2) - 60;
        final rightSectionHeight = size.height - 100;

        particleController.initializeParticlesRandomly(
          Size(rightSectionWidth, rightSectionHeight),
          chipData,
        );
        particleController.startAnimation(
          Size(rightSectionWidth, rightSectionHeight),
        );
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  void _startTypingAnimation() {
    _typingTimer = Timer.periodic(const Duration(milliseconds: 35), (timer) {
      if (mounted && currentIndex < fullText.length) {
        setState(() {
          displayedText += fullText[currentIndex];
          currentIndex++;
        });
      } else {
        _typingTimer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    particleController.stopAnimation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 20 : 0,
      ),
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: _buildLeftContent(context),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _buildRightContent(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          _buildLeftContent(context),
          const SizedBox(height: 40),
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: _buildRightContent(),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLeftContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          AppConstants.heroName,
          colors: const [Colors.blue, Colors.purple, Colors.pink],
          style: TextStyle(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),

        Text(
          AppConstants.heroTitle,
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),

        Container(
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.purple.withOpacity(0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blue.withOpacity(0.3)),
          ),
          child: Text(
            displayedText.isEmpty ? " " : displayedText,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              height: 1.5,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 24),

        Wrap(
          spacing: isMobile ? 8 : 12,
          runSpacing: isMobile ? 8 : 12,
          children: achievements.map((achievement) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 6 : 8,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    (achievement['color'] as Color).withOpacity(0.2),
                    (achievement['color'] as Color).withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: (achievement['color'] as Color).withOpacity(0.5),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (achievement['color'] as Color).withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Text(
                achievement['text'],
                style: TextStyle(
                  color: achievement['color'],
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 11 : 13,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),

        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: widget.onViewWork,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 12 : 15,
                    horizontal: isMobile ? 16 : 20,
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'View Work',
                  style: TextStyle(
                    fontSize: isMobile ? 15 : 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton(
                onPressed: widget.onHireMe,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 12 : 15,
                    horizontal: isMobile ? 16 : 20,
                  ),
                  foregroundColor: Colors.blue,
                  side: const BorderSide(color: Colors.blue, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Hire Me',
                  style: TextStyle(
                    fontSize: isMobile ? 15 : 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRightContent() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.blue));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Update particle bounds when container size changes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted &&
              constraints.maxWidth > 0 &&
              constraints.maxHeight > 0) {
            particleController.updateContainerSize(
              Size(constraints.maxWidth, constraints.maxHeight),
            );
          }
        });

        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Obx(
            () => Stack(
              clipBehavior: Clip.none,
              children: [
                for (int i = 0; i < particleController.particles.length; i++)
                  ParticleChip(particle: particleController.particles[i]),
              ],
            ),
          ),
        );
      },
    );
  }
}
