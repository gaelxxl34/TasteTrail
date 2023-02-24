import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/image_strings.dart';
import '../../../../controllers/user_details_controller.dart';
import '../../../../models/user_model.dart';
import '../my_account.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UserDetailsController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
          title: Text(
            ".Personal Details",
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15.0),
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
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            height: 310,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    title: Text("Firstname: " , style: TextStyle(fontSize: 18, ),),
                                    subtitle: Text(userData.firstname),
                                  ),
                                  ListTile(
                                    title: Text("Lastname: " , style: TextStyle(fontSize: 18)),
                                    subtitle: Text(userData.lastname),
                                  ),
                                  ListTile(
                                    title: Text("Phone Number: " , style: TextStyle(fontSize: 18)),
                                    subtitle: Text(userData.Phone),
                                    ),
                                  ListTile(
                                    title: Text("Uid: " , style: TextStyle(fontSize: 18)),
                                    subtitle: Text(userData.uid),
                                  ),




                                ],
                              ),
                            ),

                          )

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
