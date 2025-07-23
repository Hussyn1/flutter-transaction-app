import 'package:flutter/material.dart';
import 'package:transaction_application/ui/pages/Map/openStreetMap.dart';

class Mappage extends StatefulWidget {
  const Mappage({super.key});

  @override
  State<Mappage> createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OpenStreetMapPage());
  }
}
