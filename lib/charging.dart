import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Charging extends StatefulWidget {
  final String initialData;
  const Charging({super.key, required this.initialData});

  @override
  State<Charging> createState() => _ChargingState();
}

class _ChargingState extends State<Charging> {
  BuildContext? _alertDialog, _bottomSheet;

  final savedCardNumberEditingController =
      TextEditingController(text: '1234 **** **** 5678');
  final cardNumberEditingController = TextEditingController();
  final cardholderNameEditingController = TextEditingController();
  final cvvEditingController = TextEditingController();
  final expirationDateEditingController = TextEditingController();
  bool changeCardLoading = false;
  bool paymentLoading = false;

  List creditCardNumbers = [
    '1234 **** **** 5678',
    '5678 **** **** 1234',
  ];

  bool anotherCreditCard = false;
  bool saveCreditCard = false;

  int creditCardValue = 0;

  String deneme = '0';

  void onCreditCardChanged(int value) {
    setState(() {
      creditCardValue = value;
    });
  }

  bool isClosedBottomSheet = false;

  void onPaymentOptionChanged(int value) {
    setState(() {
      creditCardValue = value;
      savedCardNumberEditingController.text = creditCardNumbers[value];
    });
  }

  @override
  void initState() {
    super.initState();
    deneme = widget.initialData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        shadowColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: () {
              Get.back();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      child: Lottie.asset(
                        Theme.of(context).backgroundColor ==
                                const Color(0XFFFFFFFF)
                            ? 'assets/images/tap.json'
                            : 'assets/images/tap.json',
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: 210,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(105.0),
                        ),
                        child: CircularPercentIndicator(
                          radius: 105.0,
                          lineWidth: 15.0,
                          percent: 0.4,
                          progressColor: Theme.of(context).primaryColor,
                          backgroundColor: Theme.of(context).cardColor,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10.0),
                                child: const Icon(
                                  BootstrapIcons.lightning_charge_fill,
                                  color: Color(0XFF8ABA41),
                                  size: 20,
                                ),
                              ),
                              Text(
                                '40%',
                                style: TextStyle(
                                  color: Theme.of(context).highlightColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    'Charging..',
                    style: TextStyle(
                      color: const Color(0XFF8ABA41),
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.24,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.028,
                                MediaQuery.of(context).size.height * 0.014,
                                0.0,
                                MediaQuery.of(context).size.height * 0.021),
                            child: Text(
                              'Device Informations',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.03),
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.028),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Remaining Time',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                '01:27:45',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.028),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Charging fee',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                '€9',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.052,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.007,
                      MediaQuery.of(context).size.height * 0.021,
                      MediaQuery.of(context).size.width * 0.007,
                      0.0),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(12.0),
                    color: Theme.of(context).primaryColor,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.052,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      splashColor: Theme.of(context).primaryColor,
                      highlightColor: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          showPaymentScreen();
                        });
                      },
                      child: Text(
                        'Stop Charging And Pay',
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
    );
  }

  showPaymentScreen() {
    void getCreditCardValue(Function(int) onCreditCardChanged) {
      setState(() {
        creditCardValue;
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          _alertDialog = context;
          return AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            titlePadding: EdgeInsets.zero,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.025),
                  child: Icon(
                    BootstrapIcons.check_circle_fill,
                    color: Theme.of(context).primaryColor,
                    size: ScreenUtil().setSp(50),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.005),
                  child: Text(
                    'Congratulations',
                    style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(16)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.04),
                  child: Text(
                    'Your transaction is successful',
                    style: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenUtil().setSp(12)),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/dashed_lines.svg',
                  color: Theme.of(context).disabledColor,
                ),
              ],
            ),
            actions: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    0.0,
                    MediaQuery.of(context).size.height * 0.012,
                    MediaQuery.of(context).size.width * 0.006,
                    MediaQuery.of(context).size.height * 0.012),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.016),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Charging duration',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).size.height * 0.004),
                            child: Text(
                              '2 hours',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: ScreenUtil().setSp(12)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.016),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Charging fee',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.004),
                              child: Text(
                                '€ 18',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: ScreenUtil().setSp(12)),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                alignment: Alignment.center,
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.008),
                height: MediaQuery.of(context).size.height * 0.048,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: MaterialButton(
                  elevation: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    anotherCreditCard = false;
                    changeCreditCard();
                  },
                  child: Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10.0),
                        child: SvgPicture.asset(
                          'assets/images/box.svg',
                          width: MediaQuery.of(context).size.width * 0.028,
                          height: MediaQuery.of(context).size.height * 0.032,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.036),
                            child: Text('Credit Card',
                                textAlign: TextAlign.left,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.width * 0.036),
                            child: Text(
                              savedCardNumberEditingController.text,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenUtil().setSp(11),
                                color: const Color(0XFF131622),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.05,
                alignment: Alignment.center,
                 margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.007,
                      MediaQuery.of(context).size.height * 0.021,
                      MediaQuery.of(context).size.width * 0.007,
                      MediaQuery.of(context).size.height * 0.007),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(12.0),
                  color: Theme.of(context).primaryColor,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    splashColor: Theme.of(context).primaryColor,
                    highlightColor: Theme.of(context).primaryColorDark,
                    onPressed: () {
                      setState(() {
                        paymentLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          paymentLoading = false;
                          Get.back();
                          Get.back();
                        });
                      });
                      setState(() {});
                    },
                    child: paymentLoading
                        ? const CircularProgressIndicator(
                            color: Color(0XFFFFFDFA),
                            strokeWidth: 2.0,
                          )
                        : Text(
                            'PAY',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }

  changeCreditCard() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        _bottomSheet = context;
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: anotherCreditCard
                    ? ((creditCardNumbers.length + 1) * MediaQuery.of(context).size.height * 0.074) + MediaQuery.of(context).size.height * 0.5
                    : (creditCardNumbers.length + 1) * MediaQuery.of(context).size.height * 0.074,
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.018, 
                    horizontal: MediaQuery.of(context).size.width * 0.036
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24.0),
                    bottom: Radius.zero,
                  ),
                  color: Theme.of(context).backgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: creditCardNumbers.length * 50,
                      child: ListView.builder(
                          itemCount: creditCardNumbers.length,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.center,
                              height: 48,
                              child: Material(
                                elevation: 0,
                                color: Theme.of(context).backgroundColor,
                                child: MaterialButton(
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 40,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: SvgPicture.asset(
                                              'assets/images/box.svg',
                                              width: MediaQuery.of(context).size.width * 0.028,
                                              height: MediaQuery.of(context).size.height * 0.032,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context).size.width * 0.036),
                                            child: Text(
                                              creditCardNumbers[index],
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Transform.scale(
                                        scale: 0.9,
                                        child: Radio(
                                          value: index,
                                          groupValue: creditCardValue,
                                          onChanged: (value) {
                                            setState(() {
                                              print(value);
                                              creditCardValue = value!;
                                              Navigator.pop(context);
                                              isClosedBottomSheet = true;
                                              onPaymentOptionChanged(value);
                                              savedCardNumberEditingController
                                                      .text =
                                                  creditCardNumbers[value];
                                              Navigator.of(_alertDialog
                                                      as BuildContext)
                                                  .pop();
                                              showPaymentScreen();
                                            });
                                          },
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.selected)) {
                                                return const Color(0XFF8ABA41);
                                              }
                                              return Theme.of(context)
                                                  .highlightColor;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      creditCardValue = index;
                                      onCreditCardChanged(index);
                                      Navigator.pop(context);
                                      isClosedBottomSheet = true;
                                      onPaymentOptionChanged(index);
                                      savedCardNumberEditingController.text =
                                          creditCardNumbers[index];
                                      Navigator.of(
                                        _alertDialog!,
                                      ).pop();
                                      showPaymentScreen();
                                    });
                                  },
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.025),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: anotherCreditCard
                            ? Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).disabledColor,
                                  width: 0.2,
                                ),
                              )
                            : const Border(),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            anotherCreditCard = true;
                          });
                        },
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ANOTHER CREDİT CARD',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                    anotherCreditCard
                        ? Container(
                          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                          child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.022,
                                      MediaQuery.of(context).size.height * 0.028,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.008),
                                  child: Text(
                                    'Card Number',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.052,
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: cardNumberEditingController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(16),
                                      CardNumberFormatter(),
                                    ],
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "⛔ This field is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        cardNumberEditingController.text =
                                            newValue;
                                        cardNumberEditingController.selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                                    offset:
                                                        cardNumberEditingController
                                                            .text.length));
                                      });
                                    },
                                    onTap: () {
                                      setState(() {});
                                    },
                                    cursorColor: Theme.of(context).highlightColor,
                                    textInputAction: TextInputAction.next,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context).textTheme.titleSmall,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: 'XXXX XXXX XXXX XXXX',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.start,
                                      prefixIcon: Icon(
                                          BootstrapIcons.credit_card_2_front,
                                          size: ScreenUtil().setSp(16)),
                                      prefixIconColor: Theme.of(context).primaryColor,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).hoverColor),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).hoverColor),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).hoverColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.022,
                                      MediaQuery.of(context).size.height * 0.028,
                                      0.0,
                                      MediaQuery.of(context).size.height * 0.008),
                                  child: Text(
                                    'Cardholder Name',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.052,
                                  child: TextFormField(
                                    autofocus: false,
                                    controller: cardholderNameEditingController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "⛔ This field is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      setState(() {
                                        cardholderNameEditingController.text =
                                            value;
                                        cardholderNameEditingController
                                                .selection =
                                            TextSelection.fromPosition(
                                                TextPosition(
                                          offset: cardholderNameEditingController
                                              .text.length,
                                        ));
                                      });
                                    },
                                    onTap: () {
                                      setState(() {});
                                    },
                                    cursorColor: Theme.of(context).highlightColor,
                                    textInputAction: TextInputAction.next,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context).textTheme.titleSmall,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: 'Cardholder Name',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.start,
                                      prefixIcon: Icon(
                                        BootstrapIcons.person,
                                        size: ScreenUtil().setSp(17),
                                      ),
                                      prefixIconColor: Theme.of(context).primaryColor,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10.0, 0.0, 10.0, 0.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).hoverColor),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).hoverColor),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).hoverColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                              MediaQuery.of(context).size.height * 0.028,
                                              0.0,
                                              MediaQuery.of(context).size.height * 0.008),
                                          child: Text(
                                            'CVV',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.36,
                                          height: MediaQuery.of(context).size.height * 0.052,
                                          child: TextFormField(
                                            autofocus: false,
                                            controller: cvvEditingController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(3),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "⛔ This field is required";
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                cvvEditingController.text = value;
                                                cvvEditingController.selection =
                                                    TextSelection.fromPosition(
                                                        TextPosition(
                                                            offset:
                                                                cvvEditingController
                                                                    .text
                                                                    .length));
                                              });
                                            },
                                            onTap: () {
                                              setState(() {});
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
                                              fillColor: Colors.transparent,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              hintText: 'CVV',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              floatingLabelAlignment:
                                                  FloatingLabelAlignment.start,
                                              prefixIcon: Icon(
                                                BootstrapIcons.credit_card,
                                                size: ScreenUtil().setSp(16),
                                              ),
                                              prefixIconColor: Theme.of(context).primaryColor,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .hoverColor),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .hoverColor),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .hoverColor),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context).size.width *
                                                  0.022,
                                              MediaQuery.of(context).size.height * 0.028,
                                              MediaQuery.of(context).size.width *
                                                  0.025,
                                              MediaQuery.of(context).size.height * 0.008),
                                          child: Text(
                                            'Expiration Date',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.36,
                                          height: MediaQuery.of(context).size.height * 0.052,
                                          child: TextFormField(
                                            autofocus: false,
                                            controller:
                                                expirationDateEditingController,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(4),
                                              CardExpirationFormatter(),
                                            ],
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "⛔ This field is required";
                                              }
                                              return null;
                                            },
                                            onChanged: (value) {
                                              setState(() {
                                                expirationDateEditingController
                                                    .text = value;
                                                expirationDateEditingController
                                                        .selection =
                                                    TextSelection.fromPosition(
                                                        TextPosition(
                                                            offset:
                                                                expirationDateEditingController
                                                                    .text
                                                                    .length));
                                              });
                                            },
                                            onTap: () {
                                              setState(() {
                                                expirationDateEditingController
                                                    .text;
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
                                              fillColor: Colors.transparent,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              hintText: 'MM/YY',
                                              hintStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              floatingLabelAlignment:
                                                  FloatingLabelAlignment.start,
                                              prefixIcon: Icon(
                                                BootstrapIcons.calendar_event,
                                                size: ScreenUtil().setSp(16)
                                              ),
                                              prefixIconColor: Theme.of(context).primaryColor,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .hoverColor),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .hoverColor),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .hoverColor),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(
                                      MediaQuery.of(context).size.width * 0.022,
                                      MediaQuery.of(context).size.height * 0.028,
                                      0.0,
                                      0.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Save credit card',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Switch(
                                        value: saveCreditCard,
                                        onChanged: (bool value) {
                                          setState(() {
                                            saveCreditCard = value;
                                          });
                                        },
                                        activeColor: Theme.of(context).primaryColor,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.052,
                                  alignment: Alignment.center,
                                  child: Material(
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: Theme.of(context).primaryColor,
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width * 0.84,
                                      height: MediaQuery.of(context).size.height * 0.052,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      splashColor: Theme.of(context).primaryColor,
                                      highlightColor: Theme.of(context).primaryColorDark,
                                      onPressed: () {
                                        setState(() {
                                          changeCardLoading = true;
                                        });
                                        Future.delayed(const Duration(seconds: 1),
                                            () {
                                          setState(() {
                                            changeCardLoading = false;
                                            Navigator.pop(context);
                                            isClosedBottomSheet = true;
                                            anotherCreditCard = false;
                                          });
                                        });
                                      },
                                      child: changeCardLoading
                                          ? const CircularProgressIndicator(
                                              color: Color(0XFFFFFDFA),
                                              strokeWidth: 2.0,
                                            )
                                          : Text(
                                              'Add Card',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        )
                        : Container()
                  ],
                ));
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

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != ' ') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 4 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += ' ';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
