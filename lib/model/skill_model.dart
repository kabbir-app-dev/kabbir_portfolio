class SkillModel {
  final String name;
  final double percentage;
  final String category;

  SkillModel({
    required this.name,
    required this.percentage,
    required this.category,
  });

  static List<SkillModel> getSkills() {
    return [
      SkillModel(name: 'Flutter', percentage: 0.95, category: 'Framework'),
      SkillModel(name: 'Dart', percentage: 0.95, category: 'Language'),
      SkillModel(name: 'Firebase', percentage: 0.90, category: 'Backend'),
      SkillModel(name: 'REST APIs', percentage: 0.92, category: 'Integration'),
      SkillModel(name: 'Provider', percentage: 0.90, category: 'State Mgmt'),
      SkillModel(name: 'Riverpod', percentage: 0.85, category: 'State Mgmt'),
      SkillModel(name: 'Bloc', percentage: 0.88, category: 'State Mgmt'),
      SkillModel(name: 'UI/UX Design', percentage: 0.85, category: 'Design'),
      SkillModel(name: 'Animations', percentage: 0.90, category: 'UI'),
      SkillModel(name: 'Git', percentage: 0.92, category: 'Tools'),
      SkillModel(name: 'CI/CD', percentage: 0.80, category: 'DevOps'),
      SkillModel(name: 'SQLite/Hive', percentage: 0.85, category: 'Database'),
    ];
  }
}
