import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class UpdateInfo extends Equatable {
  final String? email;
  final String? name;
  final String? phoneNumber;
  final String? whatsAppNumber;

  const UpdateInfo(
      {this.email, this.name, this.phoneNumber, this.whatsAppNumber});

  http.MultipartRequest multiPart(String url) {
    final req = http.MultipartRequest('POST', Uri.parse(url));
    if (name != null) {
      req.fields['name'] = name!;
    }
    if (email != null) {
      req.fields['email'] = email!;
    }
    if (phoneNumber != null) {
      req.fields['phone_number'] = phoneNumber!;
    }
    if (whatsAppNumber != null) {
      req.fields['whats_app_number'] = whatsAppNumber!;
    }
    return req;
  }

  @override
  List<Object?> get props => [email, name, phoneNumber, whatsAppNumber];
}
