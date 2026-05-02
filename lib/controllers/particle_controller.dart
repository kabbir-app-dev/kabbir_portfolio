import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Particle {
  Offset position;
  Offset velocity;
  final double radius;
  final Color color;
  final String imagePath;
  final String text;

  Particle({
    required this.position,
    required this.velocity,
    required this.radius,
    required this.color,
    required this.imagePath,
    required this.text,
  });
}

class ParticleController extends GetxController {
  final RxList<Particle> particles = <Particle>[].obs;
  final RxBool isRunning = true.obs;
  Timer? _animationTimer;
  final Random _random = Random();
  Size _currentSize = Size.zero;
  bool _isDisposed = false;

  void initializeParticlesRandomly(
    Size size,
    List<Map<String, dynamic>> chipData,
  ) {
    if (_isDisposed) return;
    particles.clear();
    _currentSize = size;

    final int particleCount = chipData.length;

    for (int i = 0; i < particleCount; i++) {
      final chip = chipData[i];
      _addNewParticle(chip);
    }
  }

  void _addNewParticle(Map<String, dynamic> chip) {
    if (_currentSize.width == 0 || _currentSize.height == 0) return;

    // Random position anywhere within bounds
    double randomX = 20 + _random.nextDouble() * (_currentSize.width - 40);
    double randomY = 20 + _random.nextDouble() * (_currentSize.height - 40);

    // Random angle (0 to 360 degrees)
    double angle = _random.nextDouble() * 2 * pi;
    const double constantSpeed = 1.8;

    Offset velocity = Offset(
      constantSpeed * cos(angle),
      constantSpeed * sin(angle),
    );

    particles.add(
      Particle(
        position: Offset(randomX, randomY),
        velocity: velocity,
        radius: 30.0 + _random.nextDouble() * 15,
        color: chip['color'],
        imagePath: chip['image'],
        text: chip['text'],
      ),
    );
  }

  void updateContainerSize(Size newSize) {
    if (!_isDisposed && newSize.width > 0 && newSize.height > 0) {
      _currentSize = newSize;
    }
  }

  void startAnimation(Size size) {
    if (_isDisposed) return;
    _currentSize = size;
    _animationTimer?.cancel();
    _animationTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!_isDisposed && isRunning.value && particles.isNotEmpty) {
        updateParticles();
      }
    });
  }

  void updateParticles() {
    if (!isRunning.value || _isDisposed) return;

    final List<Particle> currentParticles = List.from(particles);

    for (int i = 0; i < currentParticles.length; i++) {
      final particle = currentParticles[i];

      // Update position
      particle.position += particle.velocity;

      // Check if particle is out of bounds
      bool isOutOfBounds = false;

      // Add padding to make disappearance smoother
      if (particle.position.dx + particle.radius < -50 ||
          particle.position.dx - particle.radius > _currentSize.width + 50 ||
          particle.position.dy + particle.radius < -50 ||
          particle.position.dy - particle.radius > _currentSize.height + 50) {
        isOutOfBounds = true;
      }

      // If out of bounds, respawn with new random position but keep same properties
      if (isOutOfBounds) {
        // Get the chip data for this particle
        final chipData = {
          'text': particle.text,
          'image': particle.imagePath,
          'color': particle.color,
        };

        // Create new particle at random position
        double newX = 20 + _random.nextDouble() * (_currentSize.width - 40);
        double newY = 20 + _random.nextDouble() * (_currentSize.height - 40);
        double newAngle = _random.nextDouble() * 2 * pi;
        const double constantSpeed = 1.8;

        currentParticles[i] = Particle(
          position: Offset(newX, newY),
          velocity: Offset(
            constantSpeed * cos(newAngle),
            constantSpeed * sin(newAngle),
          ),
          radius: particle.radius,
          color: particle.color,
          imagePath: particle.imagePath,
          text: particle.text,
        );
      }
    }

    // Particle to particle collisions
    for (int i = 0; i < currentParticles.length; i++) {
      for (int j = i + 1; j < currentParticles.length; j++) {
        final p1 = currentParticles[i];
        final p2 = currentParticles[j];

        final dx = p1.position.dx - p2.position.dx;
        final dy = p1.position.dy - p2.position.dy;
        final distance = sqrt(dx * dx + dy * dy);
        final minDistance = p1.radius + p2.radius;

        if (distance < minDistance && distance > 0.01) {
          // Separate particles
          final overlap = minDistance - distance;
          final angle = atan2(dy, dx);
          final moveX = cos(angle) * (overlap / 2);
          final moveY = sin(angle) * (overlap / 2);

          p1.position = Offset(p1.position.dx + moveX, p1.position.dy + moveY);
          p2.position = Offset(p2.position.dx - moveX, p2.position.dy - moveY);

          // Calculate new velocities (elastic collision)
          final nx = cos(angle);
          final ny = sin(angle);

          final v1n = p1.velocity.dx * nx + p1.velocity.dy * ny;
          final v2n = p2.velocity.dx * nx + p2.velocity.dy * ny;

          if (v1n - v2n < 0) {
            const restitution = 1.0;
            final impulse = (1 + restitution) * (v2n - v1n);

            p1.velocity = Offset(
              p1.velocity.dx + impulse * nx,
              p1.velocity.dy + impulse * ny,
            );
            p2.velocity = Offset(
              p2.velocity.dx - impulse * nx,
              p2.velocity.dy - impulse * ny,
            );

            // Maintain constant speed
            void normalizeSpeed(Particle p) {
              final currentSpeed = sqrt(
                p.velocity.dx * p.velocity.dx + p.velocity.dy * p.velocity.dy,
              );
              if (currentSpeed > 0) {
                const targetSpeed = 1.8;
                final scale = targetSpeed / currentSpeed;
                p.velocity = Offset(
                  p.velocity.dx * scale,
                  p.velocity.dy * scale,
                );
              }
            }

            normalizeSpeed(p1);
            normalizeSpeed(p2);
          }
        }
      }
    }

    if (!_isDisposed) {
      particles.value = currentParticles;
    }
  }

  void stopAnimation() {
    isRunning.value = false;
    _animationTimer?.cancel();
    _animationTimer = null;
  }

  @override
  void onClose() {
    _isDisposed = true;
    stopAnimation();
    particles.clear();
    super.onClose();
  }
}
