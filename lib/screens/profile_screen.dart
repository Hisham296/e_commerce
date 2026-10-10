import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/profile/profile_cubit.dart';
import '../cubits/profile/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Profile'), centerTitle: true),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 16),

                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 52,
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.person,
                          size: 58,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.name,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        state.email,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 8),
                      Chip(
                        avatar: const Icon(
                          Icons.verified_user_outlined,
                          size: 18,
                        ),
                        label: const Text('Demo Account'),
                        backgroundColor: Colors.deepPurple.withValues(
                          alpha: 0.1,
                        ),
                        side: BorderSide.none,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  'Personal Information',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                _ProfileInfoTile(
                  icon: Icons.person_outline,
                  title: 'Full Name',
                  value: state.name,
                ),
                _ProfileInfoTile(
                  icon: Icons.email_outlined,
                  title: 'Email Address',
                  value: state.email,
                ),
                _ProfileInfoTile(
                  icon: Icons.phone_outlined,
                  title: 'Phone Number',
                  value: state.phone,
                ),
                _ProfileInfoTile(
                  icon: Icons.location_on_outlined,
                  title: 'Address',
                  value: state.address,
                ),
                _ProfileInfoTile(
                  icon: Icons.calendar_month_outlined,
                  title: 'Member Since',
                  value: state.memberSince,
                ),

                const SizedBox(height: 24),

                Text(
                  'More',
                  style: Theme.of(context).textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                _ProfileMenuTile(
                  icon: Icons.shopping_bag_outlined,
                  title: 'My Orders',
                  onTap: () => _showDemoMessage(context, 'My Orders'),
                ),
                _ProfileMenuTile(
                  icon: Icons.favorite_border,
                  title: 'My Wishlist',
                  onTap: () => _showDemoMessage(context, 'My Wishlist'),
                ),
                _ProfileMenuTile(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () => _showDemoMessage(context, 'Settings'),
                ),
                _ProfileMenuTile(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () => _showDemoMessage(context, 'Help & Support'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showDemoMessage(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature is for demonstration only.')),
    );
  }
}

class _ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ProfileInfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(value),
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
