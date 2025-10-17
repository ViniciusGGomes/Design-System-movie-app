import 'package:flutter/material.dart';
import '../../Components/Toggles/cine_toggle_switch.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class ToggleSampleScreen extends StatefulWidget {
  const ToggleSampleScreen({super.key});

  @override
  State<ToggleSampleScreen> createState() => _ToggleSampleScreenState();
}

class _ToggleSampleScreenState extends State<ToggleSampleScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _autoPlay = true;
  bool _saveData = false;
  bool _subtitles = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Switches'),
        backgroundColor: CineColors.surface,
        foregroundColor: CineColors.text,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Toggle Switches', style: CineTextStyles.h2),
            const SizedBox(height: 24),

            // Basic toggles
            Text('Básico', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            CineToggleSwitch(
              value: _notifications,
              onChanged: (value) {
                setState(() => _notifications = value);
              },
              label: 'Notificações',
            ),
            const SizedBox(height: 12),
            CineToggleSwitch(
              value: _darkMode,
              onChanged: (value) {
                setState(() => _darkMode = value);
              },
              label: 'Modo Escuro',
            ),
            const SizedBox(height: 12),
            CineToggleSwitch(
              value: false,
              onChanged: (value) {},
              label: 'Desabilitado',
              enabled: false,
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 24),

            // Toggle tiles
            Text('Com Descrição', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            CineToggleSwitchTile(
              value: _autoPlay,
              onChanged: (value) {
                setState(() => _autoPlay = value);
              },
              title: 'Reprodução Automática',
              subtitle: 'Reproduzir vídeos automaticamente',
            ),
            const SizedBox(height: 12),
            CineToggleSwitchTile(
              value: _saveData,
              onChanged: (value) {
                setState(() => _saveData = value);
              },
              title: 'Economizar Dados',
              subtitle: 'Reduz o uso de dados móveis',
            ),
            const SizedBox(height: 12),
            CineToggleSwitchTile(
              value: _subtitles,
              onChanged: (value) {
                setState(() => _subtitles = value);
              },
              title: 'Legendas',
              subtitle: 'Mostrar legendas quando disponível',
            ),
            const SizedBox(height: 12),
            CineToggleSwitchTile(
              value: true,
              onChanged: (value) {},
              title: 'Opção Desabilitada',
              subtitle: 'Esta opção não pode ser alterada',
              enabled: false,
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 24),

            // Settings example
            Text('Exemplo: Configurações', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CineColors.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Preferências', style: CineTextStyles.h3),
                  const SizedBox(height: 16),
                  CineToggleSwitchTile(
                    value: _notifications,
                    onChanged: (value) {
                      setState(() => _notifications = value);
                    },
                    title: 'Notificações Push',
                    subtitle: 'Receber alertas sobre novos filmes',
                  ),
                  const SizedBox(height: 8),
                  CineToggleSwitchTile(
                    value: _darkMode,
                    onChanged: (value) {
                      setState(() => _darkMode = value);
                    },
                    title: 'Tema Escuro',
                    subtitle: 'Ativar modo escuro',
                  ),
                  const SizedBox(height: 8),
                  CineToggleSwitchTile(
                    value: _autoPlay,
                    onChanged: (value) {
                      setState(() => _autoPlay = value);
                    },
                    title: 'Reprodução Automática',
                    subtitle: 'Iniciar vídeos automaticamente',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}