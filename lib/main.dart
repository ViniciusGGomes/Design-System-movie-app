import 'package:flutter/material.dart';
import 'shared/styles.dart';
import 'shared/colors.dart';
import 'DesignSystem/Samples/buttonSampleScreen/button_sample_screen.dart';
import 'DesignSystem/Samples/inputSampleScreen/input_sample_screen.dart';
import 'DesignSystem/Samples/cardSampleScreen/card_sample_screen.dart';
import 'DesignSystem/Samples/toggleSampleScreen/toggle_sample_screen.dart';
import 'DesignSystem/Samples/checkboxSampleScreen/checkbox_sample_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineVerse Design System',
      theme: CineTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: CineColors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.movie,
                      size: 64,
                      color: CineColors.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'CineVerse',
                      style: CineTextStyles.h1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Design System',
                      style: CineTextStyles.h3.copyWith(
                        color: CineColors.textLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Component Grid
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Componentes',
                      style: CineTextStyles.h2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Explore os componentes do Design System',
                      style: CineTextStyles.smallText,
                    ),
                    const SizedBox(height: 24),

                    _ComponentCard(
                      icon: Icons.smart_button,
                      title: 'Botões',
                      description: 'Buttons, CTAs e variações',
                      color: CineColors.primary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ButtonSampleScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    _ComponentCard(
                      icon: Icons.input,
                      title: 'Campos de Texto',
                      description: 'Inputs, forms e validação',
                      color: CineColors.secondaryLight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InputSampleScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    _ComponentCard(
                      icon: Icons.collections,
                      title: 'Cards',
                      description: 'Cards de filmes e conteúdo',
                      color: CineColors.secondaryDark,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CardSampleScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    _ComponentCard(
                      icon: Icons.toggle_on,
                      title: 'Toggle Switches',
                      description: 'Switches e configurações',
                      color: CineColors.primary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ToggleSampleScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    _ComponentCard(
                      icon: Icons.check_box,
                      title: 'Checkboxes',
                      description: 'Checkboxes e seleções múltiplas',
                      color: CineColors.secondaryLight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckboxSampleScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),            ],
          ),
        ),
      ),
    );
  }
}

class _ComponentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _ComponentCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CineColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: CineColors.divider,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CineTextStyles.h3,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: CineTextStyles.smallText,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                color: CineColors.textLight,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
