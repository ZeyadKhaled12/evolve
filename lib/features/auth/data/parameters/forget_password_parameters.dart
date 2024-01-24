import 'package:equatable/equatable.dart';

class ForgetPasswordParameters extends Equatable {
  final String email;

  const ForgetPasswordParameters({required this.email});

  @override
  List<Object?> get props => [email];
}
