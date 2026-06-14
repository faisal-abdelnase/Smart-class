import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_class/features/search/data/models/suggested_group_model.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/extensions.dart';
import 'image_shimmer.dart';

class GroupCard extends StatefulWidget {
  final SuggestedGroupModel group;

  const GroupCard({
    super.key,
    required this.group,
  });

  @override
  State<GroupCard> createState() =>
      _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {

  bool isHovered = false;
  bool isJoined = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = theme.extension<AppThemeColors>()!;
    final cs = theme.colorScheme;

    return MouseRegion(

      onEnter: (_) {
        if (kIsWeb) {
          setState(() => isHovered = true);
        }
      },

      onExit: (_) {
        if (kIsWeb) {
          setState(() => isHovered = false);
        }
      },

      child: AnimatedContainer(

        duration: const Duration(milliseconds: 220),

        width: 260,

        decoration: BoxDecoration(
          color: t.surface,

          borderRadius: BorderRadius.circular(24),

          border: Border.all(
            color: isHovered ? cs.primary : t.border,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.08 : 0.04),
              blurRadius: isHovered ? 20 : 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            /// IMAGE
          

            CachedNetworkImage(
              imageUrl: widget.group.image,

              imageBuilder: (context, imageProvider) {
                return ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                );
              },

              placeholder: (_, _) =>
                  const UserImageShimmer(),

              errorWidget: (_, _, _) {
                return const CircleAvatar(
                  radius: 42,
                  child: Icon(Icons.person),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    widget.group.name,

                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style:
                        AppTypography.h5.copyWith(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [

                      Icon(
                        Icons.people_alt_outlined,
                        size: 18,
                        color: t.text3,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        widget.group.membersCount,

                        style: AppTypography.bodyMedium.copyWith(
                          color: t.text2,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: t.primaryTint,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Text(
                      widget.group.category,

                      style: AppTypography.bodySmall.copyWith(
                        color: cs.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(

                      onPressed: () {
                        setState(() {
                          isJoined = !isJoined;
                        });
                      },

                        style: ElevatedButton.styleFrom(
                        elevation: 0,

                        backgroundColor: isJoined ? t.primaryTint : cs.primary,

                        foregroundColor: isJoined ? cs.primary : cs.onPrimary,

                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),

                      child: Text(
                        isJoined ? context.tr("joined") : context.tr("join_group"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}