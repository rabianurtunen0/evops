import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:evops/logIn.dart';

class RefreshPassword extends StatefulWidget {
  const RefreshPassword({Key? key}) : super(key: key);

  @override
  State<RefreshPassword> createState() => _RefreshPasswordState();
}

class _RefreshPasswordState extends State<RefreshPassword> {
  final emailEditingController = TextEditingController();
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
        child: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 56.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 24.0),
                child: SvgPicture.asset(
                  Theme.of(context).backgroundColor == const Color(0XFF282A37)
                      ? 'assets/images/evops_dark.svg'
                      : 'assets/images/evops_light.svg',
                  width: 190,
                  height: 54,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 4.0),
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.headlineLarge),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(12.0, 40.0, 0.0, 8.0),
                child: Text('Email Address',
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
                width: MediaQuery.of(context).size.width * 0.88,
                height: 48,
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
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 13.0),
                    hintText: 'name@example.com',
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).hoverColor),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).hoverColor),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).hoverColor),
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(4.0, 16.0, 4.0, 0.0),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).primaryColor,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.88,
                    height: 48,
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
                        ? const CircularProgressIndicator(
                            color: Color(0XFFFFFDFA),
                            strokeWidth: 2.0,
                          )
                        : Text(
                            'Send Reset Link',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Remembered your password?",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(const Login());
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                      ),
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
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
