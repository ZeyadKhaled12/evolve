import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class UserForm extends Equatable {
  final String? fName;
  final String? lName;
  final String? email;
  final String? mobile;
  final String? nationality;
  final String? city;
  final String? age;
  final String? smoker;
  // final String? retailLocation;
  final String? brandSmokedBefore;
  final String? brandSelectedNow;
  // final String? giftReceived;
  // final String? refusal;
  // final String? outletName;
  // final String? outletId;
  final String? countryCode;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const UserForm({
    this.fName,
    this.lName,
    this.email,
    this.mobile,
    this.nationality,
    this.city,
    this.age,
    this.smoker,
    // this.retailLocation,
    this.brandSmokedBefore,
    this.brandSelectedNow,
    // this.giftReceived,
    // this.refusal,
    // this.outletName,
    // this.outletId,
    this.countryCode,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory UserForm.fromJson(Map<String, dynamic> json) => UserForm(
        fName: json['f_name'] as String?,
        lName: json['l_name'] as String?,
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        countryCode: json['countryCode'] as String?,
        // outletId: json['outlet_name'] as String?,
        // outletName: json['outlet_id'] as String?,
        nationality: json['nationality'] as String?,
        city: json['city'] as String?,
        age: json['age'] as String?,
        smoker: json['smoker'] as String?,
        // retailLocation: json['retail_location'] as String?,
        brandSmokedBefore: json['brand_smoked_before'] as String?,
        brandSelectedNow: json['brand_selected_now'] as String?,
        // giftReceived: json['gift_received'] as String?,
        // refusal: json['refusal'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
      );

  http.MultipartRequest multiPart(String url) {
    final req = http.MultipartRequest('POST', Uri.parse(url))
      ..fields['f_name'] = fName!
      ..fields['l_name'] = lName!
      ..fields['email'] = email!
      ..fields['mobile'] = mobile!
      ..fields['nationality'] = nationality!
      ..fields['city'] = city!
      ..fields['age'] = age!
      ..fields['smoker'] = smoker.toString();
    // ..fields['retail_location'] = retailLocation!;
    // ..fields['gift_received'] = giftReceived!
    // ..fields['refusal'] = refusal!;
    if (brandSelectedNow != null) {
      req.fields['brand_smoked_before'] = brandSmokedBefore!;
    }
    if (brandSelectedNow != null) {
      req.fields['brand_selected_now'] = brandSelectedNow!;
    }
    return req;
  }

  Map<String, dynamic> toJson() => {
        'f_name': fName,
        'l_name': lName,
        'email': email,
        'mobile': mobile,
        'country_code': countryCode,
        'nationality': nationality,
        'city': city,
        'age': age,
        // 'outlet_name': outletName,
        // 'outlet_id': outletId,
        'smoker': smoker,
        // 'retail_location': retailLocation,
        'brand_smoked_before': brandSmokedBefore,
        'brand_selected_now': brandSelectedNow,
        // 'gift_received': giftReceived,
        // 'refusal': refusal,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      fName,
      lName,
      email,
      mobile,
      nationality,
      city,
      age,
      smoker,
      // retailLocation,
      brandSmokedBefore,
      brandSelectedNow,
      // giftReceived,
      // refusal,
      countryCode,
      updatedAt,
      createdAt,
      id,
    ];
  }
}
