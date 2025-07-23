import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_application/ui/pages/Home/AddMoneyPage/card-selectWidget.dart';
import 'package:transaction_application/ui/pages/Home/AddMoneyPage/listofData.dart';
import 'package:transaction_application/ui/theme/color/color.dart';
import 'package:transaction_application/ui/theme/textStyle.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.White,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.Black.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_outlined),
                        onPressed: () {
                          Get.back();
                        },
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    SizedBox(width: 90),
                    Text("Add money", style: AppTextStyle.bold(22)),
                  ],
                ),
                SizedBox(height: 20),
                Text("Select Card", style: AppTextStyle.bold(22)),
                SizedBox(height: 20),
                CardSelector(),
                SizedBox(height: 20),
                Text("Add money to Neobank", style: AppTextStyle.bold(22)),
                SizedBox(height: 20),
                Column(
                  children: List.generate(tileItems.length, (index) {
                    final item = tileItems[index];
                    return Container(
                      height: 70,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColor.Black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: ListTile(
                          shape: BeveledRectangleBorder(),
                          leading: Icon(item['icon'], color: Colors.black),
                          title: Text(item['text']),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            // Handle tap if needed
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
