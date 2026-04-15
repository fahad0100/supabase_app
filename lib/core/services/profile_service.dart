import 'package:injectable/injectable.dart';
import 'package:supabase_app/core/common/models/profile_model.dart';

@lazySingleton
class ProfileService {
  ProfileModel? _profile;

  set setProfile(ProfileModel profile) {
    _profile = profile;
  }

  ProfileModel? get profile {
    return _profile;
  }

  void signOut() {
    _profile = null;
  }
}
