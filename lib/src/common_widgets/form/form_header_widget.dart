import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  FormHeaderWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,

  }) : super(key: key);

  String image, title, subtitle;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.3,
        ),
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
