import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/constants/app_constants.dart';
import 'package:flutter_template/core/storage/shared_preferences_helper.dart';
import 'package:flutter_template/features/login/domain/usecases/logout_use_case.dart';
import 'package:flutter_template/features/profile/presentation/profile_provider.dart';
import 'package:flutter_template/pages/my_home_page.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  String token = '';

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  // Method to get the token from shared preferences
  Future<void> _getToken() async {
    final retrievedToken =
        await SharedPreferencesHelper.getString(AppConstants.accessTokenKey);
    if (retrievedToken != null) {
      setState(() {
        token = retrievedToken;
      });

      // Fetch profile data after getting the token
      ref.read(profileProvider.notifier).fetchProfile(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: profileState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : profileState.errorMessage != null
              ? Center(child: Text(profileState.errorMessage!))
              : profileState.profile != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                              'Name: ${profileState.profile?.firstName} ${profileState.profile?.lastName}'),
                          Text('Email: ${profileState.profile?.email}'),
                          Image.network(profileState.profile?.image ?? ''),
                        ],
                      ),
                    )
                  : const Center(child: Text('No profile data')),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {
            // Call the logout use case
            await ref.read(logoutUseCaseProvider).execute();

            // After logout, navigate to home screen
            if (context.mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            }
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
