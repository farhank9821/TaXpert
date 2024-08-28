import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/model/user_basic_info.dart';

final userBasicProvider = StateNotifierProvider<UserBasicNotifier, UserBasicInfo>((ref) => UserBasicNotifier());

class UserBasicNotifier extends StateNotifier<UserBasicInfo> {
  UserBasicNotifier() : super(UserBasicInfo(name: "abc", age: 22));

  void updateUserBasicInfo({
    String? name,
    int? age,
    String? email,
    String? phone,
    String? address,
  }) {
    state = state.copyWith(
      name: name,
      age: age,
      email: email,
      address: address,
      phoneNo: phone,
    );
  }
}
