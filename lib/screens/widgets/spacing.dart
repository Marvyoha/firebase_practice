import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final bool isWidth;
  const Space({this.isWidth = false, super.key});

  @override
  Widget build(BuildContext context) {
    return isWidth ? const SizedBox(width: 5) : const SizedBox(height: 20);
  }
}
