import 'package:equatable/equatable.dart';
import 'package:tdh_event/features/home/models/update_info.dart';

class UpdateInfoParameters extends Equatable {
  final UpdateInfo updateInfo;
  final String token;

  const UpdateInfoParameters({required this.updateInfo, required this.token});

  @override
  List<Object?> get props => [updateInfo, token];
}
