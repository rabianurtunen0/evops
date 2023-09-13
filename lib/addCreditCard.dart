import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get_storage/get_storage.dart';

class AddCreditCard extends StatefulWidget {
  const AddCreditCard({Key? key}) : super(key: key);

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
  final getStorage = GetStorage();
  late final cardNumberEditingController =
      TextEditingController(text: getStorage.read("cardNumber").toString());
  late final cardholderNameEditingController =
      TextEditingController(text: getStorage.read("cardholderName").toString());
  late final cvvEditingController =
      TextEditingController(text: getStorage.read("cvv").toString());
  late final expirationDateEditingController =
      TextEditingController(text: getStorage.read("expirationDate").toString());
  bool isCvvFocused = false;
  bool isLoading = false;

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
                Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      MediaQuery.of(context).size.height * 0.012,
                      MediaQuery.of(context).size.width * 0.02,
                      MediaQuery.of(context).size.height * 0.016),
                  child: CreditCardWidget(
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
                    cardBgColor: const Color(0XFF3E404E),
                    backCardBorder: Border.all(
                      width: 2,
                      color: const Color(0XFF3E404E),
                    ),
                    frontCardBorder:
                        Border.all(width: 2, color: const Color(0XFF3E404E)),
                    textStyle: TextStyle(
                      color: const Color(0XFFA1A3B4),
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(13),
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
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
                        cardNumberEditingController.text = newValue;

                        cardNumberEditingController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset:
                                    cardNumberEditingController.text.length));
                      });
                    },
                    onTap: () {
                      setState(() {
                        isCvvFocused = false;
                      });
                    },
                    cursorColor: Theme.of(context).highlightColor,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'XXXX XXXX XXXX XXXX',
                      hintStyle: Theme.of(context).textTheme.displaySmall,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      prefixIcon: Icon(BootstrapIcons.credit_card_2_front,
                          size: ScreenUtil().setSp(16)),
                      prefixIconColor: Theme.of(context).primaryColor,
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
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
                        cardholderNameEditingController.text = value;
                        cardholderNameEditingController.selection =
                            TextSelection.fromPosition(TextPosition(
                          offset: cardholderNameEditingController.text.length,
                        ));
                      });
                    },
                    onTap: () {
                      setState(() {
                        isCvvFocused = false;
                      });
                    },
                    cursorColor: Theme.of(context).highlightColor,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    style: Theme.of(context).textTheme.titleSmall,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Cardholder Name',
                      hintStyle: Theme.of(context).textTheme.displaySmall,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      prefixIcon: Icon(
                        BootstrapIcons.person,
                        size: ScreenUtil().setSp(17),
                      ),
                      prefixIconColor: Theme.of(context).primaryColor,
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.022,
                                MediaQuery.of(context).size.height * 0.028,
                                0.0,
                                MediaQuery.of(context).size.height * 0.008),
                            child: Text(
                              'CVV',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.052,
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
                                setState(() {
                                  isCvvFocused = true;
                                });
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
                                hintText: 'CVV',
                                hintStyle:
                                    Theme.of(context).textTheme.displaySmall,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                                prefixIcon: Icon(
                                  BootstrapIcons.credit_card,
                                  size: ScreenUtil().setSp(16),
                                ),
                                prefixIconColor: Theme.of(context).primaryColor,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 8.0, 10.0, 10.0),
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
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.022,
                                MediaQuery.of(context).size.height * 0.028,
                                MediaQuery.of(context).size.width * 0.022,
                                MediaQuery.of(context).size.height * 0.008),
                            child: Text(
                              'Expiration Date',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.052,
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
                                  isCvvFocused = false;
                                });
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
                                hintText: 'MM/YY',
                                hintStyle:
                                    Theme.of(context).textTheme.displaySmall,
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                                prefixIcon: Icon(BootstrapIcons.calendar_event,
                                    size: ScreenUtil().setSp(16)),
                                prefixIconColor: Theme.of(context).primaryColor,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 8.0, 10.0, 10.0),
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
                        ],
                      ),
                    ],
                  ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              height: MediaQuery.of(context).size.height * 0.052,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.007,
                MediaQuery.of(context).size.height * 0.016,
                MediaQuery.of(context).size.width * 0.007,
                MediaQuery.of(context).size.height * 0.032,
              ),
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0XFF8ABA41),
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
                      isLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        isLoading = false;
                        Get.back();
                      });
                    });
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Color(0XFFFFFDFA),
                          strokeWidth: 2.0,
                        )
                      : Text(
                          getStorage.read('changeCreditCard') == 'true'
                              ? 'Change Card'
                              : 'Add Card',
                          style: Theme.of(context).textTheme.labelMedium,
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
