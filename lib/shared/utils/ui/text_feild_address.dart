import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/custom_package.dart';

class TextFormFieldAddress extends StatelessWidget {

  final String hintText;
  final IconData prefixIconData;


  bool readOnly;
  final TextInputType ?keyBoard;
  final TextEditingController controller;

  final Function()? press;
  final String? Function(String?)? validator;
  final TextInputFormatter? inputFormatter;

  TextFormFieldAddress(
      {
        Key? key,
        required this.hintText,
        required this.controller,
         this.keyBoard,
        required this.prefixIconData,

        //Icons.visibility_off,

        this.press,

        this.readOnly = false,
        this.validator,
        this.inputFormatter})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    OutlineInputBorder? allTFBorder;
    TextStyle? allTFStyle;
    allTFBorder = const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        borderSide: BorderSide.none);



    return   Column(
      children: [
        TextFormField(
keyboardType: keyBoard??TextInputType.text,
          validator: validator,
          style: allTFStyle,
          decoration: InputDecoration(


            hintText:
           hintText,
            border: allTFBorder,
            enabledBorder: allTFBorder,
            focusedBorder: allTFBorder,
            prefixIcon:  Icon(
              // MdiIcons.mapMarkerPlusOutline,
              prefixIconData,
              size: 24,
            ),
          ),
          textCapitalization:
          TextCapitalization.sentences,
          controller: controller,
        ), const Divider(
          height: 0,
        ),
      ],
    );
}}
