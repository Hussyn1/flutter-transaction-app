import 'package:flutter/material.dart';
import 'package:transaction_application/ui/pages/Setting/list-generate-text.dart';
import 'package:transaction_application/ui/theme/color/color.dart';
import 'package:transaction_application/ui/theme/textStyle.dart';

class SettingPage extends StatefulWidget {
  
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkMode = false;

  bool isAllowed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Settings", style: AppTextStyle.bold(22)),
                SizedBox(height: 15),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColor.Black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      shape: BeveledRectangleBorder(),
                      leading: Icon(
                        Icons.lock_open_outlined,
                        color: Colors.black,
                        size: 28,
                      ),
                      title: Text("Allow Transaction"),
                      subtitle: Text(
                        isAllowed
                            ? "Transactions are allowed"
                            : "Transactions are disabled",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: Switch(
                        value: isAllowed,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            isAllowed = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: AppColor.Black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      shape: BeveledRectangleBorder(),
                      leading: Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: Colors.black,
                        size: 28,
                      ),
                      title: Text("Dark Mode"),
                      subtitle: Text(
                        isDarkMode
                            ? "Dark mode is enabled"
                            : "Light mode is enabled",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: Switch(
                        value: isDarkMode,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            isDarkMode = value;
                          });

                          /// Optional: Apply real theme changes if needed
                          /// e.g. using Provider, GetX, Bloc, or set manually
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Column(
                  children: List.generate(settingItems.length, (index) {
                    final item = settingItems[index];
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
                          leading: Icon(
                            item['icon'],
                            color: Colors.black,
                            size: 28,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item['text']),
                              if (item['subtile'] != null &&
                                  item['subtile'].toString().isNotEmpty)
                                Text(
                                  item['subtile'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                            ],
                          ),

                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
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
