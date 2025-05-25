import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:toko_online_flutter/services/user.dart';
import 'package:toko_online_flutter/widgets/alert.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  bool showPass = true;
  insertUser() async {
    var data = {
      "name": name.text,
      "email": email.text,
      "role": role,
      "password": password.text,
      "address": addres.text,
      "birthday": birthday.text,
    };
    var result = await UserService().registerUser(data);
    print(result.status);
    print(result.message);
  }

  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController birthday = TextEditingController();
  List roleChoice = ["pelanggan", "kasir"];
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.verified_user),
        title: Text(
          "Register User",
        ),
        backgroundColor: Color.fromARGB(255, 39, 140, 127),
        foregroundColor: Color(0xFFF3E5F5),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Text(
                "Daftar",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, 
                fontFamily: 'Poppins', ),
              ),
              SizedBox(height: 16,),
              Text("Silakan isi untuk membuat  akun pada aplikasi kami",
              style: TextStyle(
                color: Color.fromARGB(255, 125, 132, 141),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),),
              SizedBox(
                height: 25,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nama Harus diisi';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "Name",
                            hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(IconlyBroken.profile)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email Harus diisi';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(IconlyLight.message)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password Harus diisi';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                              icon: showPass
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off_outlined),
                            ),
                            prefixIcon: Icon(IconlyLight.lock)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        value: role,
                        items: roleChoice.map((r) {
                          return DropdownMenuItem(value: r, child: Text(r));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            role = value.toString();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return 'Role harus dipilih';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "role",
                            hintStyle: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(IconlyLight.profile)),
                        // icon: Icon(Icons.account_circle_outlined),
                        // hint: Text(
                        //   "Pilih role",
                        //   style: TextStyle(
                        //       fontFamily: "Inter",
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w500),
                        // ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: addres,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Alamat Harus diisi';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "Alamat",
                            hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(IconlyLight.home)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: birthday,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ulang Tahun Harus diisi';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "Ulang Tahun",
                            hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            prefixIcon: Icon(IconlyLight.activity)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //  MaterialButton(
                    //     onPressed: () {
                    //        insertUser();
                    //     },
                    //     child: Text("Register"),
                    //     color: Colors.lightGreen,
                    //   )

                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              var data = {
                                "name": name.text,
                                "email": email.text,
                                "role": role,
                                "password": password.text,
                                "addres": addres.text,
                                "birthday": birthday.text,
                              };

                              var result =
                                  await UserService().registerUser(data);
                              if (result.status == true) {
                                name.clear();
                                email.clear();
                                password.clear();
                                addres.clear;
                                birthday.clear;
                                setState(() {
                                  role = null;
                                });
                                AlertMessage()
                                    .showAlert(context, result.message, true);
                              } else {
                                AlertMessage()
                                    .showAlert(context, result.message, false);
                              }
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          color: Color.fromARGB(255, 39, 140, 127),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 150, vertical: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                        // insertUser();
                      },
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          children: [
                            TextSpan(text: "Sudah mempunyai akun? "),
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: Colors.amber,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Atau hubungkan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins  '),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
