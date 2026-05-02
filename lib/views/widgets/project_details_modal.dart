// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:kabir_portfolio/model/project_model.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ProjectDetailModal extends StatelessWidget {
//   final ProjectModel project;

//   const ProjectDetailModal({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.all(20),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.9,
//         height: MediaQuery.of(context).size.height * 0.85,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Theme.of(context).brightness == Brightness.dark
//                   ? Colors.grey[900]!.withOpacity(0.95)
//                   : Colors.white.withOpacity(0.95),
//               Theme.of(context).brightness == Brightness.dark
//                   ? Colors.grey[800]!.withOpacity(0.95)
//                   : Colors.grey[100]!.withOpacity(0.95),
//             ],
//           ),
//           border: Border.all(color: Colors.blue.withOpacity(0.3), width: 2),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               blurRadius: 30,
//               spreadRadius: 5,
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Stack(
//             children: [
//               Row(
//                 children: [
//                   // Left side - Details
//                   Expanded(
//                     flex: 1,
//                     child: Padding(
//                       padding: const EdgeInsets.all(24),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             project.name,
//                             style: Theme.of(context).textTheme.headlineMedium
//                                 ?.copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   foreground: Paint()
//                                     ..shader =
//                                         const LinearGradient(
//                                           colors: [Colors.blue, Colors.purple],
//                                         ).createShader(
//                                           const Rect.fromLTWH(0, 0, 200, 50),
//                                         ),
//                                 ),
//                           ),
//                           const SizedBox(height: 16),
//                           Expanded(
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   _buildInfoCard(
//                                     'Description',
//                                     project.detailedDescription,
//                                     Icons.description,
//                                   ),
//                                   const SizedBox(height: 20),
//                                   _buildInfoCard(
//                                     'Key Features',
//                                     null,
//                                     Icons.star,
//                                     children: project.keyFeatures
//                                         .map(
//                                           (f) => Padding(
//                                             padding: const EdgeInsets.only(
//                                               left: 24,
//                                               bottom: 8,
//                                             ),
//                                             child: Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 const Icon(
//                                                   Icons.check_circle,
//                                                   color: Colors.green,
//                                                   size: 20,
//                                                 ),
//                                                 const SizedBox(width: 8),
//                                                 Expanded(child: Text(f)),
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                         .toList(),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   _buildInfoCard(
//                                     'Tech Stack',
//                                     null,
//                                     Icons.code,
//                                     child: Wrap(
//                                       spacing: 8,
//                                       runSpacing: 8,
//                                       children: project.techStack
//                                           .map(
//                                             (tech) => Container(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                     horizontal: 12,
//                                                     vertical: 6,
//                                                   ),
//                                               decoration: BoxDecoration(
//                                                 color: Colors.blue.withOpacity(
//                                                   0.2,
//                                                 ),
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 border: Border.all(
//                                                   color: Colors.blue
//                                                       .withOpacity(0.5),
//                                                 ),
//                                               ),
//                                               child: Text(
//                                                 tech,
//                                                 style: const TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                           .toList(),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 24),
//                                   Center(
//                                     child: ElevatedButton.icon(
//                                       onPressed: () => launchUrl(
//                                         Uri.parse(project.storeLink),
//                                       ),
//                                       icon: const Icon(Icons.store),
//                                       label: const Text(
//                                         'View on Store',
//                                         style: TextStyle(fontSize: 16),
//                                       ),
//                                       style: ElevatedButton.styleFrom(
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 32,
//                                           vertical: 14,
//                                         ),
//                                         backgroundColor: Colors.blue,
//                                         foregroundColor: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                             30,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Right side - Carousel
//                   Expanded(
//                     flex: 1,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Colors.blue.withOpacity(0.1),
//                             Colors.purple.withOpacity(0.05),
//                           ],
//                         ),
//                       ),
//                       child: CarouselSlider(
//                         options: CarouselOptions(
//                           height: double.infinity,
//                           autoPlay: true,
//                           enlargeCenterPage: true,
//                           viewportFraction: 0.8,
//                           autoPlayInterval: const Duration(seconds: 3),
//                         ),
//                         items: project.screenshots.map((url) {
//                           return Container(
//                             margin: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               image: DecorationImage(
//                                 image: NetworkImage(url),
//                                 fit: BoxFit.cover,
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.3),
//                                   blurRadius: 15,
//                                 ),
//                               ],
//                             ),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20),
//                                     gradient: LinearGradient(
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter,
//                                       colors: [
//                                         Colors.transparent,
//                                         Colors.black.withOpacity(0.5),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const Positioned(
//                                   bottom: 20,
//                                   left: 20,
//                                   child: Text(
//                                     'App Screenshot',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // Close button
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.5),
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(Icons.close, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard(
//     String title,
//     String? content,
//     IconData icon, {
//     List<Widget>? children,
//     Widget? child,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Colors.blue.withOpacity(0.1),
//             Colors.purple.withOpacity(0.05),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Colors.blue.withOpacity(0.3)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: Colors.blue, size: 24),
//               const SizedBox(width: 8),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           if (content != null)
//             Text(content, style: const TextStyle(height: 1.5)),
//           if (children != null) ...children,
//           if (child != null) child,
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kabir_portfolio/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailModal extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailModal({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF1a1a2e).withOpacity(0.98)
                  : const Color(0xFFf5f5ff).withOpacity(0.98),
              Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF16213e).withOpacity(0.98)
                  : const Color(0xFFffffff).withOpacity(0.98),
            ],
          ),
          border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 40,
              spreadRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            // Left side - Details (40% width)
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoCard(
                              'Description',
                              project.detailedDescription,
                              Icons.description,
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 20),
                            _buildInfoCard(
                              'Key Features',
                              null,
                              Icons.star,
                              color: Colors.amber,
                              children: project.keyFeatures
                                  .map(
                                    (f) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.green.withOpacity(
                                                0.2,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              f,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                height: 1.4,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(height: 20),
                            _buildInfoCard(
                              'Tech Stack',
                              null,
                              Icons.code,
                              color: Colors.purple,
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: project.techStack
                                    .map(
                                      (tech) => Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue.withOpacity(0.2),
                                              Colors.purple.withOpacity(0.2),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          border: Border.all(
                                            color: Colors.blue.withOpacity(0.5),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          tech,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Colors.blue, Colors.purple],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.4),
                                      blurRadius: 15,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () =>
                                      launchUrl(Uri.parse(project.storeLink)),
                                  icon: const Icon(Icons.shopping_cart),
                                  label: const Text(
                                    'View on Store',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 14,
                                    ),
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.white,
                                    shadowColor: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right side - Carousel (60% width)
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.withOpacity(0.05),
                      Colors.purple.withOpacity(0.02),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: double.infinity,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.65,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 800,
                          ),
                          pauseAutoPlayOnTouch: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: project.screenshots.map((url) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Container(
                                            color: Colors.grey[900],
                                            child: const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          );
                                        },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[800],
                                        child: const Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.broken_image,
                                                size: 50,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Failed to load image',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.7),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 20,
                                    left: 20,
                                    right: 20,
                                    child: Text(
                                      'App Screenshot',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Close button
        Positioned(
          top: 15,
          right: 15,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 24),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            // Carousel on top for mobile
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withOpacity(0.05),
                    Colors.purple.withOpacity(0.02),
                  ],
                ),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: project.screenshots.map((url) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[800],
                            child: const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Details below
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 20),
                      _buildInfoCard(
                        'Description',
                        project.detailedDescription,
                        Icons.description,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 16),
                      _buildInfoCard(
                        'Key Features',
                        null,
                        Icons.star,
                        color: Colors.amber,
                        children: project.keyFeatures
                            .map(
                              (f) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(child: Text(f)),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoCard(
                        'Tech Stack',
                        null,
                        Icons.code,
                        color: Colors.purple,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.techStack
                              .map(
                                (tech) => Chip(
                                  label: Text(tech),
                                  backgroundColor: Colors.blue.withOpacity(0.2),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              launchUrl(Uri.parse(project.storeLink)),
                          icon: const Icon(Icons.store),
                          label: const Text('View on Store'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // Close button
        Positioned(
          top: 15,
          right: 15,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.pink],
                ).createShader(const Rect.fromLTWH(0, 0, 300, 50)),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    String? content,
    IconData icon, {
    List<Widget>? children,
    Widget? child,
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.08),
            Colors.purple.withOpacity(0.04),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: (color ?? Colors.blue).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (color ?? Colors.blue).withOpacity(0.2),
                      (color ?? Colors.blue).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color ?? Colors.blue, size: 22),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color ?? Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (content != null)
            Text(content, style: const TextStyle(height: 1.6, fontSize: 14)),
          if (children != null) ...children,
          if (child != null) child,
        ],
      ),
    );
  }
}
