import 'package:flutter/material.dart';
import 'package:kabir_portfolio/model/service_model.dart';

class ServiceCard extends StatefulWidget {
  final ServiceModel service;
  final int index;

  const ServiceCard({super.key, required this.service, required this.index});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with TickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _floatController;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: 0, end: -10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedBuilder(
        animation: _floatAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _floatAnimation.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.service.color.withOpacity(isHovered ? 0.2 : 0.1),
                    widget.service.color.withOpacity(isHovered ? 0.1 : 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: widget.service.color.withOpacity(
                    isHovered ? 0.5 : 0.3,
                  ),
                  width: isHovered ? 2 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.service.color.withOpacity(
                      isHovered ? 0.4 : 0.2,
                    ),
                    blurRadius: isHovered ? 20 : 10,
                    spreadRadius: isHovered ? 5 : 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: widget.service.color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: widget.service.color.withOpacity(0.5),
                        ),
                      ),
                      child: Icon(
                        widget.service.icon,
                        color: widget.service.color,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.service.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.service.description,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
