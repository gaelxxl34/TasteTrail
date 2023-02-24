import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../forget_password_mail/forget_password_mail.dart';


class FormPasswordBtnWidget extends StatelessWidget {
  FormPasswordBtnWidget({
    Key? key,
    required this.Iconbtn,
    required this.title,
    required this.suBtitle,
    required this.onTap,
  }) : super(key: key);

  final IconData Iconbtn;
  final String title, suBtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(
              Iconbtn,
              size: 60,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  Theme.of(context).textTheme.headline5,
                ),
                Text(
                  suBtitle,
                  style:
                  Theme.of(context).textTheme.bodyText2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}