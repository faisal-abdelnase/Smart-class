import 'package:flutter/material.dart';
import '../../data/datasources/onboarding_local_data.dart';
import '../../../../core/theme/app_theme_extensions.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // go to login
                },
                child: Text("Skip"),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: OnboardingData.pages.length,
                onPageChanged: (i) {
                  setState(() => index = i);
                },
                itemBuilder: (context, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(OnboardingData.pages[i].image, height: 250),
                      const SizedBox(height: 30),
                      Text(
                        OnboardingData.pages[i].title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          OnboardingData.pages[i].description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: t.text3),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                OnboardingData.pages.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  width: index == i ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == i
                        ? Theme.of(context).colorScheme.primary
                        : t.border,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Next Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  if (index == OnboardingData.pages.length - 1) {
                    // go to login
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Text(index == OnboardingData.pages.length - 1
                    ? "Get Started"
                    : "Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}