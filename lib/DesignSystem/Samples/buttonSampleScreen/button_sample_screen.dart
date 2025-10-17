import 'package:flutter/material.dart';
import '../../Components/Buttons/cine_button.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class ButtonSampleScreen extends StatefulWidget {
  const ButtonSampleScreen({super.key});

  @override
  State<ButtonSampleScreen> createState() => _ButtonSampleScreenState();
}

class _ButtonSampleScreenState extends State<ButtonSampleScreen> {
  bool isLoading = false;

  void _handlePress() {
    setState(() => isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botões'),
        backgroundColor: CineColors.surface,
        foregroundColor: CineColors.text,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Primary Buttons', style: CineTextStyles.h2),
            const SizedBox(height: 24),

            // Primary Filled
            _SectionTitle('Filled'),
            const SizedBox(height: 12),
            CineButton(
              text: 'Primary Button',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            CineButton(
              text: 'With Icon',
              icon: Icons.play_arrow,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            CineButton(
              text: 'Loading',
              onPressed: _handlePress,
              isLoading: isLoading,
            ),
            const SizedBox(height: 12),
            const CineButton(
              text: 'Disabled',
              onPressed: null,
            ),

            const SizedBox(height: 32),

            // Primary Outlined
            _SectionTitle('Outlined'),
            const SizedBox(height: 12),
            CineButton(
              text: 'Primary Outlined',
              type: CineButtonType.outlined,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            CineButton(
              text: 'With Icon',
              type: CineButtonType.outlined,
              icon: Icons.favorite_border,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            const CineButton(
              text: 'Disabled',
              type: CineButtonType.outlined,
              onPressed: null,
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 24),

            Text('Secondary Buttons', style: CineTextStyles.h2),
            const SizedBox(height: 24),

            // Secondary Filled
            _SectionTitle('Filled'),
            const SizedBox(height: 12),
            CineButton(
              text: 'Secondary Button',
              variant: CineButtonVariant.secondary,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            CineButton(
              text: 'With Icon',
              variant: CineButtonVariant.secondary,
              icon: Icons.add,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            const CineButton(
              text: 'Disabled',
              variant: CineButtonVariant.secondary,
              onPressed: null,
            ),

            const SizedBox(height: 32),

            // Secondary Outlined
            _SectionTitle('Outlined'),
            const SizedBox(height: 12),
            CineButton(
              text: 'Secondary Outlined',
              variant: CineButtonVariant.secondary,
              type: CineButtonType.outlined,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            CineButton(
              text: 'With Icon',
              variant: CineButtonVariant.secondary,
              type: CineButtonType.outlined,
              icon: Icons.info_outline,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            const CineButton(
              text: 'Disabled',
              variant: CineButtonVariant.secondary,
              type: CineButtonType.outlined,
              onPressed: null,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: CineTextStyles.h3.copyWith(
        color: CineColors.textLight,
      ),
    );
  }
}