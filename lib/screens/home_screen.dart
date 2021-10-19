import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:it_support/screens/components/body.dart';
import 'package:it_support/screens/components/dropdown_button.dart';
import 'package:it_support/screens/components/dropdown_button_type.dart';
import 'package:it_support/screens/components/rounded_input_field.dart';
import 'package:it_support/screens/it_support_list_screen.dart';

import 'dart:ui';

import 'components/load_image.dart';

class HomeScreenCustomer extends StatefulWidget {
  const HomeScreenCustomer({Key? key}) : super(key: key);

  @override
  _HomeScreenCustomerState createState() => new _HomeScreenCustomerState();
}

class _HomeScreenCustomerState extends State<HomeScreenCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ITSupport"),
        ),
        body: Body());
  }
}
