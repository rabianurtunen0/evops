import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCreditCard extends StatefulWidget {
  const AddCreditCard({Key? key}) : super(key: key);

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
  final cardNumberEditingController = TextEditingController();
  final cardholderNameEditingController = TextEditingController();
  final cvvEditingController = TextEditingController();
  final expirationDateEditingController = TextEditingController();
  bool isCvvFocused = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).highlightColor,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CreditCardWidget(
                  cardNumber: cardNumberEditingController.text,
                  expiryDate: expirationDateEditingController.text,
                  cardHolderName: cardholderNameEditingController.text,
                  cvvCode: cvvEditingController.text,
                  showBackView: isCvvFocused,
                  isHolderNameVisible: true,
                  onCreditCardWidgetChange: (CreditCardBrand) {},
                  isChipVisible: true,
                  obscureCardCvv: false,
                  obscureCardNumber: false,
                  obscureInitialCardNumber: false,
                  cardBgColor: Theme.of(context).backgroundColor ==
                          const Color(0XFF282A37)
                      ? const Color.fromARGB(255, 64, 64, 77)
                      : const Color(0XFF2A2B2E),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
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
                    'Card Number',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
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
                        cardNumberEditingController.text = newValue;

                        cardNumberEditingController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset:
                                    cardNumberEditingController.text.length));
                      });
                    },
                    onTap: () {
                      setState(() {
                        //isCvvFocused = false;
                      });
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

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'XXXX XXXX XXXX XXXX',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0XFF595550),
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      prefixIcon:
                          const Icon(BootstrapIcons.credit_card_2_front),
                      prefixIconColor: const Color(0XFF8ABA41),
                      //suffixIcon: Icon(),
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0XFFFFFFFF)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0XFFFFFFFF)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
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
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
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
                        cardholderNameEditingController.text = value;
                        cardholderNameEditingController.selection =
                            TextSelection.fromPosition(TextPosition(
                          offset: cardholderNameEditingController.text.length,
                        ));
                      });
                    },
                    onTap: () {
                      setState(() {});
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Cardholder Name',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0XFF595550),
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      prefixIcon: const Icon(BootstrapIcons.person),
                      prefixIconColor: const Color(0XFF8ABA41),
                      //suffixIcon: Icon(),
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0XFFFFFFFF)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0XFFFFFFFF)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.025,
                              20.0,
                              MediaQuery.of(context).size.width * 0.025,
                              8.0),
                          child: Text(
                            'CVV',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: TextFormField(
                            autofocus: false,
                            controller: cvvEditingController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
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
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            cvvEditingController.text.length));
                              });
                            },
                            onTap: () {
                              setState(() {});
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'CVV',
                              hintStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0XFF595550),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              prefixIcon: Icon(
                                BootstrapIcons.credit_card,
                                size: 22,
                              ),

                              prefixIconColor: const Color(0XFF8ABA41),
                              //suffixIcon: Icon(),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 10.0, 0.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0XFFFFFFFF)),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0XFFFFFFFF)),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.024,
                              20.0,
                              MediaQuery.of(context).size.width * 0.024,
                              8.0),
                          child: Text(
                            'Expiration Date',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: TextFormField(
                            autofocus: false,
                            controller: expirationDateEditingController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
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
                                expirationDateEditingController.text = value;
                                expirationDateEditingController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: expirationDateEditingController
                                            .text.length));
                              });
                            },
                            onTap: () {
                              setState(() {
                                expirationDateEditingController.text;
                              });
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

                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'MM/YY',
                              hintStyle: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0XFF595550),
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              prefixIcon: const Icon(
                                BootstrapIcons.calendar_event,
                                size: 22,
                              ),
                              prefixIconColor: const Color(0XFF8ABA41),
                              //suffixIcon: Icon(),
                              contentPadding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 10.0, 0.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0XFFFFFFFF)),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0XFFFFFFFF)),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 40.0),
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
                      Get.back();
                    });
                  },
                  child: const Text(
                    'Add Card',
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
