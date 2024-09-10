import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:thimar/core/logic/cache_helper.dart';
class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key,  required this.autovalidateMode});

  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = CachHelper.userName!, cvvCode = '';

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (value) {},
        ),
        // CreditCardForm(
        //     isHolderNameVisible: true,
        //     autovalidateMode: widget.autovalidateMode,
        //     cardNumber: cardNumber,
        //     expiryDate: expiryDate,
        //     cardHolderName: cardHolderName,
        //     cvvCode: cvvCode,
        //     onCreditCardModelChange: (carditCardModel) {
        //       cardHolderName = carditCardModel.cardHolderName;
        //       expiryDate = carditCardModel.expiryDate;
        //       cvvCode = carditCardModel.cvvCode;
        //       cardNumber = carditCardModel.cardNumber;
        //       showBackView = carditCardModel.isCvvFocused;
        //       setState(() {});
        //     },
        //    ),
      ],
    );
  }
}
