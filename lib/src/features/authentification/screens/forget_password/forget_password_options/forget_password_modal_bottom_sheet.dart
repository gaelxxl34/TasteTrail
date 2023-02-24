import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../forget_password_mail/forget_password_mail.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FpasswordTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              FpasswordSubtitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: 25.0),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgetPasswordMailScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.email_rounded,
                      size: 60,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tEmail,
                          style:
                          Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          ResetViaEmail,
                          style:
                          Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: (){
                //Navigator.pop(context);
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgetPasswordMailScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.mobile_friendly_rounded,
                      size: 60,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          PhoneNo,
                          style:
                          Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          ResetViaPhone,
                          style:
                          Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}