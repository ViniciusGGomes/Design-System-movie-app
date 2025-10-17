import 'package:flutter/material.dart';
import '../../Components/Cards/cine_card.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class CardSampleScreen extends StatelessWidget {
  const CardSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards de Filmes'),
        backgroundColor: CineColors.surface,
        foregroundColor: CineColors.text,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Movie Cards', style: CineTextStyles.h2),
            const SizedBox(height: 24),

            // Grid of cards
            Text('Grid de Filmes', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 24,
              children: [
                CineCard(
                  title: 'Inception',
                  subtitle: 'Ficção Científica • 2010',
                  rating: '8.8',
                  onTap: () {
                    _showSnackBar(context, 'Inception selecionado');
                  },
                ),
                CineCard(
                  title: 'The Dark Knight',
                  subtitle: 'Ação • 2008',
                  rating: '9.0',
                  onTap: () {
                    _showSnackBar(context, 'The Dark Knight selecionado');
                  },
                ),
                CineCard(
                  title: 'Interstellar',
                  subtitle: 'Ficção Científica • 2014',
                  rating: '8.6',
                  placeholderIcon: Icons.stars,
                  onTap: () {
                    _showSnackBar(context, 'Interstellar selecionado');
                  },
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Horizontal scroll
            Text('Lista Horizontal', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CineCard(
                    title: 'Pulp Fiction',
                    subtitle: 'Crime • 1994',
                    rating: '8.9',
                    onTap: () {
                      _showSnackBar(context, 'Pulp Fiction selecionado');
                    },
                  ),
                  const SizedBox(width: 16),
                  CineCard(
                    title: 'Fight Club',
                    subtitle: 'Drama • 1999',
                    rating: '8.8',
                    onTap: () {
                      _showSnackBar(context, 'Fight Club selecionado');
                    },
                  ),
                  const SizedBox(width: 16),
                  CineCard(
                    title: 'The Matrix',
                    subtitle: 'Ficção Científica • 1999',
                    rating: '8.7',
                    placeholderIcon: Icons.computer,
                    onTap: () {
                      _showSnackBar(context, 'The Matrix selecionado');
                    },
                  ),
                  const SizedBox(width: 16),
                  CineCard(
                    title: 'Goodfellas',
                    subtitle: 'Crime • 1990',
                    rating: '8.7',
                    onTap: () {
                      _showSnackBar(context, 'Goodfellas selecionado');
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Different sizes
            Text('Tamanhos Diferentes', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CineCard(
                  title: 'Pequeno',
                  subtitle: 'Drama',
                  rating: '8.0',
                  width: 120,
                  height: 220,
                  placeholderIcon: Icons.movie,
                  onTap: () {},
                ),
                CineCard(
                  title: 'Grande',
                  subtitle: 'Ação',
                  rating: '9.0',
                  width: 180,
                  height: 320,
                  placeholderIcon: Icons.local_movies,
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: CineColors.secondaryDark,
      ),
    );
  }
}