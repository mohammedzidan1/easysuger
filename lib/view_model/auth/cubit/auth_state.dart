import 'package:easysugar/model/users.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  late final UserModel user;

  late final bool isWrite;

  AuthState({
    this.isWrite = false,
    required this.user,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isWrite,
  }) =>
      AuthState(
        user: user ?? this.user,
        isWrite: isWrite ?? this.isWrite,
      );

  @override
  List<Object> get props => [
        isWrite,
        user,
      ];
}
