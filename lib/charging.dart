import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Charging extends StatefulWidget {
  const Charging({super.key});

  @override
  State<Charging> createState() => _ChargingState();
}

class _ChargingState extends State<Charging> {
  final savedCardNumberEditingController =
      TextEditingController(text: '1234 **** **** 5678');
  final cardNumberEditingController = TextEditingController();
  final cardholderNameEditingController = TextEditingController();
  final cvvEditingController = TextEditingController();
  final expirationDateEditingController = TextEditingController();
  bool isLoading = false;

  List creditCardNumbers = [
    '1234 **** **** 5678',
    '5678 **** **** 1234',
  ];

  bool anotherCreditCard = false;
  bool saveCreditCard = false;

  int creditCardValue = 0;

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
              children: [
                Container(
              child: Lottie.asset(
                'assets/images/charge.json',
                width: 300,
                height: 300,
              ),
            ),
                /*
                Container(
                    alignment: Alignment.center,
                    child: CircularPercentIndicator(
                      radius: 120.0,
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
                                color: Color(0XFF8ABA41)),
                          ),
                          Text(
                            '40%',
                            style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    )),
                */
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  child: const Text(
                    'Charging...',
                    style: TextStyle(
                      color: Color(0XFF8ABA41),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
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
                        child: Column()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.03),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.03),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12.0)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(4.0, 28.0, 4.0, 0.0),
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
                          showPaymentScreen();
                        });
                      },
                      child: const Text(
                        'STOP CHARGING AND PAY',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
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
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            titlePadding: EdgeInsets.zero,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Icon(
                    BootstrapIcons.check_circle_fill,
                    color: Theme.of(context).primaryColor,
                    size: 60,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    'Congratulations',
                    style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    'Your transaction is successful',
                    style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                SvgPicture.asset('assets/images/dashed_lines.svg',
                    color: Color(0XFFA3A4AB)),
              ],
            ),
            actions: [
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Charging duration',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '2 hours',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '140 TL',
                              style: TextStyle(
                                color: Theme.of(context).highlightColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 8.0),
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: MaterialButton(
                  elevation: 0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    changeCreditCard();
                  },
                  child: Row(
                    children: [
                      Container(
                        //margin: const EdgeInsets.only(left: 10.0),
                        child: SvgPicture.asset(
                          'assets/images/box.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Credit Card',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              savedCardNumberEditingController.text,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color(0XFF2A2B2E),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
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
                width: MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(4.0, 28.0, 4.0, 4.0),
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
                    highlightColor: const Color.fromARGB(255, 116, 155, 58),
                    onPressed: () {
                      setState(() {
                        showPaymentScreen();
                      });
                    },
                    child: const Text(
                      'PAY',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0XFFFFFDFA),
                        letterSpacing: 1.5,
                      ),
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
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: anotherCreditCard
                    ? ((creditCardNumbers.length + 1) * 60) + 440
                    : (creditCardNumbers.length + 1) * 60,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 22.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16.0),
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
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                left: 15.0),
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
                                              //showPaymentScreen();

                                              /*
                                              showPaymentScreen().then(() {
                                                setState(() {
                                                  creditCardValue = value;
                                                });
                                              });
                                              */
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
                                      //showPaymentScreen();
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
                        ? Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.07,
                                    20.0,
                                    MediaQuery.of(context).size.width * 0.07,
                                    8.0),
                                child: Text(
                                  'Card Number',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
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
                                    prefixIcon: const Icon(
                                        BootstrapIcons.credit_card_2_front,
                                        size: 20),
                                    prefixIconColor: const Color(0XFF8ABA41),
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
                                    MediaQuery.of(context).size.width * 0.07,
                                    20.0,
                                    MediaQuery.of(context).size.width * 0.07,
                                    8.0),
                                child: Text(
                                  'Cardholder Name',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
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
                                    prefixIcon: const Icon(
                                      BootstrapIcons.person,
                                      size: 20,
                                    ),
                                    prefixIconColor: const Color(0XFF8ABA41),
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
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                            20.0,
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                            8.0),
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
                                                0.37,
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
                                            prefixIcon: const Icon(
                                              BootstrapIcons.credit_card,
                                              size: 20,
                                            ),
                                            prefixIconColor:
                                                const Color(0XFF8ABA41),
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
                                                0.024,
                                            20.0,
                                            MediaQuery.of(context).size.width *
                                                0.024,
                                            8.0),
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
                                                0.37,
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
                                            prefixIcon: const Icon(
                                              BootstrapIcons.calendar_event,
                                              size: 20,
                                            ),
                                            prefixIconColor:
                                                const Color(0XFF8ABA41),
                                            //suffixIcon: Icon(),
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
                                    MediaQuery.of(context).size.width * 0.07,
                                    20.0,
                                    MediaQuery.of(context).size.width * 0.05,
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
                                      activeColor: const Color(0XFF8ABA41),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.fromLTRB(
                                    4.0, 8.0, 4.0, 40.0),
                                child: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: const Color(0XFF8ABA41),
                                  child: MaterialButton(
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 48,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    splashColor: const Color(0XFF8ABA41),
                                    highlightColor: const Color.fromARGB(
                                        255, 116, 155, 58), //Color(0XFF749B3A)
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        setState(() {
                                          isLoading = false;
                                          Navigator.pop(context);
                                          isClosedBottomSheet = true;
                                          //showPaymentScreen();
                                        });
                                      });
                                    },
                                    child: isLoading
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
                          )
                        : Container()
                  ],
                ));
          },
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
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

class ShowPayment extends StatefulWidget {
  const ShowPayment({super.key});

  @override
  State<ShowPayment> createState() => _ShowPaymentState();
}

class _ShowPaymentState extends State<ShowPayment> {
  final savedCardNumberEditingController =
      TextEditingController(text: '1234 **** **** 5678');
  final cardNumberEditingController = TextEditingController();
  final cardholderNameEditingController = TextEditingController();
  final cvvEditingController = TextEditingController();
  final expirationDateEditingController = TextEditingController();

  List creditCardNumbers = [
    '1234 **** **** 5678',
    '5678 **** **** 1234',
  ];

  bool anotherCreditCard = false;
  bool saveCreditCard = false;
  int creditCardValue = 0;

  void onCreditCardChanged(int value) {
    setState(() {
      creditCardValue = value;
    });
  }

  void onPaymentOptionChanged(int value) {
    setState(() {
      creditCardValue = value;
      savedCardNumberEditingController.text = creditCardNumbers[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      titlePadding: EdgeInsets.zero,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            child: Icon(
              BootstrapIcons.check_circle_fill,
              color: Theme.of(context).primaryColor,
              size: 60,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Congratulations',
              style: TextStyle(
                color: Theme.of(context).highlightColor,
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              'Your transaction is successful',
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ),
          SvgPicture.asset('assets/images/dashed_lines.svg',
              color: Color(0XFFA3A4AB)),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Charging duration',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '2 hours',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '140 TL',
                        style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 8.0),
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
          child: MaterialButton(
            elevation: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
            child: Row(
              children: [
                Container(
                  //margin: const EdgeInsets.only(left: 10.0),
                  child: SvgPicture.asset(
                    'assets/images/box.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Credit Card',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        '1234 **** **** 5678',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(4.0, 28.0, 4.0, 4.0),
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
              highlightColor: const Color.fromARGB(255, 116, 155, 58),
              onPressed: () {
                setState(() {});
              },
              child: const Text(
                'PAY',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0XFFFFFDFA),
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  changeCreditCard() {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: anotherCreditCard
                    ? ((creditCardNumbers.length + 1) * 60) + 440
                    : (creditCardNumbers.length + 1) * 60,
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 22.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16.0),
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
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                left: 15.0),
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
                                              onPaymentOptionChanged(value);
                                              //showPaymentScreen();

                                              /*
                                              showPaymentScreen().then(() {
                                                setState(() {
                                                  creditCardValue = value;
                                                });
                                              });
                                              */
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
                                      onPaymentOptionChanged(index);
                                      //showPaymentScreen();
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
                        ? Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.width * 0.07,
                                    20.0,
                                    MediaQuery.of(context).size.width * 0.07,
                                    8.0),
                                child: Text(
                                  'Card Number',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
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
                                    prefixIcon: const Icon(
                                        BootstrapIcons.credit_card_2_front),
                                    prefixIconColor: const Color(0XFF8ABA41),
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
                                    MediaQuery.of(context).size.width * 0.07,
                                    20.0,
                                    MediaQuery.of(context).size.width * 0.07,
                                    8.0),
                                child: Text(
                                  'Cardholder Name',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
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
                                    prefixIcon: const Icon(
                                      BootstrapIcons.person,
                                      size: 20,
                                    ),
                                    prefixIconColor: const Color(0XFF8ABA41),
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
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                            20.0,
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                            8.0),
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
                                                0.37,
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
                                            prefixIcon: const Icon(
                                              BootstrapIcons.credit_card,
                                              size: 20,
                                            ),
                                            prefixIconColor:
                                                const Color(0XFF8ABA41),
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
                                                0.024,
                                            20.0,
                                            MediaQuery.of(context).size.width *
                                                0.024,
                                            8.0),
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
                                                0.37,
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
                                            prefixIcon: const Icon(
                                              BootstrapIcons.calendar_event,
                                              size: 20,
                                            ),
                                            prefixIconColor:
                                                const Color(0XFF8ABA41),
                                            //suffixIcon: Icon(),
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
                                    MediaQuery.of(context).size.width * 0.07,
                                    20.0,
                                    MediaQuery.of(context).size.width * 0.05,
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
                                      activeColor: const Color(0XFF8ABA41),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.fromLTRB(
                                    4.0, 8.0, 4.0, 40.0),
                                child: Material(
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: const Color(0XFF8ABA41),
                                  child: MaterialButton(
                                    minWidth:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 48,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    splashColor: const Color(0XFF8ABA41),
                                    highlightColor: const Color.fromARGB(
                                        255, 116, 155, 58), //Color(0XFF749B3A)
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                        //showPaymentScreen();
                                      });
                                    },
                                    child: Text(
                                      'Add Card',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container()
                  ],
                ));
          },
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
          bottom: Radius.zero,
        ),
      ),
    );
  }
}
