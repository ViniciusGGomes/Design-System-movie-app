import 'package:flutter/material.dart';
import '../../Components/Checkboxes/cine_checkbox.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class CheckboxSampleScreen extends StatefulWidget {
  const CheckboxSampleScreen({super.key});

  @override
  State<CheckboxSampleScreen> createState() => _CheckboxSampleScreenState();
}

class _CheckboxSampleScreenState extends State<CheckboxSampleScreen> {
  bool _action = true;
  bool _comedy = false;
  bool _drama = true;
  bool _sciFi = false;
  bool _horror = false;

  bool _terms = false;
  bool _newsletter = true;
  bool _notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkboxes'),
        backgroundColor: CineColors.surface,
        foregroundColor: CineColors.text,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Checkboxes', style: CineTextStyles.h2),
            const SizedBox(height: 24),

            // Basic checkboxes
            Text('Básico', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            CineCheckbox(
              value: _action,
              onChanged: (value) {
                setState(() => _action = value!);
              },
              label: 'Ação',
            ),
            const SizedBox(height: 8),
            CineCheckbox(
              value: _comedy,
              onChanged: (value) {
                setState(() => _comedy = value!);
              },
              label: 'Comédia',
            ),
            const SizedBox(height: 8),
            CineCheckbox(
              value: _drama,
              onChanged: (value) {
                setState(() => _drama = value!);
              },
              label: 'Drama',
            ),
            const SizedBox(height: 8),
            CineCheckbox(
              value: false,
              onChanged: (value) {},
              label: 'Desabilitado',
              enabled: false,
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 24),

            // Checkbox tiles
            Text('Com Descrição', style: CineTextStyles.h3),
            const SizedBox(height: 16),
            CineCheckboxTile(
              value: _terms,
              onChanged: (value) {
                setState(() => _terms = value!);
              },
              title: 'Aceito os Termos e Condições',
              subtitle: 'Li e concordo com os termos de uso',
            ),
            const SizedBox(height: 12),
            CineCheckboxTile(
              value: _newsletter,
              onChanged: (value) {
                setState(() => _newsletter = value!);
              },
              title: 'Receber Newsletter',
              subtitle: 'Enviar novidades e promoções por e-mail',
            ),
            const SizedBox(height: 12),
            CineCheckboxTile(
              value: _notifications,
              onChanged: (value) {
                setState(() => _notifications = value!);
              },
              title: 'Notificações de Lançamentos',
              subtitle: 'Alertas sobre novos filmes e séries',
            ),
            const SizedBox(height: 12),
            CineCheckboxTile(
              value: true,
              onChanged: (value) {},
              title: 'Opção Desabilitada',
              subtitle: 'Esta opção não pode ser desmarcada',
              enabled: false,
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 24),

            // Genre selection example
            Text('Exemplo: Seleção de Gêneros', style: CineTextStyles.h3),
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
                  Text('Seus Gêneros Favoritos', style: CineTextStyles.h3),
                  const SizedBox(height: 8),
                  Text(
                    'Selecione os gêneros de filmes que você mais gosta',
                    style: CineTextStyles.smallText,
                  ),
                  const SizedBox(height: 16),
                  CineCheckboxTile(
                    value: _action,
                    onChanged: (value) {
                      setState(() => _action = value!);
                    },
                    title: 'Ação',
                    subtitle: 'Filmes de ação e aventura',
                  ),
                  const SizedBox(height: 8),
                  CineCheckboxTile(
                    value: _comedy,
                    onChanged: (value) {
                      setState(() => _comedy = value!);
                    },
                    title: 'Comédia',
                    subtitle: 'Filmes engraçados e leves',
                  ),
                  const SizedBox(height: 8),
                  CineCheckboxTile(
                    value: _drama,
                    onChanged: (value) {
                      setState(() => _drama = value!);
                    },
                    title: 'Drama',
                    subtitle: 'Histórias emocionantes',
                  ),
                  const SizedBox(height: 8),
                  CineCheckboxTile(
                    value: _sciFi,
                    onChanged: (value) {
                      setState(() => _sciFi = value!);
                    },
                    title: 'Ficção Científica',
                    subtitle: 'Futurismo e tecnologia',
                  ),
                  const SizedBox(height: 8),
                  CineCheckboxTile(
                    value: _horror,
                    onChanged: (value) {
                      setState(() => _horror = value!);
                    },
                    title: 'Terror',
                    subtitle: 'Filmes de suspense e horror',
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