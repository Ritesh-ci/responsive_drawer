import 'package:flutter/material.dart';
import 'package:responsive_drawer/auth/auth_viewmodel.dart';
import 'package:responsive_drawer/base/base_view.dart';
import 'package:responsive_drawer/base/base_view_model.dart';
import 'package:responsive_drawer/base/injection.dart';
import 'package:responsive_drawer/common/constant.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AuthViewModel>(
          onModelReady: (AuthViewModel authViewModel) {},
          builder: (context, authViewModel, child) {
            return Center(
              child: Container(
                height: MediaQuery.of(context).devicePixelRatio * 200,
                width: MediaQuery.of(context).devicePixelRatio * 250,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Form(
                    key: _formkey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (!emailRegex.hasMatch(value!)) {
                              return "Enter Email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              // hintText: "Email",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              label: const Text("Email"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              // hintText: "Password",
                              label: const Text("Password"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: 250,
                          child: authViewModel.viewState == ViewState.IDLE
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blueAccent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)))),
                                  onPressed: () async {
                                    if (_formkey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      final verified =
                                          await authViewModel.singIn(
                                              _emailController.text,
                                              _passwordController.text);
                                      if (verified) {
                                        Injection.navigatorKey.currentState
                                            ?.pushNamed(
                                          "/homeScreen",
                                        );
                                      }
                                    }
                                  },
                                  child: const Text("Button To Click")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
