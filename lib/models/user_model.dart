
const String userUid = "uid";
const String userName = "name";
const String userMobile = "mobile";
const String userEmail = "email";
const String userImage = "image";
const String userDeviceToken = "deviceToken";
const String userAvailable = "available";
class UserModel{
  String? uid;
  String? name;
  String? email;
  String? mobile;
  String? image;
  bool available;

  String? deviceToken;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.mobile,
      this.image,
      this.available=true,
      this.deviceToken});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      userUid : uid,
      userName : name,
      userMobile : mobile,
      userEmail : email,
      userImage : image,
      userDeviceToken : deviceToken,
      userAvailable : available
    };
  }
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid:  map[userUid],
    name: map[userName],
    mobile: map[userMobile],
    email: map[userEmail],
    image: map[userImage],
    deviceToken: map[userDeviceToken],
    available: map[userAvailable]

  );
}