import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:evops/addCreditCard.dart';
import 'package:evops/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  bool profilePhoto = false;

  List registeredCreditCardsNumbers = [
    ['7786 6768 6878 687', 'RABİA NUR TÜNEN', '10/26', '403'],
    ['6574 6574 6757 5745', 'RABİA NUR TÜNEN', '13/29', '728'],
    ['7865 7948 9479 0437', 'RABİA NUR TÜNEN', '09/25', '578'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Scrollbar(
          controller: _scrollController,
          thickness: 5,
          radius: const Radius.circular(20.0),
          scrollbarOrientation: ScrollbarOrientation.right,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0.0,
                      MediaQuery.of(context).size.height * 0.04,
                      0.0,
                      MediaQuery.of(context).size.height * 0.06),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).cardColor,
                        radius: MediaQuery.of(context).size.width * 0.13,
                        child: Icon(
                          BootstrapIcons.person_fill,
                          color: Theme.of(context).primaryColor,
                          size: ScreenUtil().setSp(33),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.18,
                            MediaQuery.of(context).size.width * 0.16,
                            0.0,
                            0.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.095,
                            height: MediaQuery.of(context).size.width * 0.095,
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.008),
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                shape: BoxShape.circle),
                            child: MaterialButton(
                              elevation: 0,
                              shape: const CircleBorder(),
                              color: Theme.of(context).primaryColor,
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.008),
                              onPressed: () {
                                setState(() {
                                  changePhotoModal();
                                });
                              },
                              splashColor: Theme.of(context).primaryColor,
                              highlightColor: Theme.of(context).primaryColorDark,
                              child: Icon(
                                BootstrapIcons.pencil,
                                size: ScreenUtil().setSp(11),
                                color: const Color(0XFFFFFDFA),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: personalInformation
                          ? save
                              ? changePassword
                                  ? MediaQuery.of(context).size.height * 0.58
                                  : MediaQuery.of(context).size.height * 0.45
                              : MediaQuery.of(context).size.height * 0.38
                          : MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.006,
                        0.0,
                        MediaQuery.of(context).size.width * 0.006,
                        MediaQuery.of(context).size.height * 0.009,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12.0), bottom: Radius.zero),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.056,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Text(
                                  'PERSONAL INFORMATION',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    0.0,
                                    0.0,
                                    MediaQuery.of(context).size.width * 0.028,
                                    0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    personalInformation
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: ScreenUtil().setSp(16),
                                    color: Theme.of(context).highlightColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      personalInformation = !personalInformation;
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
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.036,
                                              MediaQuery.of(context).size.height *
                                                  0.003,
                                              0.0,
                                              0.0),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            BootstrapIcons.person,
                                            color: Theme.of(context).primaryColor,
                                            size: ScreenUtil().setSp(22),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.66,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.042,
                                          margin: EdgeInsets.fromLTRB(
                                              0.0,
                                              MediaQuery.of(context).size.height *
                                                  0.015,
                                              MediaQuery.of(context).size.width *
                                                  0.036,
                                              MediaQuery.of(context).size.height *
                                                  0.006),
                                          child: TextFormField(
                                            autofocus: false,
                                            controller: fullNameEditingController,
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
                                                Theme.of(context).highlightColor,
                                            textInputAction: TextInputAction.next,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Theme.of(context)
                                                          .backgroundColor ==
                                                      Color(0XFFFFFFFF)
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0),
                                              hintText: 'Full Name',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.042,
                                              MediaQuery.of(context).size.height *
                                                  0.003,
                                              MediaQuery.of(context).size.width *
                                                  0.012,
                                              0.0),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            BootstrapIcons.envelope_at,
                                            color: Theme.of(context).primaryColor,
                                            size: ScreenUtil().setSp(20),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.66,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.042,
                                          margin: EdgeInsets.fromLTRB(
                                              0.0,
                                              MediaQuery.of(context).size.height *
                                                  0.015,
                                              MediaQuery.of(context).size.width *
                                                  0.036,
                                              MediaQuery.of(context).size.height *
                                                  0.006),
                                          child: TextFormField(
                                            autofocus: false,
                                            controller: emailEditingController,
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
                                                Theme.of(context).highlightColor,
                                            textInputAction: TextInputAction.next,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Theme.of(context)
                                                          .backgroundColor ==
                                                      Color(0XFFFFFFFF)
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0),
                                              hintText: 'name@example.com',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.042,
                                              MediaQuery.of(context).size.height *
                                                  0.003,
                                              MediaQuery.of(context).size.width *
                                                  0.012,
                                              0.0),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            BootstrapIcons.telephone,
                                            color: Theme.of(context).primaryColor,
                                            size: ScreenUtil().setSp(20),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.66,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.042,
                                          margin: EdgeInsets.fromLTRB(
                                              0.0,
                                              MediaQuery.of(context).size.height *
                                                  0.015,
                                              MediaQuery.of(context).size.width *
                                                  0.036,
                                              MediaQuery.of(context).size.height *
                                                  0.006),
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
                                                Theme.of(context).highlightColor,
                                            textInputAction: TextInputAction.next,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Theme.of(context)
                                                          .backgroundColor ==
                                                      Color(0XFFFFFFFF)
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0),
                                              hintText: 'Phone Number',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.042,
                                              MediaQuery.of(context).size.height *
                                                  0.003,
                                              MediaQuery.of(context).size.width *
                                                  0.012,
                                              0.0),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            BootstrapIcons.geo_alt,
                                            color: Theme.of(context).primaryColor,
                                            size: ScreenUtil().setSp(21),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.66,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.042,
                                          margin: EdgeInsets.fromLTRB(
                                              0.0,
                                              MediaQuery.of(context).size.height *
                                                  0.015,
                                              MediaQuery.of(context).size.width *
                                                  0.036,
                                              MediaQuery.of(context).size.height *
                                                  0.006),
                                          child: TextFormField(
                                            autofocus: false,
                                            controller: locationEditingController,
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
                                                Theme.of(context).highlightColor,
                                            textInputAction: TextInputAction.next,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Theme.of(context)
                                                          .backgroundColor ==
                                                      Color(0XFFFFFFFF)
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              contentPadding: EdgeInsets.fromLTRB(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0,
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03,
                                                  0.0),
                                              hintText: 'City, Country',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    changePassword == false
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.06,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.003,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.024,
                                                    0.0),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  BootstrapIcons.lock,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: ScreenUtil().setSp(21),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.66,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.042,
                                                margin: EdgeInsets.fromLTRB(
                                                    0.0,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.015,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.036,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.006),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    MaterialButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          changePassword = true;
                                                          save = true;
                                                        });
                                                      },
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      child: Text(
                                                          'CHANGE PASSWORD',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge,
                                                          textAlign:
                                                              TextAlign.left),
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
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.042,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.003,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.012,
                                                    0.0),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  BootstrapIcons.lock,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: ScreenUtil().setSp(21),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.66,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.042,
                                                margin: EdgeInsets.fromLTRB(
                                                    0.0,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.015,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.036,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.006),
                                                child: TextFormField(
                                                  autofocus: false,
                                                  controller:
                                                      oldPasswordEditingController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  obscureText: oldPasswordVisible,
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
                                                  cursorColor: Theme.of(context)
                                                      .highlightColor,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Theme.of(context)
                                                                .backgroundColor ==
                                                            const Color(
                                                                0XFFFFFFFF)
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                    labelText: 'Old Password',
                                                    labelStyle: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        color: Theme.of(context)
                                                                    .backgroundColor ==
                                                                const Color(
                                                                    0XFFFFFFFF)
                                                            ? const Color(
                                                                0XFF8ABA41)
                                                            : const Color(
                                                                0XFFFFFFFF)),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: '••••••••',
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
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
                                                            : BootstrapIcons.eye,
                                                        color: Theme.of(context)
                                                            .highlightColor,
                                                        size: ScreenUtil()
                                                            .setSp(16),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            0.0,
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            0.0),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(
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
                                            ],
                                          )
                                        : Container(),
                                    changePassword
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.042,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.003,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.012,
                                                    0.0),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  BootstrapIcons.lock,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: ScreenUtil().setSp(21),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.66,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.042,
                                                margin: EdgeInsets.fromLTRB(
                                                    0.0,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.015,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.036,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.006),
                                                child: TextFormField(
                                                  autofocus: false,
                                                  controller:
                                                      newPasswordEditingController,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  obscureText: newPasswordVisible,
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
                                                  cursorColor: Theme.of(context)
                                                      .highlightColor,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Theme.of(context)
                                                                .backgroundColor ==
                                                            const Color(
                                                                0XFFFFFFFF)
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                    labelText: 'New Password',
                                                    labelStyle: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        color: Theme.of(context)
                                                                    .backgroundColor ==
                                                                Color(0XFFFFFFFF)
                                                            ? Color(0XFF8ABA41)
                                                            : Color(0XFFFFFFFF)),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: '••••••••',
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
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
                                                            : BootstrapIcons.eye,
                                                        color: Theme.of(context)
                                                            .highlightColor,
                                                        size: ScreenUtil()
                                                            .setSp(16),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            0.0,
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            0.0),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(
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
                                            ],
                                          )
                                        : Container(),
                                    changePassword
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.042,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.003,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.012,
                                                    0.0),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  BootstrapIcons.lock,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: ScreenUtil().setSp(21),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.66,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.042,
                                                margin: EdgeInsets.fromLTRB(
                                                    0.0,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.015,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.036,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.006),
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
                                                  cursorColor: Theme.of(context)
                                                      .highlightColor,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Theme.of(context)
                                                                .backgroundColor ==
                                                            Color(0XFFFFFFFF)
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                    labelText: 'New Password',
                                                    labelStyle: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: ScreenUtil()
                                                            .setSp(12),
                                                        color: Theme.of(context)
                                                                    .backgroundColor ==
                                                                const Color(
                                                                    0XFFFFFFFF)
                                                            ? const Color(
                                                                0XFF8ABA41)
                                                            : const Color(
                                                                0XFFFFFFFF)),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: '••••••••',
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall,
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
                                                            : BootstrapIcons.eye,
                                                        color: Theme.of(context)
                                                            .highlightColor,
                                                        size: ScreenUtil()
                                                            .setSp(16),
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            0.0,
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.03,
                                                            0.0),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    border:
                                                        const OutlineInputBorder(
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
                                            ],
                                          )
                                        : Container(),
                                    save
                                        ? Container(
                                            alignment: Alignment.centerRight,
                                            margin: EdgeInsets.fromLTRB(
                                                0.0,
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.006,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05,
                                                0.0),
                                            child: MaterialButton(
                                              minWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.66,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.042,
                                              onPressed: () {
                                                setState(() {
                                                  changePassword = false;
                                                  save = false;
                                                });
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              color:
                                                  Theme.of(context).primaryColor,
                                              splashColor:
                                                  Theme.of(context).primaryColor,
                                              highlightColor: Theme.of(context)
                                                  .primaryColorDark,
                                              child: Text(
                                                'Save',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: payments
                          ? MediaQuery.of(context).size.height * 0.1 +
                              registeredCreditCardsNumbers.length * 60
                          : MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.006,
                        0.0,
                        MediaQuery.of(context).size.width * 0.006,
                        MediaQuery.of(context).size.height * 0.009,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.056,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Text(
                                  'PAYMENTS',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    0.0,
                                    0.0,
                                    MediaQuery.of(context).size.width * 0.028,
                                    0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    payments
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: ScreenUtil().setSp(16),
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
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              MediaQuery.of(context).size.width *
                                                  0.028),
                                      height:
                                          registeredCreditCardsNumbers.length *
                                              48,
                                      child: ListView.builder(
                                        itemCount:
                                            registeredCreditCardsNumbers.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.036,
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.003,
                                                      0.0,
                                                      0.0),
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    BootstrapIcons
                                                        .credit_card_2_front,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    size: ScreenUtil().setSp(22),
                                                  ),
                                                ),
                                                MaterialButton(
                                                  onPressed: () {
                                                    getStorage.write(
                                                        'cardNumber',
                                                        registeredCreditCardsNumbers[
                                                            index][0]);
                                                    getStorage.write(
                                                        'cardholderName',
                                                        registeredCreditCardsNumbers[
                                                            index][1]);
                                                    getStorage.write(
                                                        'expirationDate',
                                                        registeredCreditCardsNumbers[
                                                            index][2]);
                                                    getStorage.write(
                                                        'cvv',
                                                        registeredCreditCardsNumbers[
                                                            index][3]);
                                                    getStorage.write(
                                                        'changeCreditCard',
                                                        'true');
                                                    Get.to(const AddCreditCard());
                                                  },
                                                  splashColor: Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                0.008),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: Theme.of(
                                                                        context)
                                                                    .disabledColor))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.54,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                          margin: EdgeInsets.fromLTRB(
                                                              0.0,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.004,
                                                              0.0,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.002),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              registeredCreditCardsNumbers[
                                                                  index][0],
                                                              textAlign:
                                                                  TextAlign.left,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          BootstrapIcons
                                                              .chevron_right,
                                                          size: ScreenUtil()
                                                              .setSp(14),
                                                          color: Theme.of(context)
                                                              .highlightColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.125,
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.05,
                                              0.0,
                                              MediaQuery.of(context).size.width *
                                                  0.01,
                                              0.0),
                                          child: MaterialButton(
                                            onPressed: () {
                                              getStorage.write('cardNumber', '');
                                              getStorage.write(
                                                  'cardholderName', '');
                                              getStorage.write(
                                                  'expirationDate', '');
                                              getStorage.write('cvv', '');
                                              getStorage.write(
                                                  'changeCreditCard', 'false');
                                              Get.to(const AddCreditCard());
                                            },
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            child: Text(
                                              'ADD CREDİT CARD',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
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
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.006,
                        0.0,
                        MediaQuery.of(context).size.width * 0.006,
                        MediaQuery.of(context).size.height * 0.009,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.056,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Text(
                                  'SHARING',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    0.0,
                                    0.0,
                                    MediaQuery.of(context).size.width * 0.028,
                                    0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    sharing
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: ScreenUtil().setSp(16),
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
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.006,
                        0.0,
                        MediaQuery.of(context).size.width * 0.006,
                        MediaQuery.of(context).size.height * 0.009,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.056,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Text(
                                  'APP',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(
                                    0.0,
                                    0.0,
                                    MediaQuery.of(context).size.width * 0.028,
                                    0.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    app
                                        ? BootstrapIcons.chevron_up
                                        : BootstrapIcons.chevron_down,
                                    size: ScreenUtil().setSp(16),
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
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.006,
                        0.0,
                        MediaQuery.of(context).size.width * 0.006,
                        MediaQuery.of(context).size.height * 0.009,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.006,
                        0.0,
                        MediaQuery.of(context).size.width * 0.006,
                        MediaQuery.of(context).size.height * 0.009,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.006,
                        0.0,
                        MediaQuery.of(context).size.width * 0.006,
                        MediaQuery.of(context).size.height * 0.009,
                      ),
                      child: Material(
                        elevation: 0,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.zero, bottom: Radius.circular(12.0)),
                        color: Theme.of(context).primaryColor,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.88,
                          height: MediaQuery.of(context).size.height * 0.06,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.zero, bottom: Radius.circular(12.0)),
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
                                  'Log out',
                                  style: Theme.of(context).textTheme.labelMedium,
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

  changePhotoModal() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: profilePhoto
                  ? MediaQuery.of(context).size.height * 0.24
                  : MediaQuery.of(context).size.height * 0.18,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.006,
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.zero,
                    top: Radius.circular(24.0),
                  ),
                  color: Theme.of(context).backgroundColor),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.012),
                        child: SvgPicture.asset(
                          'assets/images/line.svg',
                          height: MediaQuery.of(context).size.height * 0.0048,
                          color: const Color(0XFFFFFDFA),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002),
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.04,
                          splashColor: Theme.of(context).hoverColor,
                          highlightColor: Theme.of(context).hoverColor,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.012,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Icon(
                                  BootstrapIcons.camera,
                                  size: ScreenUtil().setSp(18),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.036,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Text(
                                  'Camera',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.002),
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height * 0.04,
                          splashColor: Theme.of(context).hoverColor,
                          highlightColor: Theme.of(context).hoverColor,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.012,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Icon(
                                  BootstrapIcons.image,
                                  size: ScreenUtil().setSp(16),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.036,
                                    0.0,
                                    0.0,
                                    0.0),
                                child: Text(
                                  'Gallery',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      profilePhoto
                          ? Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.002),
                              child: MaterialButton(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                splashColor: Theme.of(context).hoverColor,
                                highlightColor: Theme.of(context).hoverColor,
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.012,
                                          0.0,
                                          0.0,
                                          0.0),
                                      child: Icon(
                                        BootstrapIcons.x_lg,
                                        size: ScreenUtil().setSp(17),
                                        color: Colors.red,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width *
                                              0.036,
                                          0.0,
                                          0.0,
                                          0.0),
                                      child: Text(
                                        'Delete photo',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: ScreenUtil().setSp(12),
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36.0),
          bottom: Radius.zero,
        ),
      ),
    );
  }
}
