import 'package:flutter/material.dart';
import 'package:smart_class/features/search/data/models/user_suggested_model.dart';
import 'suggested_user_card.dart';

class SuggestedUsersSection extends StatelessWidget {
  const SuggestedUsersSection({super.key});

  @override
  Widget build(BuildContext context) {

    final List<UserSuggestedModel> users = [

      const UserSuggestedModel(
        name: 'Ahmed Ali',
        role: 'Flutter Developer',
        image: 'https://i.pravatar.cc/150?img=1',
      ),

      const UserSuggestedModel(
        name: 'Sara Mohamed',
        role: 'UI/UX Designer',
        image: 'https://i.pravatar.cc/150?img=2',
      ),

      const UserSuggestedModel(
        name: 'Omar Khaled',
        role: 'Backend Developer',
        image: 'https://i.pravatar.cc/150?img=3',
      ),

      const UserSuggestedModel(
        name: 'Omar Khaled',
        role: 'Backend Developer',
        image: 'https://i.pravatar.cc/150?img=3',
      ),

      const UserSuggestedModel(
        name: 'Omar Khaled',
        role: 'Backend Developer',
        image: 'https://i.pravatar.cc/150?img=3',
      ),
    ];

    final screenWidth =
        MediaQuery.sizeOf(context).width;

    double cardWidth = 180;

    if (screenWidth < 600) {
      cardWidth = 160;
    }

    if (screenWidth > 1200) {
      cardWidth = 220;
    }

    return SizedBox(
      height: 280,
    
      child: ListView.separated(
    
        scrollDirection: Axis.horizontal,
    
        physics: const BouncingScrollPhysics(),
    
        itemCount: users.length,
    
        separatorBuilder: (_, _) =>
            const SizedBox(width: 16),
    
        itemBuilder: (context, index) {
    
          return SizedBox(
            width: cardWidth,
    
            child: RepaintBoundary(
              child: SuggestedUserCard(
                user: users[index],
              ),
            ),
          );
        },
      ),
    );
  }
}