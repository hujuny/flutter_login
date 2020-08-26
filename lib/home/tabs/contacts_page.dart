import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  ContactsPageState createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('联系人'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('联系人页面'),
      ),
    );
  }
}
