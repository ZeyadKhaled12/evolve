import 'package:equatable/equatable.dart';
import '../../models/user_form.dart';

class AddUserFormParameters extends Equatable {
  final UserForm userForm;
  final String token;

  const AddUserFormParameters({required this.userForm, required this.token});

  @override
  List<Object?> get props => [userForm, token];
}
