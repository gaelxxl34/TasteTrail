 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../repository/authentification_repository/authentification_repository.dart';
import '../../controllers/signup_controller.dart';
import '../../models/user_model.dart';
import '../login/login-form.dart';



class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());

    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.firstname,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'First name',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: Colors.black), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: tRed), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller.lastname,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.man),
                  hintText: 'Last name',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: Colors.black), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(width: 2, color: tRed), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(50.0),
                  )
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
              controller: controller.phoneN,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: '+256',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 2, color: Colors.black), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 2, color: tRed), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                )
              ),
            ),

            const SizedBox(height: 50),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      foregroundColor: tWhiteColor,
                      backgroundColor: tRed,
                      padding: EdgeInsets.symmetric(vertical: 18)
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_formKey.currentState!.validate()) {
                        final users = UserModel(
                          firstname: controller.firstname.text.trim(),
                          lastname: controller.lastname.text.trim(),
                          Phone: controller.phoneN.text.trim(),
                        );
                        SignUpController.instance.createUser(users);
                      }

                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  },
                  child: Text('Get OTP'),
                )),
          ],
        ),
      ),
    );
  }
}