import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_class/features/search/data/models/user_suggested_model.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'image_shimmer.dart';

class SuggestedUserCard extends StatefulWidget {
  final UserSuggestedModel user;

  const SuggestedUserCard({
    super.key,
    required this.user,
  });

  @override
  State<SuggestedUserCard> createState() =>
      _SuggestedUserCardState();
}

class _SuggestedUserCardState
    extends State<SuggestedUserCard> {

  bool isHovered = false;
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {

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

        width: 180,

        transform: Matrix4.identity()
          ..scale(isHovered ? 1.03 : 1.0),

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColors.lightSurface,

          borderRadius: BorderRadius.circular(24),

          border: Border.all(
            color: isHovered
                ? AppColors.primary
                : AppColors.lightBorder,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: isHovered ? .08 : .04,
              ),
              blurRadius: isHovered ? 18 : 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CachedNetworkImage(
              imageUrl: widget.user.image,

              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: 42,
                  backgroundImage: imageProvider,
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

            const SizedBox(height: 16),

            Text(
              widget.user.name,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: AppTypography.h5.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              widget.user.role,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.lightText2,
              ),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },

                style: ElevatedButton.styleFrom(
                  elevation: 0,

                  backgroundColor: isFollowing
                      ? AppColors.primary50
                      : AppColors.primary,

                  foregroundColor: isFollowing
                      ? AppColors.primary
                      : Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),

                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                ),

                child: Text(
                  isFollowing
                      ? 'Following'
                      : 'Follow',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}