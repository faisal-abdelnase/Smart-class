import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/suggested_group_model.dart';
import 'group_card.dart';

class GroupsSection extends StatelessWidget {
  const GroupsSection({super.key});

  @override
  Widget build(BuildContext context) {

    final List<SuggestedGroupModel> groups = [

      const SuggestedGroupModel(
        name: 'Flutter Developers',
        category: 'Mobile Development',
        image:
            'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
        membersCount: '12.5k Members',
      ),

      const SuggestedGroupModel(
        name: 'UI UX Community',
        category: 'Design',
        image:
            'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
        membersCount: '8.2k Members',
      ),

      const SuggestedGroupModel(
        name: 'AI Engineers',
        category: 'Artificial Intelligence',
        image:
            'https://images.unsplash.com/photo-1677442136019-21780ecad995',
        membersCount: '20k Members',
      ),
    ];

    return SizedBox(
      height: 360,
    
      child: ListView.separated(
    
        scrollDirection: Axis.horizontal,
    
        physics:
            const BouncingScrollPhysics(),
    
        itemCount: groups.length,
    
        separatorBuilder: (_, __) =>
            const SizedBox(width: 18),
    
        itemBuilder: (context, index) {
    
          return RepaintBoundary(
            child: GroupCard(
              group: groups[index],
            ),
          );
        },
      ),
    );
  }
}