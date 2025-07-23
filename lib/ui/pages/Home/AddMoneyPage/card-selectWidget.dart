import 'package:flutter/material.dart';
import 'package:transaction_application/model/cardModel/cardDummyData.dart';

class CardSelector extends StatefulWidget {
  @override
  _CardSelectorState createState() => _CardSelectorState();
}

class _CardSelectorState extends State<CardSelector> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: fakeCards.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          final card = fakeCards[index];
          final isSelected = index == selectedCardIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCardIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              padding: isSelected ? EdgeInsets.all(4) : EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border:
                    isSelected
                        ? Border.all(color: Colors.black, width: 3)
                        : null,
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                  color: card.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Radio or Dot Indicator
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? Colors.black : Colors.white,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                        ),
                        const Spacer(),
                        Image.asset(card.logoPath, width: 40),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.cardType,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              card.cardNumber,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
