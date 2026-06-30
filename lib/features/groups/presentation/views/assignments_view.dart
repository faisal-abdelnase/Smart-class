import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import '../widgets/assignments_list.dart';

class AssignmentsView extends StatelessWidget {
	const AssignmentsView({super.key, required this.compact});

	final bool compact;

	@override
	Widget build(BuildContext context) {
		final responsive = AppResponsive.of(context);

		return Padding(
			padding: EdgeInsets.symmetric(horizontal: responsive.hPadding),
			child: Material(
				color: Colors.transparent,
				child: Column(
					children: [
						SizedBox(height: responsive.sp(12)),
						Expanded(child: AssignmentsList(compact: compact)),
					],
				),
			),
		);
	}
}

