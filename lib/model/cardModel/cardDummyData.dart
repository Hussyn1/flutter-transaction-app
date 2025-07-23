import 'package:flutter/material.dart';
import 'package:transaction_application/model/cardModel/CardModel.dart';
import 'package:transaction_application/ui/theme/color/color.dart';

final List<CardModel> fakeCards = [
  CardModel(
    title: "N.",
    cardType: "Debit Card",
    cardNumber: "**** 1234",
    logoPath: "assets/images/mastercard-logo.png",
    backgroundColor: AppColor.CardGreen,
  ),
  CardModel(
    title: "N.",
    cardType: "Credit Card",
    cardNumber: "**** 5678",
    logoPath: "assets/images/visa-logo.png",
    backgroundColor: AppColor.Black.withOpacity(0.2),
  ),
  CardModel(
    title: "N.",
    cardType: "Business Card",
    cardNumber: "**** 9876",
    logoPath: "assets/images/amex-logo.png",
    backgroundColor: Colors.blue.withOpacity(0.6),
  ),
];
