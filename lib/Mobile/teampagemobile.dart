import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tribus/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/team_background.jpg'),
        ),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          'TEAM',
          textScaleFactor: 1.5,
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: kBlueColor,
              fontWeight: FontWeight.bold),
        ),
        // all member cards go here
        buildMemberMobile(context,
            name: kName1,
            title: kTitle1,
            dpUrl: kDpUrl1,
            email: kEmail1,
            instaUrl: kInstaUrl1,
            linkedinUrl: kLinkedInUrl1),
        buildMemberMobile(context,
            name: kName2,
            title: kTitle2,
            dpUrl: kDpUrl2,
            email: kEmail2,
            instaUrl: kInstaUrl2,
            linkedinUrl: kLinkedInUrl2),
        buildMemberMobile(context,
            name: kName3,
            title: kTitle3,
            dpUrl: kDpUrl3,
            email: kEmail3,
            instaUrl: kInstaUrl3,
            linkedinUrl: kLinkedInUrl3),
        buildMemberMobile(context,
            name: kName4,
            title: kTitle4,
            dpUrl: kDpUrl4,
            email: kEmail4,
            instaUrl: kInstaUrl4,
            linkedinUrl: kLinkedInUrl4),
      ]),
    );
  }

  // method for sending email via gmail app
  sendMail(String email, BuildContext context) async {
    String url = 'mailto:$email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Unable to send mail')));
    }
  }

  Container buildMemberMobile(BuildContext context,
      {String name,
      String title,
      String dpUrl,
      String email,
      String instaUrl,
      String linkedinUrl}) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(8, 8), blurRadius: 8)
          ],
        ),
        child: ListTile(
          tileColor: Color(0xFFECECEC),
          dense: true,
          isThreeLine: true,
          title: Text(
            name,
            textScaleFactor: 1.4,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: kBlueColor.withOpacity(0.8)),
              ),
              ButtonBar(
                  buttonPadding: EdgeInsets.all(0),
                  alignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.mail),
                        onPressed: () async => sendMail(email, context)),
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.instagramSquare),
                        onPressed: () async {
                          if (await canLaunch(instaUrl)) {
                            await launch(instaUrl);
                          } else {
                            throw 'Cannot launch';
                          }
                        }),
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedin),
                        onPressed: () async {
                          if (await canLaunch(linkedinUrl)) {
                            await launch(linkedinUrl);
                          } else {
                            throw 'Cannot launch';
                          }
                        })
                  ])
            ],
          ),
          trailing: ClipOval(
            child: Image.asset(dpUrl),
          ),
        ),
      ),
    );
  }
}
