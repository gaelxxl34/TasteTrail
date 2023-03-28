import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/signup_controller.dart';




class LoginTheForm extends StatefulWidget {
  const LoginTheForm({Key? key}) : super(key: key);

  @override
  State<LoginTheForm> createState() => _LoginTheFormState();
}

class _LoginTheFormState extends State<LoginTheForm> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());


    final _formKey = GlobalKey<FormState>();
    String UserInput;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              onChanged: (text){
                UserInput = text;
              },
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      foregroundColor: tWhiteColor,
                      backgroundColor: tRed,
                      padding: EdgeInsets.symmetric(vertical: 20)
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SignUpController.instance.phoneAuthentification(controller.phoneN.text.trim());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );

                    }

                  },
                  child: Text('Get OTP'),
                )),
          ],
        ),
      ),
    );
  }
}

