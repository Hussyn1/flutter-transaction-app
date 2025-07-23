import 'package:flutter/material.dart';
import 'package:transaction_application/ui/pages/Profile/PersonalInfoCard.dart';
import 'package:transaction_application/ui/theme/color/color.dart';
import 'package:transaction_application/ui/theme/textStyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text("Profile", style: AppTextStyle.bold(22)),

                const SizedBox(height: 30),

                // Avatar with Edit Button
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.White,
                          border: Border.all(color: AppColor.White),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/boy.png",
                            fit: BoxFit.cover,
                            height: 140,
                            width: 140,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: 12,
                        child: Container(
                          height: 45,
                          width: 45,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.White,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(Icons.edit, size: 22),
                        ),
                      ),
                    ],
                  ),
                ),

                PersonalInfoCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
