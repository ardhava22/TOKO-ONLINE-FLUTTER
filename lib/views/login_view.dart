  import 'package:flutter/material.dart';
  import 'package:toko_online_flutter/services/user.dart';
  import 'package:toko_online_flutter/widgets/alert.dart';

  class LoginView extends StatefulWidget {
    const LoginView({super.key});

    @override
    State<LoginView> createState() => _LoginViewState();
  }

  class _LoginViewState extends State<LoginView> {
    UserService user = UserService();
    final formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    bool isLoading = false;
    bool showPass = true;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Color.fromARGB(255, 39, 140, 127),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/barang');
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email harus diisi';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.red)),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: Icon(Icons.email_outlined)),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: password,
                          obscureText: showPass,
                          // suffix: IconButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       showPass = !showPass;
                          //     });
                          //   },
                          //   icon: showPass
                          //       ? Icon(Icons.visibility)
                          //       : Icon(Icons.visibility_off),
                          // ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password harus diisi';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.red)),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPass = !showPass;
                                  });
                                },
                                icon: showPass
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off_outlined)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              var data = {
                                "email": email.text,
                                "password": password.text,
                              };
                              var result = await user.loginUser(data);
                              setState(() {
                                isLoading = false;
                              });
                              print(result.message);
                              if (result.status == true) {
                                AlertMessage()
                                    .showAlert(context, result.message, true);
                                Future.delayed(Duration(seconds: 2), ()
                                {
                                  Navigator.pushReplacementNamed(
                                      context, '/dashboard');
                                });
                              } else {
                                AlertMessage()
                                    .showAlert(context, result.message, false);
                              }
                            }
                          },
                          child: isLoading == false
                              ? Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      color: Colors.white),
                                )
                              : CircularProgressIndicator(),
                          color: Color.fromARGB(255, 39, 140, 127),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                        ),
                      ],
                    )),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () { 
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(text: "Belum mempunyai akun? "),
                        TextSpan(
                          text: "Daftar",
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
                      color: Colors.black, fontSize: 14, fontFamily: 'Poppins  '),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
