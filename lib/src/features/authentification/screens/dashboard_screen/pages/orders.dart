import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../repository/authentification_repository/authentification_repository.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          ".Orders",
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
              onPressed: () {
                AuthentificationRepository.instance.logout();
              },
              icon: Image(
                image: AssetImage(tryi),
              ),
            ),
          ),
        ],
      ),
      //AuthentificationRepository.instance.logout();
    );
  }
}
