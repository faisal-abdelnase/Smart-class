import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/widgets/custom_elevated_button.dart';
import 'package:smart_class/features/search/presentation/widgets/search_text_field.dart';
import '../../data/models/group_model.dart';
import '../widgets/group_card.dart';
import '../widgets/header_section.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  static const List<GroupModel> _groups = <GroupModel>[
    GroupModel(
      name: "Flutter Development",
      description: "Learn Flutter development from scratch.",
      studentCount: 120,
      color: Color(0xFF2563EB),
      icon: Icons.code_rounded,
    ),
    GroupModel(
      name: "AI & Machine Learning",
      description: "Explore the world of artificial intelligence and machine learning.",
      studentCount: 85,
      color: Color(0xFF7C3AED),
      icon: Icons.psychology_rounded,
    ),
    GroupModel(
      name: "UI/UX Design",
      description: "Learn the fundamentals of user interface and user experience design.",
      studentCount: 65,
      color: Color(0xFF059669),
      icon: Icons.palette_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = AppResponsive.of(context);
    final horizontalPadding = responsive.sp(responsive.isMobile ? 16 : responsive.isTablet ? 32 : 40);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text("My Groups"),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16),
            child: CustomElevatedButton(text: "+ Create Group", onPressed: (){}),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                24,
                horizontalPadding,
                0,
              ),
              sliver: SliverToBoxAdapter(
                child: HeaderSection(theme: theme),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                24,
                horizontalPadding,
                0,
              ),
              sliver: const SliverToBoxAdapter(child: SearchTextField()),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                24,
                horizontalPadding,
                32,
              ),
              sliver: SliverGrid.builder(
                itemCount: _groups.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.cols,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 260,
                ),
                itemBuilder: (context, index) {
                  return GroupCard(group: _groups[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



