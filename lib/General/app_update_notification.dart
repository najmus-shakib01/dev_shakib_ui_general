import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFFFFFBF0);
  static const Color cardBackground = Colors.white;
  static const Color primaryOrange = Color(0xFFFF6A1A);
  static const Color secondaryOrange = Color(0xFFFFF1E0);
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF4A4A4A);
  static const Color textMuted = Color(0xFF8C8C8C);
  static const Color borderLight = Color(0xFFE6E6E6);
}

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle title = TextStyle(
    fontSize: 24, 
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 15,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle cardLabel = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle cardValueBold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardValueHighlight = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryOrange,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle bulletText = TextStyle(
    fontSize: 15,
    height: 1.3,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle primaryButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle secondaryButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryOrange,
  );

  static const TextStyle recommendation = TextStyle(
    fontSize: 13,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle bottomNavSelected = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle bottomNavUnselected = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}

class AppUpdateNotificationScreen extends StatelessWidget {
  const AppUpdateNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(height: 40),
                    UpdateTopIcon(),
                    SizedBox(height: 40),
                    UpdateTitleSection(),
                    SizedBox(height: 24),
                    VersionInfoCard(),
                    SizedBox(height: 24),
                    WhatsNewCard(),
                    SizedBox(height: 24),
                    ActionButtonsSection(),
                    SizedBox(height: 16),
                    RecommendationText(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}

class UpdateTopIcon extends StatelessWidget {
  const UpdateTopIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: Image.asset(
          'assets/app_update_notification/icon/update_available.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class UpdateTitleSection extends StatelessWidget {
  const UpdateTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Update Available',
          style: AppTextStyles.title,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'A new version of Global System Screens is ready to install',
          style: AppTextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class VersionInfoCard extends StatelessWidget {
  const VersionInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 227, 222, 222)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        children: const [
          _VersionRow(
            label: 'Current version:',
            value: '2.4.1',
            valueStyle: AppTextStyles.cardValueBold,
          ),
          SizedBox(height: 12),
          _VersionRow(
            label: 'New version:',
            value: '3.0.0',
            valueStyle: AppTextStyles.cardValueHighlight,
          ),
        ],
      ),
    );
  }
}

class _VersionRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle valueStyle;

  const _VersionRow({
    required this.label,
    required this.value,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label, style: AppTextStyles.cardLabel)),
        Text(value, style: valueStyle),
      ],
    );
  }
}

class WhatsNewCard extends StatelessWidget {
  const WhatsNewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 227, 222, 222)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("What's new:", style: AppTextStyles.sectionTitle),
          SizedBox(height: 18),
          WhatsNewItem(
            iconPath: 'assets/app_update_notification/icon/right1.png',
            text: 'Critical security improvements',
          ),
          SizedBox(height: 16),
          WhatsNewItem(
            iconPath: 'assets/app_update_notification/icon/right2.png',
            text: 'Enhanced performance and\nstability',
          ),
          SizedBox(height: 16),
          WhatsNewItem(
            iconPath: 'assets/app_update_notification/icon/right3.png',
            text: 'New features and interface\nimprovements',
          ),
          SizedBox(height: 16),
          WhatsNewItem(
            iconPath: 'assets/app_update_notification/icon/right4.png',
            text: 'Bug fixes from previous version',
          ),
        ],
      ),
    );
  }
}

class WhatsNewItem extends StatelessWidget {
  final String iconPath;
  final String text;

  const WhatsNewItem({super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 26,
          height: 26,
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(text, style: AppTextStyles.bulletText)),
      ],
    );
  }
}

class ActionButtonsSection extends StatelessWidget {
  const ActionButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primaryOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Update Now', style: AppTextStyles.primaryButton),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 54,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.secondaryOrange,
              side: const BorderSide(
                color: AppColors.primaryOrange,
                width: 1.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Remind Me Later',
              style: AppTextStyles.secondaryButton,
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendationText extends StatelessWidget {
  const RecommendationText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'We recommend keeping your app updated for the best'
        'experience and latest security features',
        style: AppTextStyles.recommendation,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          BottomNavItem(
            iconPath: 'assets/app_update_notification/icon/home.png',
            label: 'Home',
            isSelected: true,
          ),
          BottomNavItem(
            iconPath: 'assets/app_update_notification/icon/notification.png',
            label: 'Notifications',
            isSelected: false,
          ),
          BottomNavItem(
            iconPath: 'assets/app_update_notification/icon/settings.png',
            label: 'Settings',
            isSelected: false,
          ),
          BottomNavItem(
            iconPath: 'assets/app_update_notification/icon/profile.png',
            label: 'Profile',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  const BottomNavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = isSelected
        ? AppTextStyles.bottomNavSelected
        : AppTextStyles.bottomNavUnselected;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 26,
          height: 26,
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),
        const SizedBox(height: 4),
        Text(label, style: textStyle),
      ],
    );
  }
}
