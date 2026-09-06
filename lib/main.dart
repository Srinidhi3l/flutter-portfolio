import 'package:flutter/material.dart';

void main() {
  runApp(const SrinidhiPortfolioApp());
}

const Color primaryBlue = Color(0xFF4054B2);
const Color lightBlue = Color(0xFFE9ECFA);
const Color pageBackground = Color(0xFFF8F9FC);

class SrinidhiPortfolioApp extends StatelessWidget {
  const SrinidhiPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A. Srinidhi | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
        fontFamily: 'Arial',
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;

  const AppHeader({
    super.key,
    required this.title,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBack
          ? IconButton(
              tooltip: 'Back',
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class PortfolioButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const PortfolioButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 20),
        label: Text(
          label,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final double radius;

  const Avatar({super.key, this.radius = 82});

  @override
  Widget build(BuildContext context) {
    // To use a real photo later:
    // 1. Add your image to assets/images/profile.jpg
    // 2. Add the assets section to pubspec.yaml
    // 3. Replace this CircleAvatar with:
    //    CircleAvatar(radius: radius, backgroundImage: AssetImage(...))
    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFFE3D7FF),
      child: Text(
        'AS',
        style: TextStyle(
          color: primaryBlue,
          fontSize: radius * 0.42,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'My Portfolio'),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 650;

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: compact ? 22 : 40,
                  vertical: compact ? 45 : 70,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Avatar(radius: 82),
                      const SizedBox(height: 28),
                      const Text(
                        'A. SRINIDHI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'B.Tech 3rd Year • Computer Science',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: compact ? 16 : 18,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 760),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'An aspiring Computer Science Engineering student interested in '
                          'machine learning, speech and audio processing and data-driven systems.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            height: 1.55,
                            fontSize: compact ? 16 : 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 14,
                        runSpacing: 14,
                        children: [
                          PortfolioButton(
                            label: 'About Me',
                            icon: Icons.person_outline,
                            onPressed: () => openPage(
                              context,
                              const AboutPage(),
                            ),
                          ),
                          PortfolioButton(
                            label: 'My Projects',
                            icon: Icons.folder_outlined,
                            onPressed: () => openPage(
                              context,
                              const ProjectsPage(),
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
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: 'About Me', showBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                children: [
                  _AboutCard(
                    icon: Icons.person_outline,
                    title: 'About Me',
                    child: Text(
                      'I am A. Srinidhi, a B.Tech 3rd Year Computer Science student. '
                      'I enjoy exploring modern technologies and building practical '
                      'digital solutions that solve real-world problems. My interests '
                      'include machine learning, speech and audio processing, and '
                      'data-driven systems.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        height: 1.6,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _AboutCard(
                    icon: Icons.code,
                    title: 'Skills & Areas of Expertise',
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        SkillChip('Python'),
                        SkillChip('Machine Learning'),
                        SkillChip('Data Science'),
                        SkillChip('Speech & Audio Processing'),
                        SkillChip('Data-Driven Systems'),
                        SkillChip('Flutter & Dart'),
                        SkillChip('Java'),
                        SkillChip('Node.js'),
                        SkillChip('Git & GitHub'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const BackHomeButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(28, 28, 28, 30),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 52, color: primaryBlue),
          const SizedBox(height: 14),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: primaryBlue,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: primaryBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.white,
      side: const BorderSide(color: Color(0xFFD5DAF2)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      const ProjectData(
        title: 'Content Moderation System',
        description:
            'A Python-based intelligent tool for video content filtering and analysis.',
        icon: Icons.video_library_outlined,
      ),
      const ProjectData(
        title: 'Weather Forecast App',
        description:
            'A dynamic app built using Node.js and Java to display real-time weather data.',
        icon: Icons.cloud_outlined,
      ),
      const ProjectData(
        title: 'MoviePick',
        description:
            'Similar movies finder using Machine Learning. Built a system that analyzes '
            'movie features and recommends similar movies using TF-IDF and cosine '
            'similarity based on content similarity.',
        icon: Icons.movie_creation_outlined,
      ),
    ];

    return Scaffold(
      appBar: const AppHeader(title: 'My Projects', showBack: true),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontal = constraints.maxWidth < 650 ? 20.0 : 36.0;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(horizontal, 32, horizontal, 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    children: [
                      for (int i = 0; i < projects.length; i++) ...[
                        ProjectCard(project: projects[i]),
                        if (i != projects.length - 1)
                          const SizedBox(height: 18),
                      ],
                      const SizedBox(height: 30),
                      const BackHomeButton(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectData {
  final String title;
  final String description;
  final IconData icon;

  const ProjectData({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class ProjectCard extends StatelessWidget {
  final ProjectData project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(project.icon, color: primaryBlue, size: 30),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      color: primaryBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project.description,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioButton(
      label: 'Back to Home',
      icon: Icons.home_outlined,
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }
}
