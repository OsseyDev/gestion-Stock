import 'package:flutter/material.dart';

class RowSection extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final bool spacer;
  const RowSection({
    super.key,
    required this.widget1,
    required this.widget2,
    this.spacer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget1,
        if (spacer) const Spacer(),
        widget2,
      ],
    );
  }
}
