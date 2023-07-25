import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/addCreditCard.dart';
import 'package:evops/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum Sky { sun, moon }

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _scrollController = ScrollController();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 75.0),
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0XFFF0F1F0),
                        radius: 48.0,
                        child: Icon(BootstrapIcons.person_fill,
                            color: Color(0XFF8ABA41), size: 36.0),
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
                              highlightColor: const Color.fromARGB(255, 116, 155, 58),
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
                      width: MediaQuery.of(context).size.width * 0.9,
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
                                  style: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
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
                                              cursorColor:
                                                  const Color(0XFF2A2B2E),
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0XFF2A2B2E),
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    const Color(0XFFFFFDFA),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
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
                                              cursorColor:
                                                  const Color(0XFF2A2B2E),
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0XFF2A2B2E),
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    const Color(0XFFFFFDFA),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
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
                                              cursorColor:
                                                  const Color(0XFF2A2B2E),
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0XFF2A2B2E),
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    const Color(0XFFFFFDFA),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
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
                                              cursorColor:
                                                  const Color(0XFF2A2B2E),
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0XFF2A2B2E),
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor:
                                                    const Color(0XFFFFFDFA),
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        10.0, 8.0, 10.0, 10.0),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Color(0XFFFFFDFA)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                border:
                                                    const OutlineInputBorder(
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
                                                        //splashColor: Colors.transparent,
                                                        //highlightColor: Colors.transparent,
                                                        child: const Text(
                                                            'CHANGE PASSWORD',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0XFF8ABA41),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14.0,
                                                            ),
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
                                                    cursorColor:
                                                        const Color(0XFF2A2B2E),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: Color(0XFF2A2B2E),
                                                    ),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0XFFFFFDFA),
                                                      labelText: 'Old Password',
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 59, 97, 2),
                                                      ),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: '••••••••',
                                                      hintStyle:
                                                          const TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0XFF595550),
                                                      ),
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
                                                          color: const Color(
                                                              0XFF2A2B2E),
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
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0XFFFFFDFA)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0XFFFFFDFA)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      border:
                                                          const OutlineInputBorder(
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
                                                    cursorColor:
                                                        const Color(0XFF2A2B2E),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: Color(0XFF2A2B2E),
                                                    ),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0XFFFFFDFA),
                                                      labelText: 'New Password',
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 59, 97, 2),
                                                      ),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: '••••••••',
                                                      hintStyle:
                                                          const TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0XFF595550),
                                                      ),
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
                                                          color: const Color(
                                                              0XFF2A2B2E),
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
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0XFFFFFDFA)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0XFFFFFDFA)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      border:
                                                          const OutlineInputBorder(
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
                                                    cursorColor:
                                                        const Color(0XFF2A2B2E),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .center,
                                                    style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: Color(0XFF2A2B2E),
                                                    ),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: const Color(
                                                          0XFFFFFDFA),
                                                      labelText: 'New Password',
                                                      labelStyle:
                                                          const TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Color.fromARGB(
                                                            255, 59, 97, 2),
                                                      ),
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      hintText: '••••••••',
                                                      hintStyle:
                                                          const TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0XFF595550),
                                                      ),
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
                                                          color: const Color(
                                                              0XFF595550),
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
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0XFFFFFDFA)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Color(
                                                                    0XFFFFFDFA)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      border:
                                                          const OutlineInputBorder(
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
                                                      0.14),
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
                                                  child: const Text(
                                                    'Save',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color: Color(0XFFFFFDFA),
                                                      letterSpacing: 1.5,
                                                    ),
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: payments
                          ? 105 + registeredCreditCardsNumbers.length * 60
                          : 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
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
                                  style: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
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
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
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
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      height: 36,
                                                      margin: const EdgeInsets
                                                              .fromLTRB(15.0,
                                                          10.0, 15.0, 5.0),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0)),
                                                      child: MaterialButton(
                                                        highlightColor:
                                                            Colors.transparent,
                                                        splashColor:
                                                            Colors.transparent,
                                                        onPressed: () {},
                                                        child: Text(
                                                          registeredCreditCardsNumbers[
                                                              index][0],
                                                          textAlign:
                                                              TextAlign.left,
                                                        ),
                                                      ),
                                                    ),
                                                    /*
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  height: 48,
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0.0, 10.0, 15.0, 5.0),
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color:
                                                            Color(0XFF2A2B2E),
                                                        width: 0.2,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(5.0,
                                                            15.0, 0.0, 0.0),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          registeredCreditCardsNumbers[index][0].toString(),
                                                          style: const TextStyle(
                                                            color: Color(
                                                                0XFF2A2B2E),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.0,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(0.0,
                                                            10.0, 0.0, 0.0),
                                                        child: const Icon(
                                                          BootstrapIcons.chevron_right,
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                               */
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
                                          width: 50,
                                          height: 25,
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
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Color(0XFF2A2B2E),
                                                width: 0.2,
                                              ),
                                            ),
                                          ),
                                          child: MaterialButton(
                                            onPressed: () {
                                              Get.to(const AddCreditCard());
                                            },
                                            //splashColor: Colors.transparent,
                                            //highlightColor: Colors.transparent,
                                            child: const Text('ADD CREDİT CARD',
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
                      width: MediaQuery.of(context).size.width * 0.9,
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
                                  style: TextStyle(
                                    color: Theme.of(context).highlightColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
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
                                                color: Theme.of(context).highlightColor,
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
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
