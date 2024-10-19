import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defaultPadding/2,),
        AreaInfoText(title: 'Contact', text: '+229 69931636 / +229 40351212'),
        AreaInfoText(title: 'Email', text: 'gnacsentreprise@gmail.com'),
        AreaInfoText(title: 'LinkedIn', text: '@serge-gnacadja'),
        AreaInfoText(title: 'Github', text: '@Gnac05'),
        SizedBox(
          height: defaultPadding,
        ),
        Text('Skills',style: TextStyle(color: Colors.white),),
        SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }
}
