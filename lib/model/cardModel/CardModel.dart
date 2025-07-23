import 'package:flutter/material.dart';

class CardModel {
  final String title;
  final String cardType;
  final String cardNumber;
  final String logoPath;
  final Color backgroundColor;

  CardModel({
    required this.title,
    required this.cardType,
    required this.cardNumber,
    required this.logoPath,
    required this.backgroundColor,
  });
}
