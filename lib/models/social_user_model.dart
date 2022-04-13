class SocialUserModel {
  String? name;
  String? email;
  String? profileImage;
  String? coverImage;
  String? phone;
  String? bio;
  String? uId;
  bool? isEmailVerified;

  SocialUserModel({this.bio,this.email,this.profileImage,this.coverImage ,this.name, this.phone, this.uId, this.isEmailVerified});

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bio = json['bio'];
    email = json['email'];
    profileImage = json['profileImage'];
    phone = json['phone'];
    coverImage = json['coverImage'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bio': bio,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
      'coverImage': coverImage,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
