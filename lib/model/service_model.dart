import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  ServiceModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  static List<ServiceModel> getServices() {
    return [
      ServiceModel(
        title: 'Custom App Development',
        description: 'End-to-end Flutter apps from concept to deployment',
        icon: Icons.code,
        color: Colors.blue,
      ),
      ServiceModel(
        title: 'UI/UX Design',
        description: 'Beautiful, intuitive interfaces with smooth animations',
        icon: Icons.design_services,
        color: Colors.purple,
      ),
      ServiceModel(
        title: 'API Integration',
        description: 'RESTful & GraphQL APIs, Firebase backend',
        icon: Icons.cloud_queue,
        color: Colors.green,
      ),
      ServiceModel(
        title: 'Performance Optimization',
        description: '60fps animations, memory management, build optimization',
        icon: Icons.speed,
        color: Colors.orange,
      ),
      ServiceModel(
        title: 'State Management',
        description: 'Provider, Riverpod, Bloc, GetX implementation',
        icon: Icons.account_tree,
        color: Colors.red,
      ),
      ServiceModel(
        title: 'Testing & Debugging',
        description: 'Unit, widget, integration tests and debugging',
        icon: Icons.bug_report,
        color: Colors.teal,
      ),
      ServiceModel(
        title: 'App Deployment',
        description: 'Play Store & App Store publishing',
        icon: Icons.cloud_upload,
        color: Colors.indigo,
      ),
      ServiceModel(
        title: 'Maintenance & Support',
        description: 'Ongoing updates, bug fixes, and feature additions',
        icon: Icons.support_agent,
        color: Colors.pink,
      ),
    ];
  }
}
