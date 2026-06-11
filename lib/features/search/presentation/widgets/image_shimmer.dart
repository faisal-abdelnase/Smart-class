import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserImageShimmer extends StatelessWidget {
  const UserImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(

      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,

      child: const CircleAvatar(
        radius: 42,
        backgroundColor: Colors.white,
      ),
    );
  }
}


class GroupImageShimmer extends StatelessWidget {
  const GroupImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(

      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,

      child: const ClipRRect(
        borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
        ),
        
      ),
    );
  }
}