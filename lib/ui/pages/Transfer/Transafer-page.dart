import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_application/ui/theme/color/color.dart';
import 'package:transaction_application/ui/theme/textStyle.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  List<Map<String, String>> contacts = [];
  @override
  void initState() {
    super.initState();
    _loadContact(); // ⬅️ Load saved contacts when screen opens
  }

  Future<void> _loadContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? saved = prefs.getString('contacts');
    if (saved != null) {
      List decoded = json.decode(saved);
      contacts = decoded.map((e) => Map<String, String>.from(e)).toList();
      setState(() {});
    }
  }

  Future<void> _saveContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('contacts', json.encode(contacts));
  }

  void _addContact(String name, String initials) {
    setState(() {
      contacts.add({'name': name, 'initials': initials});
    });
    _saveContacts();
  }

  void _removeContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
    _saveContacts();
  }

  void _showAddDialog() {
    String name = '';
    String initials = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.White,
          title: Text('Add Contact'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Name',
                  
                    ),
                    onChanged: (val) {
                      name = val;
                      setState(() {
                        initials =
                            val.isNotEmpty ? val.trim()[0].toUpperCase() : '';
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  if (initials.isNotEmpty)
                    Text(
                      'Initial: $initials',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && initials.isNotEmpty) {
                  _addContact(name, initials);
                }
                Navigator.pop(context);
              },
              child: Text('Add', style: AppTextStyle.bold(15)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAvatar({
    required String label,
    String? name,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: AppColor.Black,
              child: Text(label, style: TextStyle(color: Colors.white)),
            ),
          ),
          if (name != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(name, style: TextStyle(fontSize: 12)),
            ),
          SizedBox(height: 5),
          Text("Add", style: AppTextStyle.bold(15)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: const Text("Transfer Money"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Add Button Avatar
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _buildAvatar(label: '+', onTap: _showAddDialog),
                    ),
                    ...contacts.asMap().entries.map((entry) {
                      final index = entry.key;
                      final contact = entry.value;

                      return GestureDetector(
                        onLongPress: () => _removeContact(index),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor: AppColor.Black,
                                child: Text(
                                  contact['initials'] ?? "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                contact['name'] ?? "",
                                style: AppTextStyle.bold(15),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Receiver Name
              TextField(
                decoration: InputDecoration(
                  hintText: "Receiver Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Account Number
              TextField(
                decoration: InputDecoration(
                  hintText: "Account Number",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // Amount
              TextField(
                decoration: InputDecoration(
                  hintText: "Amount",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixText: "\$ ",
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.Black,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Transfer Initiated')),
                    );
                  },
                  child: Text("Send Money", style: AppTextStyle.semiBold(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
