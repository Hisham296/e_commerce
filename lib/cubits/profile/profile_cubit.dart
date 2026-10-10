import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(
        const ProfileState(
          name: 'Hisham',
          email: 'hisham@example.com',
          phone: '+20 100 123 4567',
          address: 'Cairo, Egypt',
          memberSince: 'October 2026',
        ),
      );
}
