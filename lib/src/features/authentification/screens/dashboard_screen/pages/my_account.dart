import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rolex_stands_finding/src/features/authentification/screens/dashboard_screen/pages/my_account_pages/user_info.dart';

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
                  const SizedBox(
                    height: 5,
                  ),
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
                          backgroundColor: tDarkColor,
                        ),
                        onPressed: () {},
                        child: Text(tEditProfile),
                      )),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),

                  // -- Menu
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

/*
* FutureBuilder<List<UserModel>>(
              future: controller.getAllUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "Welcome ${user.displayName!}" , style: TextStyle(fontWeight: FontWeight.bold
                                  //
                                ),),
                                //subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(snapshot.data![index].Phone),],),
                              )
                            ],
                          );
                        });
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
            ))
            *
            *
            *
            *
            *
            *
            * ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (c, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Welcome" , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red
                          //
                        ),),
                        //subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(snapshot.data![index].Phone),],),
                      )
                    ],
                  );
                });
* */