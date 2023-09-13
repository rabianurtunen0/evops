import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:evops/logIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _scrollController = ScrollController();
  final fullNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final againPasswordEditingController = TextEditingController();
  bool _isVisible = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Get.to(const Login());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.044,
                  0.0,
                  MediaQuery.of(context).size.width * 0.044,
                  0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.014,
                        0.0,
                        0.0,
                        MediaQuery.of(context).size.height * 0.026),
                    child: SvgPicture.asset(
                      Theme.of(context).backgroundColor ==
                              const Color(0XFF282A37)
                          ? 'assets/images/evops_dark.svg'
                          : 'assets/images/evops_light.svg',
                      width: 190,
                      height: MediaQuery.of(context).size.height * 0.058,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.028,
                        MediaQuery.of(context).size.height * 0.005,
                        0.0,
                        MediaQuery.of(context).size.height * 0.0025),
                    child: Text('Sign Up',
                        style: Theme.of(context).textTheme.headlineLarge),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.028,
                        MediaQuery.of(context).size.height * 0.0025,
                        0.0,
                        MediaQuery.of(context).size.height * 0.004),
                    child: Text(
                      'Please, fill in your information and create an account.',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.028,
                        MediaQuery.of(context).size.height * 0.036,
                        0.0,
                        MediaQuery.of(context).size.height * 0.008),
                    child: Text('Full Name',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,
                        MediaQuery.of(context).size.height * 0.03),
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.052,
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      autofocus: false,
                      controller: fullNameEditingController,
                      keyboardType: TextInputType.text,
                      toolbarOptions: const ToolbarOptions(
                          paste: true, cut: true, selectAll: true, copy: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "⛔ This field is required";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        fullNameEditingController.text = newValue!;
                      },
                      cursorColor: Theme.of(context).highlightColor,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.028,
                            0.0,
                            MediaQuery.of(context).size.width * 0.028,
                            0.0),
                        hintText: 'Full Name',
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.028,
                        0.0,
                        0.0,
                        MediaQuery.of(context).size.height * 0.008),
                    child: Text(
                      'Email Address',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,
                        MediaQuery.of(context).size.height * 0.03),
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.052,
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      autofocus: false,
                      controller: emailEditingController,
                      keyboardType: TextInputType.text,
                      toolbarOptions: const ToolbarOptions(
                          paste: true, cut: true, selectAll: true, copy: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "⛔ This field is required";
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return "⛔ Please enter a valid email adress";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        emailEditingController.text = newValue!;
                      },
                      cursorColor: Theme.of(context).highlightColor,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.028,
                            0.0,
                            MediaQuery.of(context).size.width * 0.028,
                            0.0),
                        hintText: 'name@example.com',
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.028,
                        0.0,
                        0.0,
                        MediaQuery.of(context).size.height * 0.008),
                    child: Text(
                      'Password',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0,
                        MediaQuery.of(context).size.height * 0.03),
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.052,
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      autofocus: false,
                      controller: passwordEditingController,
                      keyboardType: TextInputType.text,
                      toolbarOptions: const ToolbarOptions(
                          paste: true, cut: true, selectAll: true, copy: true),
                      obscureText: _isVisible,
                      obscuringCharacter: '•',
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{8,}$');
                        if (value!.isEmpty) {
                          return "⛔ This field is required";
                        }
                        if (!regex.hasMatch(value)) {
                          return "⛔ Enter valid password(Minimum 8 characters)";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        passwordEditingController.text = newValue!;
                      },
                      cursorColor: Theme.of(context).highlightColor,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.028,
                            0.0,
                            MediaQuery.of(context).size.width * 0.028,
                            0.0),
                        hintText: '••••••••',
                        hintStyle: Theme.of(context).textTheme.displaySmall,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: Icon(
                            _isVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Theme.of(context).iconTheme.color,
                            size: 18.0,
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).hoverColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.007,
                        MediaQuery.of(context).size.height * 0.007,
                        MediaQuery.of(context).size.width * 0.007,
                        0.0),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.052,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      splashColor: Theme.of(context).primaryColor,
                      highlightColor: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            _isLoading = false;
                            Get.to(const Login());
                          });
                        });
                      },
                      child: _isLoading
                          ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.032,
                            width: MediaQuery.of(context).size.height * 0.032,
                            child: const CircularProgressIndicator(
                                color: Color(0XFFFFFDFA),
                                strokeWidth: 2.0,
                              ),
                          )
                          : Text(
                              'Sign Up',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an acount?",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(const Login());
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                (states) => Colors.transparent),
                          ),
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child:
                              Divider(color: Theme.of(context).iconTheme.color),
                        ),
                      ),
                      Text('or', style: Theme.of(context).textTheme.titleSmall),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: Divider(
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.016),
                    child: Text(
                      'Continue with',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/google.svg',
                          ),
                          iconSize: 34.0,
                          splashRadius: 30.0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/facebook.svg',
                          ),
                          iconSize: 37.0,
                          splashRadius: 30.0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(8.0),
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/icloud.svg',
                          ),
                          iconSize: 43.0,
                          splashRadius: 30.0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
