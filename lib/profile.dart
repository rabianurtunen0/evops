import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/addCreditCard.dart';
import 'package:evops/logIn.dart';
import 'package:evops/themeService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum Sky { sun, moon }

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _scrollController = ScrollController();
  final getStorage = GetStorage();
  final fullNameEditingController =
      TextEditingController(text: 'Rabia Nur Tünen');
  final emailEditingController =
      TextEditingController(text: 'rrabianurtunen@gmail.com');
  final telephoneNumberEditingController =
      TextEditingController(text: '+90 507 823 10 63');
  final locationEditingController =
      TextEditingController(text: 'Konya, Turkey');
  final oldPasswordEditingController = TextEditingController();
  final newPasswordEditingController = TextEditingController();
  final newPasswordAgainEditingController = TextEditingController();
  bool personalInformation = false;
  bool payments = false;
  bool sharing = false;
  bool app = false;
  bool changePassword = false;
  bool oldPasswordVisible = false;
  bool newPasswordVisible = false;
  bool newPasswordAgainVisible = false;
  bool save = false;
  bool theme = true;
  bool _isLoading = false;

  List registeredCreditCardsNumbers = [
    ['7786 6768 6878 687', 'RABİA NUR TÜNEN', '10/26', '403'],
    ['6574 6574 6757 5745', 'RABİA NUR TÜNEN', '13/29', '728'],
    ['7865 7948 9479 0437', 'RABİA NUR TÜNEN', '09/25', '578'],
  ];

  List sharedPeoples = [
    ['assets/images/day_and_night.png', 'Mert Demir'],
    ['assets/images/day_and_night.png', 'Selen Sayar'],
    ['assets/images/day_and_night.png', 'Mert Demir'],
    ['assets/images/day_and_night.png', 'Selen Sayar'],
    ['assets/images/day_and_night.png', 'Mert Demir'],
    ['assets/images/day_and_night.png', 'Selen Sayar'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Scrollbar(
          controller: _scrollController,
          thickness: 5.0,
          radius: const Radius.circular(20.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 60.0),
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).cardColor,
                        radius: 48.0,
                        child: const Icon(
                          BootstrapIcons.person_fill,
                          color: Color(0XFF8ABA41),
                          size: 36.0,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(64.0, 60.0, 0.0, 0.0),
                        child: Container(
                            width: 36,
                            height: 36,
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(24.0)),
                            child: MaterialButton(
                              elevation: 0,
                              shape: const CircleBorder(),
                              color: const Color(0XFF8ABA41),
                              padding: const EdgeInsets.all(9.0),
                              onPressed: () {
                                changePhotoBottomSheet();
                              },
                              splashColor: const Color(0XFF8ABA41),
                              highlightColor:
                                  const Color.fromARGB(255, 116, 155, 58),
                              child: const Icon(
                                BootstrapIcons.pencil,
                                size: 12.0,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: personalInformation
                          ? save
                              ? changePassword
                                  ? 540
                                  : 420
                              : 350
                          : 50,
                      margin: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 5.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12.0), bottom: Radius.zero),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    20.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'PERSONAL INFORMATION',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 2.0, 5.0, 0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    personalInformation
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: 20,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      personalInformation =
                                          !personalInformation;
                                      personalInformation == false
                                          ? save = false
                                          : null;
                                      personalInformation == false
                                          ? changePassword = false
                                          : null;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          personalInformation
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15.0),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            BootstrapIcons.person,
                                            color: Color(0XFF8ABA41),
                                            size: 25.0,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 48,
                                          margin: const EdgeInsets.fromLTRB(
                                              0.0, 5.0, 15.0, 5.0),
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                5.0, 15.0, 0.0, 0.0),
                                            alignment: Alignment.centerLeft,
                                            child: TextFormField(
                                              autofocus: false,
                                              controller:
                                                  fullNameEditingController,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "⛔ This field is required";
                                                }
                                                return null;
                                              },
                                              onSaved: (newValue) {
                                                fullNameEditingController.text =
                                                    newValue!;
                                              },
                                              onTap: () {
                                                setState(() {
                                                  save = true;
                                                });
                                              },
                                              cursorColor: Theme.of(context).highlightColor,
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Colors.white : Colors.transparent,
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                hintText: 'Full Name',
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15.0),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            BootstrapIcons.envelope_at,
                                            color: Color(0XFF8ABA41),
                                            size: 25.0,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 48,
                                          margin: const EdgeInsets.fromLTRB(
                                              0.0, 5.0, 15.0, 5.0),
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                5.0, 15.0, 0.0, 0.0),
                                            alignment: Alignment.centerLeft,
                                            child: TextFormField(
                                              autofocus: false,
                                              controller:
                                                  emailEditingController,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "⛔ This field is required";
                                                }
                                                return null;
                                              },
                                              onSaved: (newValue) {
                                                emailEditingController.text =
                                                    newValue!;
                                                save = true;
                                              },
                                              onTap: () {
                                                setState(() {
                                                  save = true;
                                                });
                                              },
                                              cursorColor: Theme.of(context).highlightColor,
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Colors.white : Colors.transparent,
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                hintText: 'name@example.com',
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15.0),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            BootstrapIcons.telephone,
                                            color: Color(0XFF8ABA41),
                                            size: 25.0,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 48,
                                          margin: const EdgeInsets.fromLTRB(
                                              0.0, 5.0, 15.0, 5.0),
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                5.0, 15.0, 0.0, 0.0),
                                            alignment: Alignment.centerLeft,
                                            child: TextFormField(
                                              autofocus: false,
                                              controller:
                                                  telephoneNumberEditingController,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "⛔ This field is required";
                                                }
                                                return null;
                                              },
                                              onSaved: (newValue) {
                                                telephoneNumberEditingController
                                                    .text = newValue!;
                                                save = true;
                                              },
                                              onTap: () {
                                                setState(() {
                                                  save = true;
                                                });
                                              },
                                              cursorColor: Theme.of(context).highlightColor,
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Colors.white : Colors.transparent,
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                hintText: 'Phone Number',
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15.0),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            BootstrapIcons.geo_alt,
                                            color: Color(0XFF8ABA41),
                                            size: 25.0,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 48,
                                          margin: const EdgeInsets.fromLTRB(
                                              0.0, 5.0, 15.0, 5.0),
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                5.0, 15.0, 0.0, 0.0),
                                            alignment: Alignment.centerLeft,
                                            child: TextFormField(
                                              autofocus: false,
                                              controller:
                                                  locationEditingController,
                                              keyboardType: TextInputType.text,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "⛔ This field is required";
                                                }
                                                return null;
                                              },
                                              onSaved: (newValue) {
                                                locationEditingController.text =
                                                    newValue!;
                                                save = true;
                                              },
                                              onTap: () {
                                                setState(() {
                                                  save = true;
                                                });
                                              },
                                              cursorColor: Theme.of(context).highlightColor,
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Colors.white : Colors.transparent,
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                hintText: 'City, Country',
                    hintStyle: Theme.of(context).textTheme.displaySmall,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    changePassword == false
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 15.0),
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: const Icon(
                                                  BootstrapIcons.lock,
                                                  color: Color(0XFF8ABA41),
                                                  size: 25.0,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                height: 48,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 5.0, 15.0, 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .fromLTRB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            changePassword =
                                                                true;
                                                            save = true;
                                                          });
                                                        },
                                                        splashColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        child: Text(
                                                            'CHANGE PASSWORD',
                                                            style: Theme.of(context).textTheme.bodyLarge,
                                                            textAlign:
                                                                TextAlign.left),
                                                      ),
                                                    ),
                                                    Container(),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    changePassword
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 15.0),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  BootstrapIcons.lock,
                                                  color: Color(0XFF8ABA41),
                                                  size: 25.0,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                height: 48,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 5.0, 15.0, 5.0),
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          5.0, 15.0, 0.0, 0.0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextFormField(
                                                    autofocus: false,
                                                    controller:
                                                        oldPasswordEditingController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText:
                                                        oldPasswordVisible,
                                                    obscuringCharacter: '•',
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "⛔ This field is required";
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (newValue) {
                                                      oldPasswordEditingController
                                                          .text = newValue!;
                                                    },
                                                    cursorColor: Theme.of(context).highlightColor,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Colors.white : Colors.transparent,
                                                      labelText: 'Old Password',
                                                      labelStyle:
                                                          TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Color(0XFF8ABA41) : Color(0XFFFFFFFF)
                                                      ),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: '••••••••',
                                                      hintStyle: Theme.of(context).textTheme.displaySmall,
                                                      floatingLabelAlignment:
                                                          FloatingLabelAlignment
                                                              .start,
                                                      suffixIcon: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            oldPasswordVisible =
                                                                !oldPasswordVisible;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          oldPasswordVisible
                                                              ? BootstrapIcons
                                                                  .eye_slash
                                                              : BootstrapIcons
                                                                  .eye,
                                                          color: Theme.of(context).highlightColor,
                                                          size: 18,
                                                        ),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .fromLTRB(
                                                              10.0,
                                                              8.0,
                                                              10.0,
                                                              10.0),
                                                      enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    changePassword
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 15.0),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  BootstrapIcons.lock,
                                                  color: Color(0XFF8ABA41),
                                                  size: 25.0,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                height: 48,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 5.0, 15.0, 5.0),
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          5.0, 15.0, 0.0, 0.0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextFormField(
                                                    autofocus: false,
                                                    controller:
                                                        newPasswordEditingController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText:
                                                        newPasswordVisible,
                                                    obscuringCharacter: '•',
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "⛔ This field is required";
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (newValue) {
                                                      newPasswordEditingController
                                                          .text = newValue!;
                                                    },
                                                    cursorColor: Theme.of(context).highlightColor,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Colors.white : Colors.transparent,
                                                      labelText: 'New Password',
                                                      labelStyle:
                                                          TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Color(0XFF8ABA41) : Color(0XFFFFFFFF)
                                                      ),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: '••••••••',
                                                      hintStyle: Theme.of(context).textTheme.displaySmall,
                                                      floatingLabelAlignment:
                                                          FloatingLabelAlignment
                                                              .start,
                                                      suffixIcon: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            newPasswordVisible =
                                                                !newPasswordVisible;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          newPasswordVisible
                                                              ? BootstrapIcons
                                                                  .eye_slash
                                                              : BootstrapIcons
                                                                  .eye,
                                                          color: Theme.of(context).highlightColor,
                                                          size: 18,
                                                        ),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .fromLTRB(
                                                              10.0,
                                                              8.0,
                                                              10.0,
                                                              10.0),
                                                      enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    changePassword
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 15.0),
                                                alignment: Alignment.center,
                                                child: const Icon(
                                                  BootstrapIcons.lock,
                                                  color: Color(0XFF8ABA41),
                                                  size: 25.0,
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                height: 48,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 5.0, 15.0, 5.0),
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          5.0, 15.0, 0.0, 0.0),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: TextFormField(
                                                    autofocus: false,
                                                    controller:
                                                        newPasswordAgainEditingController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    obscureText:
                                                        newPasswordAgainVisible,
                                                    obscuringCharacter: '•',
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return "⛔ This field is required";
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (newValue) {
                                                      newPasswordAgainEditingController
                                                          .text = newValue!;
                                                    },
                                                    cursorColor: Theme.of(context).highlightColor,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Colors.white : Colors.transparent,
                                                      labelText: 'New Password',
                                                      labelStyle:
                                                          TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Theme.of(context).backgroundColor == Color(0XFFFFFFFF) ? Color(0XFF8ABA41) : Color(0XFFFFFFFF)
                                                      ),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: '••••••••',
                                                      hintStyle: Theme.of(context).textTheme.displaySmall,
                                                      suffixIcon: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            newPasswordAgainVisible =
                                                                !newPasswordAgainVisible;
                                                          });
                                                        },
                                                        icon: Icon(
                                                          newPasswordAgainVisible
                                                              ? BootstrapIcons
                                                                  .eye_slash
                                                              : BootstrapIcons
                                                                  .eye,
                                                          color: Theme.of(context).highlightColor,
                                                          size: 18,
                                                        ),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .fromLTRB(
                                                              10.0,
                                                              8.0,
                                                              10.0,
                                                              10.0),
                                                      enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.0)),
                                                ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    save
                                        ? Row(
                                            children: [
                                              Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.12),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                height: 36,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0.0, 20.0, 15.0, 5.0),
                                                child: MaterialButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      changePassword = false;
                                                      save = false;
                                                    });
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  color: Color(0XFF8ABA41),
                                                  splashColor:
                                                      const Color(0XFF8ABA41),
                                                  highlightColor:
                                                      const Color.fromARGB(
                                                          255, 116, 155, 58),
                                                  child: Text(
                                                    'Save',
                                                    style: Theme.of(context).textTheme.labelMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: payments
                          ? 82 + registeredCreditCardsNumbers.length * 60
                          : 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    20.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'PAYMENTS',
                                  style: Theme.of(context).textTheme.bodyMedium
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 2.0, 5.0, 0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    payments
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: 20,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      payments = !payments;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          payments
                              ? Column(
                                  children: [
                                    Container(
                                      height:
                                          registeredCreditCardsNumbers.length *
                                              52,
                                      child: ListView.builder(
                                        itemCount:
                                            registeredCreditCardsNumbers.length,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                              .fromLTRB(
                                                          15.0, 5.0, 0.0, 0.0),
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: const Icon(
                                                        BootstrapIcons
                                                            .credit_card_2_front,
                                                        color:
                                                            Color(0XFF8ABA41),
                                                        size: 25.0,
                                                      ),
                                                    ),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        getStorage.write('cardNumber', registeredCreditCardsNumbers[index][0]);
                                                        getStorage.write('cardholderName', registeredCreditCardsNumbers[index][1]);
                                                        getStorage.write('expirationDate', registeredCreditCardsNumbers[index][2]);
                                                        getStorage.write('cvv', registeredCreditCardsNumbers[index][3]);
                                                        getStorage.write('changeCreditCard', 'true');
                                                        Get.to(const AddCreditCard());
                                                      },
                                                      splashColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context).size.width * 0.6,
                                                            height: 36,
                                                            margin: const EdgeInsets
                                                                    .fromLTRB(0.0,
                                                                10.0, 0.0, 5.0),
                                                                          
                                                            child: Align(
                                                                alignment: Alignment.centerLeft,
                                                                child: Text(
                                                                  registeredCreditCardsNumbers[
                                                                      index][0],
                                                                  textAlign:
                                                                      TextAlign.left,
                                                                  style: Theme.of(context).textTheme.bodyMedium,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: const EdgeInsets.fromLTRB(20.0, 2.0, 0.0, 0.0),
                                                              child: Icon(
                                                                BootstrapIcons.chevron_right,
                                                                size: 16,
                                                                color: Theme.of(context).highlightColor,
                                                              ),
                                                            )
                                                        
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 32,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                              0.0,
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                              0.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          
                                          child: MaterialButton(
                                            onPressed: () {
                                              getStorage.write('cardNumber', '');
                                              getStorage.write('cardholderName', '');
                                              getStorage.write('expirationDate', '');
                                              getStorage.write('cvv', '');
                                              getStorage.write('changeCreditCard', 'false');
                                              Get.to(const AddCreditCard());
                                            },
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            child: Text(
                                              'ADD CREDİT CARD',
                                              style: Theme.of(context).textTheme.bodyLarge,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: sharing ? 200 : 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    20.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'SHARING',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 2.0, 5.0, 0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    sharing
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: 20,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      sharing = !sharing;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          sharing
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 15.0),
                                          alignment: Alignment.bottomCenter,
                                          child: const Icon(
                                            BootstrapIcons.people,
                                            color: Color(0XFF8ABA41),
                                            size: 25.0,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: 48,
                                          margin: const EdgeInsets.fromLTRB(
                                              0.0, 10.0, 15.0, 5.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Theme.of(context)
                                                    .highlightColor,
                                                width: 0.2,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        5.0, 15.0, 0.0, 0.0),
                                                alignment: Alignment.centerLeft,
                                                child: const Text(
                                                  '',
                                                  style: TextStyle(
                                                    color: Color(0XFF2A2B2E),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.0,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                ),
                                              ),
                                              Container(),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 25,
                                        ),
                                        Container(
                                          child: MaterialButton(
                                            onPressed: () {},
                                            //splashColor: Colors.transparent,
                                            //highlightColor: Colors.transparent,
                                            child: const Text('ADD PERSON',
                                                style: TextStyle(
                                                  color: Color(0XFF8ABA41),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                ),
                                                textAlign: TextAlign.left),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: app ? 120 : 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    20.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  'APP',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 2.0, 5.0, 0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    sharing
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: 20,
                                    color: Theme.of(context).highlightColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      app = !app;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          app
                              ? Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20.0, 5.0, 20.0, 0.0),
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Theme'),
                                          Container(
                                            alignment: Alignment.center,
                                            child:
                                                CupertinoSlidingSegmentedControl<
                                                    Sky>(
                                              backgroundColor: Theme.of(context)
                                                  .backgroundColor,
                                              thumbColor: Theme.of(context)
                                                          .backgroundColor ==
                                                      const Color(0XFFFFFFFF)
                                                  ? Color(0XFFFFC841)
                                                  : Color(0XFF2A2B2E),
                                              groupValue: Theme.of(context)
                                                          .backgroundColor ==
                                                      const Color(0XFFFFFFFF)
                                                  ? Sky.sun
                                                  : Sky.moon,
                                              onValueChanged: (Sky? value) {
                                                if (value != null) {
                                                  setState(() {
                                                    ThemeService()
                                                        .changeThemeMode();
                                                  });
                                                }
                                              },
                                              children: <Sky, Widget>{
                                                Sky.sun: Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Icon(
                                                      BootstrapIcons
                                                          .brightness_high_fill,
                                                      size: 18.0,
                                                      color: Theme.of(context)
                                                                  .backgroundColor ==
                                                              const Color(
                                                                  0XFFFFFFFF)
                                                          ? Colors.white
                                                          : Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                Sky.moon: Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2.0),
                                                    child: Icon(
                                                      BootstrapIcons.moon_stars,
                                                      size: 15.0,
                                                      color: Theme.of(context)
                                                                  .backgroundColor ==
                                                              const Color(
                                                                  0XFFFFFFFF)
                                                          ? Colors.transparent
                                                          : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(4.0, 5.0, 4.0, 50.0),
                      child: Material(
                        elevation: 0,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(12.0)),
                        color: const Color(0XFF8ABA41),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.zero,
                                bottom: Radius.circular(12.0)),
                          ),
                          splashColor: const Color(0XFF8ABA41),
                          highlightColor:
                              const Color.fromARGB(255, 116, 155, 58),
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
                              : const Text(
                                  'Log out',
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changePhotoBottomSheet() {
    Get.bottomSheet(Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.zero,
          top: Radius.circular(32.0),
        ),
        color: Color.fromARGB(255, 227, 230, 223),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
            child: SvgPicture.asset(
              'assets/images/line.svg',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: MaterialButton(
              height: 48.0,
              highlightColor: const Color.fromARGB(255, 206, 210, 201),
              splashColor: const Color.fromARGB(255, 206, 210, 201),
              onPressed: () {},
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: const Icon(
                      BootstrapIcons.camera,
                      size: 18,
                      color: Color(0XFF2A2B2E),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                    child: const Text(
                      'Camera',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0XFF2A2B2E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: MaterialButton(
              height: 48.0,
              highlightColor: const Color.fromARGB(255, 206, 210, 201),
              splashColor: const Color.fromARGB(255, 206, 210, 201),
              onPressed: () {},
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: const Icon(
                      BootstrapIcons.image,
                      size: 18,
                      color: Color(0XFF2A2B2E),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                    child: const Text(
                      'Gallery',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0XFF2A2B2E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: MaterialButton(
              height: 48.0,
              highlightColor: const Color.fromARGB(255, 206, 210, 201),
              splashColor: const Color.fromARGB(255, 206, 210, 201),
              onPressed: () {},
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: const Icon(
                      BootstrapIcons.trash3,
                      size: 18,
                      color: Color(0XFF2A2B2E),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                    child: const Text(
                      'Delete photo',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0XFF2A2B2E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
