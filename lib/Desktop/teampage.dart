import 'package:flutter/material.dart';
import 'package:tribus/Widgets/hoverprofile.dart';
import 'package:tribus/Widgets/title.dart';
import 'package:tribus/constants.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/team_background.jpg'),
        ),
      ),
      child: Center(
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          TitleString('TEAM'),
          SizedBox(height: 50),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            HoverProfile(
              dpUrl: kDpUrl1,
              title: kTitle1,
              name: kName1,
              email: kEmail1,
              instaUrl: kInstaUrl1,
              linkedInUrl: kLinkedInUrl1,
            ),
            HoverProfile(
              title: kTitle2,
              name: kName2,
              dpUrl: kDpUrl2,
              instaUrl: kInstaUrl2,
              linkedInUrl: kLinkedInUrl2,
              email: kEmail2,
            ),
            HoverProfile(
              title: kTitle3,
              name: kName3,
              dpUrl: kDpUrl3,
              instaUrl: kInstaUrl3,
              linkedInUrl: kLinkedInUrl3,
              email: kEmail3,
            ),
            HoverProfile(
                title: kTitle4,
                name: kName4,
                dpUrl: kDpUrl4,
                instaUrl: kInstaUrl4,
                linkedInUrl: kLinkedInUrl4,
                email: kEmail4)
          ]),
        ]),
      ),
    );
  }
}
