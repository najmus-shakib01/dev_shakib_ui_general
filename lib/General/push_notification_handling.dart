import 'package:flutter/material.dart';

class AppColors {
  static const Color pageBackground = Color(0xFFFFF7EB);
  static const Color primaryOrange = Color(0xFFFF6A1A);
  static const Color primaryGreen = Color(0xFF0BA94B);
  static const Color warningYellow = Color(0xFFFFB53A);
  static const Color cardBackground = Colors.white;
  static const Color borderGrey = Color(0xFFE4E2DD);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color bottomNavInactive = Color(0xFF9E9E9E);
}
class AppTextStyles {
  static const TextStyle screenTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
  );
  static const TextStyle screenSubtitle = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.4,
  );
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle label = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.4,
  );
  static const TextStyle statusLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle statusValue = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryGreen,
  );
  static const TextStyle dropdownLabel = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle primaryButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const TextStyle secondaryButton = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryOrange,
  );
  static const TextStyle bottomNavActive = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryOrange,
  );
  static const TextStyle bottomNavInactive = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.bottomNavInactive,
  );
}

class PushNotificationHandling extends StatelessWidget {
  const PushNotificationHandling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      bottomNavigationBar: const _ReferableBottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: _TopBar(),
            ),

            const Divider(height: 1, thickness: 1, color: AppColors.borderGrey),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _HeaderSection(),
                    SizedBox(height: 28),
                    _CurrentLinkStatusCard(),
                    SizedBox(height: 24),
                    _LinkHandlingOptionsCard(),
                    SizedBox(height: 28),
                    _FallbackBehaviorSection(),
                    SizedBox(height: 32),
                    _PrimaryActionButtons(),
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/push_notification_handling/image/referable_logo.png',
            height: 28,
            fit: BoxFit.contain,
          ),
          Image.asset(
            'assets/push_notification_handling/icon/menu.png',
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Deep Link Resolution', style: AppTextStyles.screenTitle),
        SizedBox(height: 8),
        Text(
          'Managing notification links and redirects',
          style: AppTextStyles.screenSubtitle,
        ),
      ],
    );
  }
}

class _CurrentLinkStatusCard extends StatelessWidget {
  const _CurrentLinkStatusCard();

  @override
  Widget build(BuildContext context) {
    return _ShadowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _CircleIcon(
                backgroundColor: AppColors.primaryOrange,
                assetPath: 'assets/push_notification_handling/icon/copy.png',
                iconSize: 18,
              ),
              const SizedBox(width: 12),
              const Text(
                'Current Link Status',
                style: AppTextStyles.sectionTitle,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFE4F7E9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Link Status', style: AppTextStyles.statusLabel),
                      SizedBox(height: 6),
                      Text('Active', style: AppTextStyles.statusValue),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/push_notification_handling/icon/active.png',
                  height: 26,
                  width: 26,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Last checked: 2 minutes ago', style: AppTextStyles.body),
        ],
      ),
    );
  }
}

class _LinkHandlingOptionsCard extends StatelessWidget {
  const _LinkHandlingOptionsCard();

  @override
  Widget build(BuildContext context) {
    return _ShadowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Link Handling Options', style: AppTextStyles.sectionTitle),
          SizedBox(height: 18),
          _OptionRow(
            title: 'Open links externally',
            iconBackgroundColor: AppColors.primaryOrange,
            assetPath: 'assets/push_notification_handling/icon/upload.png',
          ),
          Divider(height: 1),
          _OptionRow(
            title: 'Save link history',
            iconBackgroundColor: AppColors.primaryGreen,
            assetPath: 'assets/push_notification_handling/icon/history.png',
          ),
          Divider(height: 1),
          _OptionRow(
            title: 'Alert on broken links',
            iconBackgroundColor: AppColors.warningYellow,
            assetPath: 'assets/push_notification_handling/icon/alert.png',
          ),
        ],
      ),
    );
  }
}

class _FallbackBehaviorSection extends StatelessWidget {
  const _FallbackBehaviorSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Fallback Behavior', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 16),
        _ShadowCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _DropdownFieldGroup(
                label: 'When a link is broken:',
                value: 'Show error screen',
              ),
              SizedBox(height: 20),
              _DropdownFieldGroup(
                label: 'When a link is expired:',
                value: 'Redirect to home',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PrimaryActionButtons extends StatelessWidget {
  const _PrimaryActionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FilledRoundedButton(label: 'Create User Account', onPressed: () {}),
        const SizedBox(height: 14),
        _OutlinedRoundedButton(label: 'Cancel', onPressed: () {}),
      ],
    );
  }
}

class _ShadowCard extends StatelessWidget {
  final Widget child;

  const _ShadowCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE3E1DC), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final Color backgroundColor;
  final String assetPath;
  final double iconSize;

  const _CircleIcon({
    required this.backgroundColor,
    required this.assetPath,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Image.asset(
        assetPath,
        height: iconSize,
        width: iconSize,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  final String title;
  final Color iconBackgroundColor;
  final String assetPath;

  const _OptionRow({
    required this.title,
    required this.iconBackgroundColor,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          _CircleIcon(
            backgroundColor: iconBackgroundColor,
            assetPath: assetPath,
            iconSize: 18,
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: AppTextStyles.label)),
          const Icon(
            Icons.chevron_right,
            size: 24,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

class _DropdownFieldGroup extends StatefulWidget {
  final String label;
  final String value;

  const _DropdownFieldGroup({
    required this.label,
    required this.value,
  });

  @override
  State<_DropdownFieldGroup> createState() => _DropdownFieldGroupState();
}

class _DropdownFieldGroupState extends State<_DropdownFieldGroup>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late String selectedValue;

  final List<String> options = [
    'Show error screen',
    'Redirect to home',
  ];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppTextStyles.label),
        const SizedBox(height: 10),

        GestureDetector(
          onTap: () {
            setState(() => isExpanded = !isExpanded);
          },
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.borderGrey, width: 1.1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedValue,
                    style: AppTextStyles.dropdownLabel,
                  ),
                ),

                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 24,
                    color: AppColors.textSecondary,
                  ),
                )
              ],
            ),
          ),
        ),

        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          child: isExpanded
              ? Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.borderGrey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      for (final item in options)
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedValue = item;
                              isExpanded = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item,
                              style: AppTextStyles.dropdownLabel,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              : const SizedBox(), 
        ),
      ],
    );
  }
}

class _FilledRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _FilledRoundedButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        child: Text(label, style: AppTextStyles.primaryButton),
      ),
    );
  }
}

class _OutlinedRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _OutlinedRoundedButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primaryOrange, width: 1.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(label, style: AppTextStyles.secondaryButton),
      ),
    );
  }
}

class _ReferableBottomNavBar extends StatelessWidget {
  const _ReferableBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _BottomNavItem(
            label: 'Home',
            assetPath: 'assets/push_notification_handling/icon/home.png',
            isActive: true,
          ),
          _BottomNavItem(
            label: 'Notifications',
            assetPath:
                'assets/push_notification_handling/icon/notification.png',
            isActive: false,
          ),
          _BottomNavItem(
            label: 'Settings',
            assetPath: 'assets/push_notification_handling/icon/settings.png',
            isActive: false,
          ),
          _BottomNavItem(
            label: 'Profile',
            assetPath: 'assets/push_notification_handling/icon/profile.png',
            isActive: false,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String label;
  final String assetPath;
  final bool isActive;

  const _BottomNavItem({
    required this.label,
    required this.assetPath,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = isActive
        ? AppTextStyles.bottomNavActive
        : AppTextStyles.bottomNavInactive;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(assetPath, height: 26, width: 26, fit: BoxFit.contain),
        const SizedBox(height: 6),
        Text(label, style: textStyle),
      ],
    );
  }
}
