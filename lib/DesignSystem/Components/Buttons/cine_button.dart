import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

enum CineButtonType { filled, outlined }
enum CineButtonVariant { primary, secondary }

class CineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CineButtonType type;
  final CineButtonVariant variant;
  final IconData? icon;
  final bool isLoading;

  const CineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = CineButtonType.filled,
    this.variant = CineButtonVariant.primary,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    final Color backgroundColor = _getBackgroundColor(isDisabled);
    final Color foregroundColor = _getForegroundColor(isDisabled);
    final BorderSide? border = _getBorder(isDisabled);

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: CineColors.disabled,
          disabledForegroundColor: CineColors.disabledText,
          elevation: type == CineButtonType.filled ? 0 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: border ?? BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: isLoading
            ? SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
          ),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: CineTextStyles.button.copyWith(
                color: isDisabled ? CineColors.disabledText : foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(bool isDisabled) {
    if (isDisabled) return CineColors.disabled;

    if (type == CineButtonType.outlined) {
      return Colors.transparent;
    }

    return variant == CineButtonVariant.primary
        ? CineColors.primary
        : CineColors.secondaryDark;
  }

  Color _getForegroundColor(bool isDisabled) {
    if (isDisabled) return CineColors.disabledText;

    if (type == CineButtonType.outlined) {
      return variant == CineButtonVariant.primary
          ? CineColors.primary
          : CineColors.secondaryDark;
    }

    return CineColors.textOnPrimary;
  }

  BorderSide? _getBorder(bool isDisabled) {
    if (type == CineButtonType.outlined) {
      final color = isDisabled
          ? CineColors.disabled
          : (variant == CineButtonVariant.primary
          ? CineColors.primary
          : CineColors.secondaryDark);
      return BorderSide(color: color, width: 1.5);
    }
    return null;
  }
}