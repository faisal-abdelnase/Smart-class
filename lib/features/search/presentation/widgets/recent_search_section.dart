import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RecentSearchSection extends StatefulWidget {
  const RecentSearchSection({
    super.key,
  });

  @override
  State<RecentSearchSection> createState() => _RecentSearchSectionState();
}

class _RecentSearchSectionState extends State<RecentSearchSection> {

  final List<String> recentSearches = [
      'Faisal Instructor',
      'Math Groubs',
      'Science Courses',
    ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: 
        List.generate(recentSearches.length, (index) {
          return Container(
            margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(14),
          ),
        
          child: ListTile(
            leading: Icon(Icons.history, color: Colors.grey,),
            title: Text(recentSearches[index], style: AppTypography.h5,),
            trailing: IconButton(
              onPressed: (){
                recentSearches.removeAt(index);
                setState(() {});
              }, 
              icon: Icon(Icons.clear, color: Colors.grey,)),
          ),
        );
        }),
    
    );
  }
}