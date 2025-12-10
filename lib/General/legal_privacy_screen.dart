import 'package:flutter/material.dart';

class _AppColors {
  static const Color background = Color(0xFFFEFBF4);
  static const Color cardBackground = Colors.white;
  static const Color primaryText = Color(0xFF111111);
  static const Color sectionTitle = Color(0xFF1A1A1A);
  static const Color bottomBarBorder = Color(0xFFE0E0E0);
  static const Color arrowIcon = Color(0xFFB3B3B3);
}

class _AppTextStyles {
  static const TextStyle headerTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: _AppColors.primaryText,
  );

  static const TextStyle sectionHeader = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: _AppColors.sectionTitle,
  );

  static const TextStyle listTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: _AppColors.primaryText,
  );

  static const TextStyle bottomNavLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}

class LegalPrivacyScreen extends StatelessWidget {
  const LegalPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const _TopAppBar(),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _ScreenTitle(),
                    const SizedBox(height: 24),
                    const _SectionHeader(title: 'Terms & Policies'),
                    const SizedBox(height: 16),
                    _SettingsCard(
                      leadingAsset:
                          'assets/legal_privacy_screen/icon/service.png',
                      title: 'Terms of Service',
                    ),
                    const SizedBox(height: 12),
                    _SettingsCard(
                      leadingAsset:
                          'assets/legal_privacy_screen/icon/privacy.png',
                      title: 'Privacy Policy',
                    ),
                    const SizedBox(height: 12),
                    _SettingsCard(
                      leadingAsset:
                          'assets/legal_privacy_screen/icon/cookie.png',
                      title: 'Cookie Policy',
                    ),
                    const SizedBox(height: 32),
                    const _SectionHeader(title: 'Notifications & Updates'),
                    const SizedBox(height: 16),
                    _SettingsCard(
                      leadingAsset:
                          'assets/legal_privacy_screen/icon/push_notification.png',
                      title: 'Push Notification Settings',
                    ),
                    const SizedBox(height: 12),
                    _SettingsCard(
                      leadingAsset:
                          'assets/legal_privacy_screen/icon/app_update.png',
                      title: 'App Update Preferences',
                    ),
                    const SizedBox(height: 32),
                    const _SectionHeader(title: 'Data & Privacy Controls'),
                    const SizedBox(height: 16),
                    _SettingsCard(
                      leadingAsset:
                          'assets/legal_privacy_screen/icon/data_using.png',
                      title: 'Data Usage Settings',
                    ),
                    const SizedBox(height: 12),
                    _SettingsCard(
                      leadingAsset:
                          'assets/legal_privacy_screen/icon/delete_data.png',
                      title: 'Delete My Data',
                      titleColor: const Color(0xFFB3261E),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _TopAppBar extends StatelessWidget {
  const _TopAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _AppColors.background,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5), width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Image.asset(
            'assets/legal_privacy_screen/image/referable_logo.png',
            height: 28,
            fit: BoxFit.contain,
          ),
          const Spacer(),
          Image.asset(
            'assets/legal_privacy_screen/icon/menu.png',
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _ScreenTitle extends StatelessWidget {
  const _ScreenTitle();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text('Legal & Privacy', style: _AppTextStyles.headerTitle),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: _AppTextStyles.sectionHeader);
  }
}

class _SettingsCard extends StatelessWidget {
  final String leadingAsset;
  final String title;
  final Color? titleColor;

  const _SettingsCard({
    required this.leadingAsset,
    required this.title,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: _AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFEFE9DD), 
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image.asset(leadingAsset, height: 28, width: 28, fit: BoxFit.contain),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: _AppTextStyles.listTitle.copyWith(
                color: titleColor ?? _AppColors.primaryText,
              ),
            ),
          ),
          Icon(Icons.chevron_right, size: 24, color: _AppColors.arrowIcon),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _AppColors.cardBackground,
        border: const Border(
          top: BorderSide(color: _AppColors.bottomBarBorder, width: 0.8),
        ),
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _BottomNavItem(
              label: 'Home',
              assetPath: 'assets/legal_privacy_screen/icon/home.png',
              isActive: false,
            ),
            _BottomNavItem(
              label: 'Notifications',
              assetPath: 'assets/legal_privacy_screen/icon/notification.png',
              isActive: false,
            ),
            _BottomNavItem(
              label: 'Settings',
              assetPath: 'assets/legal_privacy_screen/icon/settings.png',
              isActive: true,
            ),
            _BottomNavItem(
              label: 'Profile',
              assetPath: 'assets/legal_privacy_screen/icon/profile.png',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String label;
  final String? assetPath;
  final bool isActive;
  final bool useBuiltInHomeIcon;

  const _BottomNavItem({
    required this.label,
    this.assetPath,
    this.isActive = false,
    // ignore: unused_element_parameter
    this.useBuiltInHomeIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color activeTextColor = Color(0xFFF8A41C);
    const Color defaultTextColor = Colors.black;

    final Color textColor = isActive ? activeTextColor : defaultTextColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(assetPath!, height: 24, width: 24, fit: BoxFit.contain),
        const SizedBox(height: 4),
        Text(
          label,
          style: _AppTextStyles.bottomNavLabel.copyWith(color: textColor),
        ),
      ],
    );
  }
}
