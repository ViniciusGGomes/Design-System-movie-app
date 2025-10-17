import 'package:flutter/material.dart';
import '../../Components/Inputs/cine_input_field.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class InputSampleScreen extends StatefulWidget {
  const InputSampleScreen({super.key});

  @override
  State<InputSampleScreen> createState() => _InputSampleScreenState();
}

class _InputSampleScreenState extends State<InputSampleScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  bool _obscurePassword = true;
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = null;
      } else if (!value.contains('@')) {
        _emailError = 'Digite um e-mail válido';
      } else {
        _emailError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campos de Texto'),
        backgroundColor: CineColors.surface,
        foregroundColor: CineColors.text,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Input Fields', style: CineTextStyles.h2),
            const SizedBox(height: 24),

            // Basic input
            Text('Básico', style: CineTextStyles.h3),
            const SizedBox(height: 12),
            const CineInputField(
              placeholder: 'Digite seu nome',
            ),

            const SizedBox(height: 24),

            // With label
            Text('Com Label', style: CineTextStyles.h3),
            const SizedBox(height: 12),
            const CineInputField(
              label: 'Nome completo',
              placeholder: 'Digite seu nome completo',
              helperText: 'Use seu nome como aparece no documento',
            ),

            const SizedBox(height: 24),

            // Email with validation
            Text('Com Validação', style: CineTextStyles.h3),
            const SizedBox(height: 12),
            CineInputField(
              label: 'E-mail',
              placeholder: 'seu@email.com',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email_outlined,
              errorText: _emailError,
              onChanged: _validateEmail,
            ),

            const SizedBox(height: 24),

            // Password
            Text('Senha', style: CineTextStyles.h3),
            const SizedBox(height: 12),
            CineInputField(
              label: 'Senha',
              placeholder: 'Digite sua senha',
              controller: _passwordController,
              obscureText: _obscurePassword,
              prefixIcon: Icons.lock_outline,
              suffixIcon: _obscurePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              onSuffixIconTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              helperText: 'Mínimo de 8 caracteres',
            ),

            const SizedBox(height: 24),

            // Search
            Text('Busca', style: CineTextStyles.h3),
            const SizedBox(height: 12),
            CineInputField(
              placeholder: 'Buscar filmes...',
              controller: _searchController,
              prefixIcon: Icons.search,
              suffixIcon: Icons.tune,
              onSuffixIconTap: () {
                // Open filters
              },
            ),

            const SizedBox(height: 24),

            // Multiline
            Text('Múltiplas Linhas', style: CineTextStyles.h3),
            const SizedBox(height: 12),
            const CineInputField(
              label: 'Comentário',
              placeholder: 'Escreva sua opinião sobre o filme',
              maxLines: 4,
              helperText: 'Máximo de 500 caracteres',
            ),

            const SizedBox(height: 24),

            // Disabled
            Text('Desabilitado', style: CineTextStyles.h3),
            const SizedBox(height: 12),
            const CineInputField(
              label: 'Campo desabilitado',
              placeholder: 'Não editável',
              enabled: false,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}