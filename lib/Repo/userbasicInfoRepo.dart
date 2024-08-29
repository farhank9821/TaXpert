import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:tax_xpert/model/user_basic_info.dart';

final userBasicProvider = StateNotifierProvider<UserBasicNotifier, UserBasicInfo>((ref) => UserBasicNotifier());

class UserBasicNotifier extends StateNotifier<UserBasicInfo> {
  UserBasicNotifier() : super(UserBasicInfo(name: "abc", age: 22)) {
    _loadFromHive();
  }

  static const String _boxName = 'userBasicInfo';
  static const String _key = 'currentUser';

  Future<void> _loadFromHive() async {
    final box = await Hive.openBox<UserBasicInfo>(_boxName);
    final savedUser = box.get(_key);
    if (savedUser != null) {
      state = savedUser;
    }
  }

  Future<void> updateUserBasicInfo({
    String? name,
    int? age,
    String? email,
    String? phone,
    String? address,
  }) async {
    state = state.copyWith(
      name: name,
      age: age,
      email: email,
      address: address,
      phoneNo: phone,
    );

    final box = await Hive.openBox<UserBasicInfo>(_boxName);
    await box.put(_key, state);
  }
}
