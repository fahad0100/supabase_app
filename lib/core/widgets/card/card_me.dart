import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_app/core/extensions/font_extensions.dart';

class CardMe extends StatelessWidget {
  const CardMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        Card(
          child: ListTile(
            title: Row(
              mainAxisAlignment: .spaceBetween,
              children: [Text("Fahad ALazmi"), Text("Flutter")],
            ),
            subtitle: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "Here is some words Here is some words Here is some words",
                ),
                Align(
                  alignment: .centerRight,
                  child: Text(
                    "Create at",
                    style: TextStyle(fontSize: 10.font(min: 10, max: 12)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: -10,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(shape: .circle, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
