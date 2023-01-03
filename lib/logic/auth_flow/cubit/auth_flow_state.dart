part of 'auth_flow_cubit.dart';

enum LoginStatus { initial, login, logout }

class AuthFlowState extends Equatable {
  final LoginStatus status;
  const AuthFlowState({
    required this.status,
  });

  @override
  List<Object> get props => [status];
}
