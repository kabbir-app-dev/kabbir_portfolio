import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _floatControllers;
  final List<double> _floatingOffsets = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    _floatControllers = List.generate(3, (index) {
      return AnimationController(
        duration: Duration(seconds: 2 + index),
        vsync: this,
      )..repeat(reverse: true);
    });

    for (int i = 0; i < _floatControllers.length; i++) {
      final index = i;
      _floatControllers[i].addListener(() {
        if (mounted) {
          setState(() {
            _floatingOffsets[index] = 10 * _floatControllers[index].value;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _floatControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 28 : 36,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Let\'s work together on your next project',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: isMobile ? 14 : 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 800) {
                return Column(
                  children: [
                    _buildContactCard(
                      context,
                      icon: Icons.business_center,
                      title: 'LinkedIn',
                      color: Colors.blue.shade700,
                      onTap: () =>
                          launchUrl(Uri.parse(AppConstants.linkedInUrl)),
                      copyAction: () =>
                          _copyToClipboard(context, AppConstants.linkedInUrl),
                      offsetY: _floatingOffsets[0],
                    ),
                    const SizedBox(height: 24),
                    _buildContactCard(
                      context,
                      icon: Icons.chat,
                      title: 'WhatsApp',
                      color: Colors.green.shade500,
                      onTap: () => launchUrl(
                        Uri.parse(
                          'https://wa.me/${AppConstants.whatsAppNumber}',
                        ),
                      ),
                      copyAction: () => _copyToClipboard(
                        context,
                        AppConstants.whatsAppNumber,
                      ),
                      offsetY: _floatingOffsets[1],
                    ),
                    const SizedBox(height: 24),
                    _buildContactCard(
                      context,
                      icon: Icons.email,
                      title: 'Email',
                      color: Colors.red.shade400,
                      onTap: () => launchUrl(
                        Uri.parse('mailto:${AppConstants.emailAddress}'),
                      ),
                      copyAction: () =>
                          _copyToClipboard(context, AppConstants.emailAddress),
                      offsetY: _floatingOffsets[2],
                    ),
                  ],
                );
              }

              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildContactCard(
                    context,
                    icon: Icons.business_center,
                    title: 'LinkedIn',
                    color: Colors.blue.shade700,
                    onTap: () => launchUrl(Uri.parse(AppConstants.linkedInUrl)),
                    copyAction: () =>
                        _copyToClipboard(context, AppConstants.linkedInUrl),
                    offsetY: _floatingOffsets[0],
                  ),
                  _buildContactCard(
                    context,
                    icon: Icons.chat,
                    title: 'WhatsApp',
                    color: Colors.green.shade500,
                    onTap: () => launchUrl(
                      Uri.parse('https://wa.me/${AppConstants.whatsAppNumber}'),
                    ),
                    copyAction: () =>
                        _copyToClipboard(context, AppConstants.whatsAppNumber),
                    offsetY: _floatingOffsets[1],
                  ),
                  _buildContactCard(
                    context,
                    icon: Icons.email,
                    title: 'Email',
                    color: Colors.red.shade400,
                    onTap: () => launchUrl(
                      Uri.parse('mailto:${AppConstants.emailAddress}'),
                    ),
                    copyAction: () =>
                        _copyToClipboard(context, AppConstants.emailAddress),
                    offsetY: _floatingOffsets[2],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
    required VoidCallback copyAction,
    required double offsetY,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return AnimatedBuilder(
      animation: _floatControllers[0],
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, offsetY),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: isMobile ? double.infinity : 280,
              constraints: const BoxConstraints(maxWidth: 350),
              padding: EdgeInsets.all(isMobile ? 20 : 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.2), color.withOpacity(0.1)],
                ),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: color.withOpacity(0.5), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(isMobile ? 16 : 20),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: color.withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                    child: Icon(icon, size: isMobile ? 40 : 50, color: color),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ElevatedButton.icon(
                          onPressed: onTap,
                          icon: Icon(
                            Icons.open_in_new,
                            size: isMobile ? 16 : 18,
                          ),
                          label: Text(isMobile ? 'Open' : 'Open'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 16 : 10,
                              vertical: isMobile ? 10 : 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: OutlinedButton.icon(
                          onPressed: copyAction,
                          icon: Icon(Icons.copy, size: isMobile ? 16 : 18),
                          label: Text(isMobile ? 'Copy' : 'Copy'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: color,
                            side: BorderSide(color: color),
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 16 : 10,
                              vertical: isMobile ? 10 : 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard: $text'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}
