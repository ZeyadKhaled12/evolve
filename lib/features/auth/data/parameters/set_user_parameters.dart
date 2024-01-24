import 'package:equatable/equatable.dart';
import 'package:tdh_event/features/auth/models/user/user.dart';

class SetUserParameters extends Equatable {
  final User user;

  const SetUserParameters({required this.user});

  @override
  List<Object?> get props => [user];
}
