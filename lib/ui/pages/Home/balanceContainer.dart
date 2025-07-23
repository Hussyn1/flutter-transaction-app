import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_application/ui/pages/Home/AddMoneyPage/AddMOney.dart';
import 'package:transaction_application/ui/theme/color/color.dart';
import 'package:transaction_application/ui/theme/textStyle.dart';

class balanceContainer extends StatefulWidget {
  const balanceContainer({super.key});

  @override
  State<balanceContainer> createState() => _balanceContainerState();
}

class _balanceContainerState extends State<balanceContainer> {
  bool _isHidden = false;
  // ignore: unused_element
  Future<void> _loadHiddenState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isHidden = prefs.getBool('isHidden') ?? false;
    setState(() {});
  }

  Future<void> _toggleHidden() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isHidden = !_isHidden;
    });
    await prefs.setBool('isHidden', _isHidden);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.White,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColor.Black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your balance",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            children: [
              Text(
                _isHidden ? "******" : "\$12,345.67",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  _isHidden
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: _toggleHidden,
                color: Theme.of(context).iconTheme.color,
              ),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.Black,
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
            ),
            onPressed: () {
              Get.to(AddMoney());
            },
            child: Text("Add money", style: AppTextStyle.semiBold(20)),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
