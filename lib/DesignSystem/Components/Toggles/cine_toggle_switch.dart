import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class CineToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;
  final bool enabled;

  const CineToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: CineTextStyles.body.copyWith(
              color: enabled ? CineColors.text : CineColors.disabledText,
            ),
          ),
          const SizedBox(width: 12),
        ],
        SizedBox(
          width: 48,
          height: 28,
          child: Switch(
            value: value,
            onChanged: enabled ? onChanged : null,
            activeColor: CineColors.textOnPrimary,
            activeTrackColor: CineColors.primary,
            inactiveThumbColor: CineColors.textOnPrimary,
            inactiveTrackColor: CineColors.disabled,
            trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
                  (Set<WidgetState> states) {
                return Colors.transparent;
              },
            ),
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                  (Set<WidgetState> states) {
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CineToggleSwitchTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String title;
  final String? subtitle;
  final bool enabled;

  const CineToggleSwitchTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.subtitle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: CineColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CineTextStyles.body.copyWith(
                    color: enabled ? CineColors.text : CineColors.disabledText,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: CineTextStyles.caption.copyWith(
                      color: enabled
                          ? CineColors.textLight
                          : CineColors.disabledText,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 16),
          CineToggleSwitch(
            value: value,
            onChanged: onChanged,
            enabled: enabled,
          ),
        ],
      ),
    );
  }
}