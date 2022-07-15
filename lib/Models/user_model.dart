class UserModel {
  String? uid;
  String? email;
  String? fullname;
  String? dateofbirth;
  String? registeredOn;
  bool? isAdmin;
  bool? isEmployee;
  int? phoneNumber;
  String? employeeId;

  UserModel(
      {this.uid,
      this.email,
      this.fullname,
      this.dateofbirth,
      this.registeredOn,
      this.isAdmin,
      this.isEmployee,
      this.employeeId,
      this.phoneNumber});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['Email'],
        fullname: map['Fullname'],
        isEmployee: map['isEmployee'],
        isAdmin: map['isAdmin'],
        dateofbirth: map['DateOfBirth'],
        phoneNumber: map['phonenumber']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'Email': email,
      'Fullname': fullname,
      'DateOfBirth': dateofbirth,
      'isEmployee': isEmployee,
      'isAdmin': isAdmin,
      'employeeId': employeeId,
      'CreatedOn': registeredOn,
      'phonenumber': phoneNumber
    };
  }
}
