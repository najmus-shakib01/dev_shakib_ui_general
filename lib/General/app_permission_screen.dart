import 'package:flutter/material.dart';

class _AppColors {
  static const Color background = Color(0xFFFFF7EB);
  static const Color cardBackground = Colors.white;
  static const Color primary = Color(0xFFFF6A22);
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF555555);
  static const Color helperText = Color(0xFF8A8A8A);
  static const Color iconCircle = Color(0xFFFFA43A);
}

class _AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: _AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: _AppColors.textSecondary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: _AppColors.textPrimary,
  );

  static const TextStyle sectionDescription = TextStyle(
    fontSize: 15,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: _AppColors.textSecondary,
  );

  static const TextStyle buttonPrimary = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: _AppColors.primary,
  );

  static const TextStyle helper = TextStyle(
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: _AppColors.helperText,
  );
}

class PermissionItem {
  final String title;
  final String description;
  final String assetPath;

  const PermissionItem({
    required this.title,
    required this.description,
    required this.assetPath,
  });
}

class AppPermissionScreen extends StatelessWidget {
  const AppPermissionScreen({super.key});

  List<PermissionItem> get _items => const [
    PermissionItem(
      title: 'Contacts',
      description:
          'Access to your contacts allows you to easily share content and connect with friends already using the app.',
      assetPath: 'assets/app_permission_screen/icon/contacts.png',
    ),
    PermissionItem(
      title: 'Camera',
      description:
          'Camera access is needed to scan QR codes, take profile pictures, and share visual content with others.',
      assetPath: 'assets/app_permission_screen/icon/camera.png',
    ),
    PermissionItem(
      title: 'Notifications',
      description:
          'Stay updated with important alerts, messages, and activity related to your account.',
      assetPath: 'assets/app_permission_screen/icon/notification.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _HeaderSection(),
                const SizedBox(height: 28),

                for (final item in _items) ...[
                  PermissionCard(item: item),
                  const SizedBox(height: 16),
                ],

                const SizedBox(height: 32),
                const _ContinueSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: const BoxDecoration(
            color: _AppColors.iconCircle,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/app_permission_screen/icon/app_permission.png',
            width: 48,
            height: 48,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'App Permissions',
          style: _AppTextStyles.title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        const Text(
          'Please allow the following permissions for\n'
          'the best experience',
          style: _AppTextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class PermissionCard extends StatelessWidget {
  final PermissionItem item;

  const PermissionCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _AppColors.cardBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 225, 222, 222), 
          width: 1.5, 
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(item: item),
          const SizedBox(height: 14),
          Text(item.description, style: _AppTextStyles.sectionDescription),
          const SizedBox(height: 20),
          const _CardButtonsRow(),
        ],
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final PermissionItem item;

  const _CardHeader({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: _AppColors.iconCircle,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            item.assetPath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(child: Text(item.title, style: _AppTextStyles.sectionTitle)),
      ],
    );
  }
}

class _CardButtonsRow extends StatelessWidget {
  const _CardButtonsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _PrimaryFilledButton(label: 'Allow')),
        SizedBox(width: 16),
        Expanded(child: _SecondaryOutlinedButton(label: 'Deny')),
      ],
    );
  }
}

class _PrimaryFilledButton extends StatelessWidget {
  final String label;

  const _PrimaryFilledButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(label, style: _AppTextStyles.buttonPrimary),
      ),
    );
  }
}

class _SecondaryOutlinedButton extends StatelessWidget {
  final String label;

  const _SecondaryOutlinedButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: _AppColors.primary, width: 2),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(label, style: _AppTextStyles.buttonSecondary),
      ),
    );
  }
}

class _ContinueSection extends StatelessWidget {
  const _ContinueSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: _AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text('Continue', style: _AppTextStyles.buttonPrimary),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'You can change these settings later in the app preferences',
          style: _AppTextStyles.helper,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
