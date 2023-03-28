import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/text_strings.dart';
import '../../../../../../repository/authentification_repository/authentification_repository.dart';
import '../my_account_pages/about_page.dart';
import '../my_account_pages/help.dart';
import '../my_account_pages/send_feedback.dart';
import '../my_account_pages/user_info.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: (){
            Get.to(() => UserInformation());
          },
          leading: Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: tAccentColor.withOpacity(0.1),
            ),
            child: Icon(LineAwesomeIcons.info, color: tDarkColor,),
          ),
          title: Text(tMenu3, style: Theme.of(context).textTheme.bodyText1,),
          trailing: Container(
            width: 30, height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Icon(LineAwesomeIcons.angle_right,size: 18.0, color: tDarkColor,),
          ),
        ),
        ListTile(
          onTap: (){
            Get.to(() => HelpUser());
          },
          leading: Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: tAccentColor.withOpacity(0.1),
            ),
            child: Icon(Icons.help_outline_rounded, color: tDarkColor,),
          ),
          title: Text(tMenu6, style: Theme.of(context).textTheme.bodyText1,),
          trailing: Container(
            width: 30, height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Icon(LineAwesomeIcons.angle_right,size: 18.0, color: Colors.black,),
          ),
        ),
        ListTile(
          onTap: (){
            Get.to(() => SendFeedback());
          },
          leading: Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: tAccentColor.withOpacity(0.1),
            ),
            child: Icon(Icons.messenger_outline, color: tDarkColor,),
          ),
          title: Text(tMenu7, style: Theme.of(context).textTheme.bodyText1,),
          trailing: Container(
            width: 30, height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Icon(LineAwesomeIcons.angle_right,size: 18.0, color: Colors.black,),
          ),
        ),
        ListTile(
          onTap: (){
            Get.to(() => AboutPage());
          },
          leading: Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: tAccentColor.withOpacity(0.1),
            ),
            child: Icon(Icons.open_in_browser, color: tDarkColor,),
          ),
          title: Text(tMenu8, style: Theme.of(context).textTheme.bodyText1,),
          trailing: Container(
            width: 30, height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Icon(LineAwesomeIcons.angle_right,size: 18.0, color: Colors.black,),
          ),
        ),
        ListTile(
          onTap: (){
            AuthentificationRepository.instance.logout();
          },

          leading: Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: tAccentColor.withOpacity(0.1),
            ),
            child: Icon(LineAwesomeIcons.alternate_sign_out, color: tDarkColor,),
          ),
          title: Text(tMenu1, style: TextStyle(color: Colors.red),),
          trailing: Container(
            width: 30, height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Icon(LineAwesomeIcons.angle_right,size: 18.0, color: tDarkColor,),
          ),
        ),
      ],
    );
  }
}
