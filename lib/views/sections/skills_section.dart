import 'package:flutter/material.dart';
import 'package:kabir_portfolio/model/skill_model.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with TickerProviderStateMixin {
  late List<AnimationController> _floatControllers;
  final List<double> _floatingOffsets = [];

  @override
  void initState() {
    super.initState();
    final skills = SkillModel.getSkills();
    _floatControllers = List.generate(
      skills.length,
      (index) => AnimationController(
        duration: Duration(seconds: 2 + (index % 3)),
        vsync: this, // Now works with TickerProviderStateMixin
      )..repeat(reverse: true),
    );

    _floatingOffsets.addAll(List.filled(skills.length, 0.0));

    for (int i = 0; i < _floatControllers.length; i++) {
      final index = i;
      _floatControllers[i].addListener(() {
        if (mounted) {
          setState(() {
            _floatingOffsets[index] = 5 * _floatControllers[index].value;
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
    final skills = SkillModel.getSkills();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          Text(
            'Technical Skills',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            'Technologies and tools I work with',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1200
                  ? 4
                  : constraints.maxWidth > 800
                  ? 3
                  : constraints.maxWidth > 600
                  ? 2
                  : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return Transform.translate(
                    offset: Offset(0, _floatingOffsets[index]),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue.withOpacity(0.15),
                            Colors.purple.withOpacity(0.08),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  _getSkillIcon(skill.name),
                                  color: Colors.blue,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  skill.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: skill.percentage,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Colors.blue, Colors.purple],
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${(skill.percentage * 100).toInt()}%',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  IconData _getSkillIcon(String skillName) {
    switch (skillName.toLowerCase()) {
      case 'flutter':
        return Icons.mobile_friendly;
      case 'dart':
        return Icons.code;
      case 'firebase':
        return Icons.cloud;
      case 'rest apis':
        return Icons.api;
      case 'provider':
      case 'riverpod':
      case 'bloc':
        return Icons.account_tree;
      case 'ui/ux design':
        return Icons.design_services;
      case 'animations':
        return Icons.animation;
      case 'git':
        return Icons.merge;
      case 'ci/cd':
        return Icons.build;
      default:
        return Icons.code;
    }
  }
}
