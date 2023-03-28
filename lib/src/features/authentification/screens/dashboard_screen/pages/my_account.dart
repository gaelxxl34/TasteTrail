import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/pages/my_account_pages/about_page.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/pages/my_account_pages/user_info.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/pages/pages_widget/menu.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../repository/authentification_repository/authentification_repository.dart';
import '../../../controllers/signup_controller.dart';
import '../../../controllers/user_details_controller.dart';
import '../../../models/user_model.dart';
import 'my_account_pages/help.dart';
import 'my_account_pages/send_feedback.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UserDetailsController());

    return Scaffold(
        appBar: AppBar(
          title: Text(
            ".My Account",
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
              padding: EdgeInsets.all(2.0),
              // child: Center(child: Text('sign in as ' + phone.phoneNumber!)),
              child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
              return Column(
                children: [
                  // -- Header section
                  Container(
                    width: 120,
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: tAccentColor.withOpacity(0.1),
                    ),
                    child: SizedBox(

                      child: ClipRRect(

                          child: Icon(LineAwesomeIcons.user_check, size: 60,)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    userData.firstname + ' ' + userData.lastname,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    userData.Phone,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          foregroundColor: tWhiteColor,
                          backgroundColor: tRed,
                        ),
                        onPressed: () {
                          Get.to(()=> UserInformation());
                        },
                        child: Text(tEditProfile),
                      )),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  // -- Menu section
                  MenuList()

                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(child: Text('Something went wrong'));
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      },
    )),
        )

    );
  }
}
