import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../../shared/styles.dart';

class CineCard extends StatelessWidget {
  final String? imageUrl;
  final IconData? placeholderIcon;
  final String title;
  final String? subtitle;
  final String? rating;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const CineCard({
    super.key,
    this.imageUrl,
    this.placeholderIcon,
    required this.title,
    this.subtitle,
    this.rating,
    this.onTap,
    this.width = 160,
    this.height = 280,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image container
              Container(
                width: width,
                height: height * 0.7,
                decoration: BoxDecoration(
                  color: CineColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: imageUrl != null && imageUrl!.isNotEmpty
                      ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceholder(),
                  )
                      : _buildPlaceholder(),
                ),
              ),
              const SizedBox(height: 12),
              // Title and rating
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: CineTextStyles.body.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (rating != null) ...[
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: CineColors.secondaryLight,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: CineColors.textOnPrimary,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating!,
                            style: CineTextStyles.caption.copyWith(
                              color: CineColors.textOnPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: CineTextStyles.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: CineColors.surfaceVariant,
      child: Center(
        child: Icon(
          placeholderIcon ?? Icons.movie,
          size: 48,
          color: CineColors.disabled,
        ),
      ),
    );
  }
}