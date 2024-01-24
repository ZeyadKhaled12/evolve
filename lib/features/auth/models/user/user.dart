import 'package:equatable/equatable.dart';

import 'details.dart';

class User extends Equatable {
  final String? token;
  final Details? details;

  const User({this.token, this.details});

  factory User.fromJson(Map<String, dynamic> json, {String? token}) => User(
        token: token ?? json['token'] as String?,
        details: json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'details': details?.toJson(),
      };

  @override
  List<Object?> get props => [token, details];
}
