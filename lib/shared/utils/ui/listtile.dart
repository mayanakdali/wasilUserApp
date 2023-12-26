import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/custom_package.dart';
import '../../constant/colors.dart';
import '../../services/AppLocalizations.dart';

class ListTileWidget extends StatefulWidget {
  ListTileWidget(
      {super.key, required this.icon, required this.title, this.press});
  IconData icon;
  String title;
  Function? press;
  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(widget.icon, color: AppColors.primaryColor),
          onTap: () {},
          title: Text(
            Translator.translate(widget.title),
          ),
          trailing:
              const Icon(Icons.chevron_right, color: AppColors.primaryColor),
        ),
        const Divider(
          color: AppColors.borderColor,
        ),
      ],
    );
  }
}
