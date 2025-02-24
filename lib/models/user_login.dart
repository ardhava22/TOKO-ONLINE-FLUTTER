// import 'package:movie_flutter/views/register_user_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLogin {
  bool? status = false;
  String? token;
  String? message;
  int? id;
  String? nama_user;
  String? email;
  String? role;
  String? addres;
  String? birthday;
  UserLogin(
      {this.status,
      this.token,
      this.message,
      this.id,
      this.nama_user,
      this.email,
      this.role,
      this.addres,
      this.birthday});


Future prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("status", status!);
    prefs.setString("token", token!);
    prefs.setString("message", message!);
    prefs.setInt("id", id!);
    prefs.setString("name", nama_user!);
    prefs.setString("email", email!);
    prefs.setString("role", role!);
    prefs.setString("addres", addres!);
    prefs.setString("birthday", birthday! as String);
  }

  Future getUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserLogin userLogin = UserLogin(
        status: prefs.getBool("status")!,
        token: prefs.getString("token")!,
        message: prefs.getString("message")!,
        id: prefs.getInt("id")!,
        nama_user: prefs.getString("nama_user")!,
        email: prefs.getString("email")!,
        role: prefs.getString("role")!,
        addres: prefs.getString("addres")!,
        birthday: prefs.getString("birthday")!,);

    return userLogin;
  }
}

  // Future getUserLogin() async {
  //   var user = await UserLogin.getUserLogin();
  //   if (user.status != false) {
  //     setState (() {
  //       name = user.nama_user;
  //       role = user.role;
  //     });
  //   }
  // }
