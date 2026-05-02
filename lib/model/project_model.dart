class ProjectModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String detailedDescription;
  final List<String> keyFeatures;
  final List<String> techStack;
  final List<String> screenshots;
  final String storeLink;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.detailedDescription,
    required this.keyFeatures,
    required this.techStack,
    required this.screenshots,
    required this.storeLink,
  });

  static List<ProjectModel> getDummyProjects() {
    return [
      ProjectModel(
        id: '1',
        name: 'STBB',
        description:
            'Help people to find particular blood type in emergency situation',
        imageUrl: 'assets/images/bb_th.png',

        detailedDescription:
            'STBB is a revolutionary app designed to help people find the right blood type during emergency situations. With its advanced search capabilities and real-time updates, users can quickly locate nearby blood centers that match their blood type requirements.  The app features a user-friendly interface, allowing users to easily navigate through the platform and access critical information. ',
        keyFeatures: [
          'Real-time blood type availability',
          'Location-based search for nearby blood centers',
          'User-friendly interface',
          'Role based authentication',
        ],
        techStack: ['Flutter', 'Google Maps', 'Provider', 'Rest API'],
        screenshots: [
          'assets/images/bb_1.webp',
          'assets/images/bb_2.webp',
          'assets/images/bb_3.webp',
        ],
        storeLink: 'https://apps.apple.com/in/app/stbb/id6636482794',
      ),
      ProjectModel(
        id: '2',
        name: 'M-Paridarshan',
        description: 'West bengal govt initiative for school inspection ',
        imageUrl: 'assets/images/mp_th.png',
        detailedDescription:
            'M-Paridarshan is a comprehensive mobile application developed for the West Bengal government to facilitate school inspections. The app streamlines the inspection process by providing inspectors with a user-friendly interface to record observations, take photos, and generate reports on-site. With features like offline data entry, real-time synchronization, and GPS tagging, M-Paridarshan ensures accurate and efficient documentation of school conditions. The app also includes a dashboard for administrators to monitor inspection progress and analyze data for informed decision-making.',
        keyFeatures: [
          'Offline data entry for inspections',
          'Real-time synchronization with central database',
          'GPS tagging for accurate location tracking',
          'Photo capture and annotation for evidence collection',
          'Dashboard for administrators to monitor inspection progress',
        ],
        techStack: [
          'Flutter',
          'Dart',
          'Provider',
          'Rest API',
          'Google Map API',
        ],
        screenshots: [
          'assets/images/mp_1.webp',
          'assets/images/mp_2.webp',
          'assets/images/mp_3.webp',
        ],
        storeLink:
            'https://play.google.com/store/apps/details?id=com.albatross.mparidarshan',
      ),
      ProjectModel(
        id: '3',
        name: 'SponicHR',
        description:
            'A complete HR management system for small and medium businesses',
        imageUrl: 'assets/images/sh_th.png',
        detailedDescription:
            'SponicHR is a comprehensive HR management system designed for small and medium businesses. The app offers a wide range of features to streamline HR processes, including punch in/punch out tracking, leave management, attendance monitoring, employee details management, project assignment, notifications and reminders, and report generation. Additionally, SponicHR includes a chat feature that allows employees assigned to the same project to communicate effectively. The app also features a social media-like feed where employees can post about their work, share achievements, and celebrate office moments, fostering a sense of community within the organization.',

        keyFeatures: [
          'Punch in/punch out tracking',
          'Leave management system',
          'Attendance monitoring',
          'Employee details management',
          'Project assignment and tracking',
          'Notifications and reminders for important events',
          'Report generation for HR analytics',
          'Chat feature for project-based communication',
          'Social media-like feed for employee engagement',
        ],
        techStack: ['Flutter', 'Dart', 'Provider', 'Rest API', 'Firebase'],
        screenshots: [
          'assets/images/sh_1.png',
          'assets/images/sh_2.png',
          'assets/images/sh_3.png',
          'assets/images/sh_4.png',
          'assets/images/sh_5.png',
          'assets/images/sh_6.png',
        ],
        storeLink:
            'https://play.google.com/store/apps/details?id=com.xentix.swc&hl=en_IN',
      ),
    ];
  }
}
