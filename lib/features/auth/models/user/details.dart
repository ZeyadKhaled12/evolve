import 'package:equatable/equatable.dart';

class Details extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? role;
  final String? image;
  final String? phone;
  final dynamic whatsapp;
  final bool? showInWebsite;
  final dynamic brn;

  const Details({
    this.id,
    this.name,
    this.email,
    this.role,
    this.image,
    this.phone,
    this.whatsapp,
    this.showInWebsite,
    this.brn,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
        image: json['image'] as String?,
        phone: json['phone'] as String?,
        whatsapp: json['whatsapp'] as dynamic,
        showInWebsite: json['show_in_website'] as bool?,
        brn: json['brn'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role,
        'image': image,
        'phone': phone,
        'whatsapp': whatsapp,
        'show_in_website': showInWebsite,
        'brn': brn,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      role,
      image,
      phone,
      whatsapp,
      showInWebsite,
      brn,
    ];
  }
}
