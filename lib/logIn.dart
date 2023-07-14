import 'package:evops/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:evops/refreshPassword.dart';
import 'package:evops/signUp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  bool _isVisible = true;
  bool _isChecked = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 8.0),
                child: const Image(
                  image: AssetImage('assets/images/evops.png'),
                  width: 200,
                  height: 88,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 4.0),
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 8.0),
                child: Text(
                  'Welcome back, please log in to your account.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(12.0, 40.0, 0.0, 8.0),
                child: Text(
                  'Email Address',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
                width: MediaQuery.of(context).size.width * 0.9,
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
                  cursorColor: const Color(0XFF2A2B2E),
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0XFF2A2B2E),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 13.0),
                    hintText: 'name@example.com',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0XFF9AA1B4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFFE5EBF5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFFE5EBF5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFFE5EBF5)),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Password',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    child: SizedBox(
                      height: 30.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Color(0XFF8ABA41),
                          ),
                        ),
                        onPressed: () {
                          Get.to(const RefreshPassword());
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
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
                  cursorColor: const Color(0XFF2A2B2E),
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0XFF2A2B2E),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 13.0),
                    hintText: '••••••••',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0XFF9AA1B4),
                    ),
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
                        color: const Color(0XFF595550),
                        size: 20.0,
                      ),
                      splashColor: Colors.transparent,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFFE5EBF5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0XFFE5EBF5)),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(6.0, 16.0, 0.0, 0.0),
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        _isChecked = !_isChecked;
                        setState(() {});
                      },
                      activeColor: const Color(0XFF8ABA41),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      side: BorderSide(
                        width: 1,
                        color: Theme.of(context).backgroundColor ==
                                const Color(0XFF2A2B2E)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                      ),
                      clipBehavior: Clip.none,
                      child: Text('Keep me logged in',
                          style: Theme.of(context).textTheme.titleSmall),
                      onPressed: () {
                        _isChecked = !_isChecked;
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0.0),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0XFF8ABA41),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.9,
                    height: 48,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    splashColor: const Color(0XFF8ABA41),
                    highlightColor: const Color.fromARGB(
                        255, 116, 155, 58), //Color(0XFF749B3A)
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          _isLoading = false;
                          Get.to(const Home());
                        });
                      });
                    },
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Color(0XFFFFFDFA),
                            strokeWidth: 2.0,
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0XFFFFFDFA),
                              letterSpacing: 1.5,
                            ),
                          ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an acount?",
                        style: Theme.of(context).textTheme.titleSmall),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        disabledBackgroundColor: Colors.transparent,
                        disabledForegroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                          color: Color(0XFF8ABA41),
                        ),
                      ),
                      onPressed: () {
                        Get.to(const SignUp());
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 24.0),
                      child: Divider(color: Theme.of(context).iconTheme.color),
                    ),
                  ),
                  Text(
                    'or',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 24.0),
                      child: Divider(color: Theme.of(context).iconTheme.color),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 12.0),
                child: Text('Continue with',
                    style: Theme.of(context).textTheme.titleSmall),
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
    );
  }
}
