

class UserModel {

  String? id;
  String? userName;
  String? mobileNumber;
  String? email;
  static bool isStudent = false;

  UserModel({
    this.id,
    this.userName,
    this.mobileNumber,
    this.email,
  });
}


class StudentUserModel extends UserModel {

  String? nationalNumber;

  StudentUserModel({
    id,
    userName,
    email,
    this.nationalNumber,
    mobileNumber,
  }) : super(
    id: id,
    userName: userName,
    mobileNumber: mobileNumber,
    email: email,
  );
}




class InstructorUserModel extends UserModel {


  InstructorUserModel({
    id,
    userName,
    email,
    mobileNumber,
  }) : super(
    id: id,
    userName: userName,
    mobileNumber: mobileNumber,
    email: email,
  );
}