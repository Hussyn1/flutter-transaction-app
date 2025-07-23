import 'package:flutter/material.dart';
import 'package:transaction_application/model/cardModel/cardDummyData.dart';
import 'package:transaction_application/model/transactionmodel/transactionDummyData.dart';
import 'package:transaction_application/ui/pages/Home/TransactionTile.dart';
import 'package:transaction_application/ui/pages/Home/balanceContainer.dart';
import 'package:transaction_application/ui/theme/color/color.dart';
import 'package:transaction_application/ui/theme/textStyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topBar(context),
                const SizedBox(height: 20),
                balanceContainer(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "Your cards",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(Icons.add),
                        Text(
                          "New card",
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _yourCards(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Transactions", style: AppTextStyle.bold(20)),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text("See all", style: AppTextStyle.bold(17)),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  shrinkWrap: true,

                  itemBuilder: (context, index) {
                    final transactioncard = transactions[index];

                    return TransactionTile(
                      logoAssetPath: transactioncard.logoAssetPath,
                      name: transactioncard.name,
                      time: transactioncard.time,
                      amountPaid: transactioncard.amountPaid,
                      amountSaved: transactioncard.amountSaved,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _yourCards() {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: fakeCards.length,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final card = fakeCards[index];
        return Container(
          margin: EdgeInsets.only(right: 10),
          width: 340,
          height: 200,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: card.backgroundColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text("N.", style: AppTextStyle.bold(26)),
                  Spacer(),
                  Image.asset(card.logoPath, width: 50),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        card.cardType,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        card.cardNumber,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      color: AppColor.White,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.visibility_outlined),
                        Text(
                          "Details",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning, Hussain",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "Welcome to NeoBank",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      const Spacer(),
      Container(
        decoration: BoxDecoration(
          color: AppColor.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColor.Black.withOpacity(0.2), width: 1),
        ),
        child: IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Handle notification button press
          },
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    ],
  );
}
