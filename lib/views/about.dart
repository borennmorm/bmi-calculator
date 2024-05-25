// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.green[200],
      ),
      backgroundColor: Colors.green[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Create Date: 25.05.2024',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This is a simple bmi calculator designed to help you know your weight condition by calculate the bmi. It provides a user-friendly interface click and read, making it easier to organize your daily activities and stay productive.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Developer:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildInfoCard(
                context,
                icon: Icons.person,
                text: 'Morm Borenn',
                url: '',
              ),
              const SizedBox(height: 4),
              _buildInfoCard(
                context,
                icon: Icons.email,
                text: 'borinmorm5@gmail.com',
                url: 'mailto:borinmorm5@gmail.com',
              ),
              const SizedBox(height: 8),
              _buildInfoCard(
                context,
                icon: FontAwesomeIcons.telegram,
                text: '@borin_morm',
                url: 'https://t.me/borin_morm',
              ),
              const SizedBox(height: 8),
              _buildInfoCard(
                context,
                icon: FontAwesomeIcons.github,
                text: 'borinmorm21',
                url: 'https://github.com/borinmorm21',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context,
      {required IconData icon, required String text, required String url}) {
    return Card(
      child: InkWell(
        onTap: () => _launchURL(url),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
