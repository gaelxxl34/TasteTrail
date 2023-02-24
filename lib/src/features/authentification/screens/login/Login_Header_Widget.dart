

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(tryi),
          height: size.height * 0.2,
        ),
        Text(
          loginTitle,
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          loginSubtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}