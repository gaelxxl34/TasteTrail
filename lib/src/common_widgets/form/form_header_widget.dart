import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../constants/colors.dart';

class FormHeaderWidget extends StatelessWidget {
  FormHeaderWidget({
    Key? key,

    required this.title,
    required this.subtitle,

  }) : super(key: key);

  String  title, subtitle;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [


        Container(

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(250),
            color: Colors.white
          ),
          child: SizedBox(

            child: ClipRRect(

                child: Icon(Icons.person_rounded, size: size.height * 0.25,)),
          ),
        ),
        SizedBox(height: size.height * 0.05,),

        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
