
import 'package:flutter/material.dart';

class DropdownButtonFormFieldDemo extends StatefulWidget {
  @override
  _DropdownButtonFormFieldDemoState createState() => _DropdownButtonFormFieldDemoState();
}

class _DropdownButtonFormFieldDemoState extends State<DropdownButtonFormFieldDemo> {

  var _value='语文';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: _value,
      items: [
        DropdownMenuItem(
          child: Text('语文'),
          value: '语文',
        ),
        DropdownMenuItem(
          child: Text('数学'),
          value: '数学',
        ),
        DropdownMenuItem(
          child: Text('英语'),
          value: '英语',
        )
      ],
      onChanged: (value){
        setState(() {
          _value=value;
        });
      },
    );
  }
}
