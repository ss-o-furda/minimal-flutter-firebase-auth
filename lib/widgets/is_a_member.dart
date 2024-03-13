import 'package:flutter/material.dart';

class IsMember extends StatelessWidget {
  final VoidCallback showAnotherPage;
  final String member;
  final String action;
  const IsMember({
    super.key,
    required this.showAnotherPage,
    required this.member,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          member,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5.0),
        GestureDetector(
          onTap: showAnotherPage,
          child: Text(
            action,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
