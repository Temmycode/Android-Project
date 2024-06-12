import 'package:apple_match/mock/mock_users.dart';
import 'package:apple_match/models/user_model.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getMatchProvider = FutureProvider<List<User>>((ref) async {
  final users = mockUsers;
  final discoverNewUsers = await Future.delayed(1.8.seconds, () => users);
  return discoverNewUsers;
});
