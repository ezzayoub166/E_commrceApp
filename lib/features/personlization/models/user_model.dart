import 'package:e_commerce_app/utils/constants/consts.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "userName": this.userName,
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "profilePicture": this.profilePicture,
    };
  }

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});

  ///Helper Function to get FullName
  String get fullName => '$firstName $lastName';

  ///Helper Function to format phone Number
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.spilt(" ");

  ///static function to generate a username from the full Name

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.spilt(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = 'cwt_$camelCaseUserName';
    return userNameWithPrefix;
  }

  ///static function to create on empty user model
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  ///Factory method to create a UserModel from a Firebase snapshot.

   factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> doc){
     if(doc.data() != null) {
       return UserModel(
           id: doc.id,
           firstName: doc["firstName"] ?? "",
           lastName: doc["lastName"] ?? "",
           userName: doc["userName"] ?? "",
           email: doc["email"] ?? "",
           phoneNumber: doc["phoneNumber"] ?? "",
           profilePicture: doc["profilePicture"] ?? "");
     }
       else{
         return UserModel.empty();
     }
   }
}
