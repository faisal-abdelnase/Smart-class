import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_class/features/search/data/models/suggested_group_model.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
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
                alpha: isHovered ? 0.08 : 0.04,
              ),
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

                      const Icon(
                        Icons.people_alt_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        widget.group.membersCount,

                        style:
                            AppTypography.bodyMedium
                                .copyWith(
                          color:
                              AppColors.lightText2,
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
                      color: AppColors.primary50,
                      borderRadius:
                          BorderRadius.circular(
                        10,
                      ),
                    ),

                    child: Text(
                      widget.group.category,

                      style:
                          AppTypography.bodySmall
                              .copyWith(
                        color:
                            AppColors.primary,
                        fontWeight:
                            FontWeight.w600,
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

                      style:
                          ElevatedButton.styleFrom(
                        elevation: 0,

                        backgroundColor:
                            isJoined
                                ? AppColors.primary50
                                : AppColors.primary,

                        foregroundColor:
                            isJoined
                                ? AppColors.primary
                                : Colors.white,

                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 14,
                        ),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            14,
                          ),
                        ),
                      ),

                      child: Text(
                        isJoined
                            ? 'Joined'
                            : 'Join Group',
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