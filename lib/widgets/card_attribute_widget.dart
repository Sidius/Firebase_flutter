import 'package:flutter/material.dart';

class CardAttribute extends StatelessWidget {
  final String attrName;
  final String? attrValue;

  const CardAttribute({
    Key? key,
    required this.attrName,
    required this.attrValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (attrValue != null) {
      if (attrValue!.isNotEmpty) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Text('$attrName: $attrValue',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        );
      }
    }

    return SizedBox();
  }
}
