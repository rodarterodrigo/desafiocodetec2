import 'package:flutter/material.dart';
class UserDetailRow extends StatelessWidget {
  final String field;
  final String value;

  UserDetailRow({this.field, this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          field,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor
            ),
          ),
        ),
      ],
    );
  }
}
