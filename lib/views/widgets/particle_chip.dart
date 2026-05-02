import 'package:flutter/material.dart';
import '../../controllers/particle_controller.dart';

class ParticleChip extends StatelessWidget {
  final Particle particle;

  const ParticleChip({super.key, required this.particle});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: particle.position.dx - particle.radius,
      top: particle.position.dy - particle.radius,
      child: Container(
        width: particle.radius * 2,
        height: particle.radius * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(particle.radius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              particle.color.withOpacity(0.9),
              particle.color.withOpacity(0.7),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: particle.color.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(particle.radius),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image widget instead of Icon
                Image.asset(
                  particle.imagePath,
                  width: 24,
                  height: 24,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback icon if image fails to load
                    return Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                      size: 24,
                    );
                  },
                ),
                const SizedBox(height: 6),
                Flexible(
                  child: Text(
                    particle.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
