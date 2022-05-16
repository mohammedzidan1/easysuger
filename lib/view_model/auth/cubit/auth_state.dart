import 'package:easysugar/model/users.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  late final UserModel? user;

  late final String followerId;

  AuthState({
    this.followerId = '',
    this.user,
  });

  AuthState copyWith({
    UserModel? user,
    String? followerId,
  }) =>
      AuthState(
        user: user ?? this.user,
        followerId: followerId ?? this.followerId,
      );

  @override
  List<Object> get props => [
        followerId,
        user!,
      ];
}
