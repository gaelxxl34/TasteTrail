import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SendFeedback extends StatelessWidget {
  const SendFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse("https://youtube.com");
    final String _phoneNumber = "+256726455053";

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text(
            ".Feedback",
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(19.0),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 310,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    IconButton(icon: Icon(LineAwesomeIcons.facebook_messenger), iconSize: 160, onPressed: () async{
                      final Uri _text = Uri.parse('sms:$_phoneNumber');
                      if (!await launchUrl(_text)) {
                      throw Exception('Could not launch $_text');
                      }
                    },),
                    Text("Click to send sms")
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
