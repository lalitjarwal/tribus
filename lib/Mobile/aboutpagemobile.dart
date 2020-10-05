import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class AboutPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return Container(
      padding: EdgeInsets.only(
        top: padding.top,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/aboutusbackground.jpg'),
            fit: BoxFit.fill),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          'About Us',
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: kBlueColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        AboutCard(
          left: false,
          url: 'images/ourmission.jpg',
          title: 'Our Mission',
          desc:
              'We work hard everyday to develop high quality software solutions for our clients\' enterprises and businesses.',
        ),
        AboutCard(
          left: true,
          url: 'images/ourplan.jpg',
          title: 'Our Plan',
          desc:
              'To be focused towards the goal i.e. excellence and most importantly customer satisfaction.',
        ),
        AboutCard(
          left: false,
          url: 'images/ourvision.jpg',
          title: 'Our Vision',
          desc:
              'Our vision is to become the leader in delivering quality services to our clients while maintaining teamwork and commitment.',
        ),
      ]),
    );
  }
}

class AboutCard extends StatelessWidget {
  final bool left;
  final String url;
  final String title;
  final String desc;
  const AboutCard({Key key, this.url, this.title, this.desc, this.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
        boxShadow: [
          BoxShadow(offset: Offset(8, 8), color: Colors.grey, blurRadius: 8)
        ],
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/aboutsecondary.jpg'),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 4.5,
      child: Row(children: [
        left
            ? Flexible(flex: 1, child: buildImage(left))
            : Flexible(flex: 2, child: buildColumn()),
        left
            ? Flexible(flex: 2, child: buildColumn())
            : Flexible(flex: 1, child: buildImage(left))
      ]),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kBlueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            desc,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: kBlackColor,
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }

  Container buildImage(bool left) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: left
            ? BorderRadius.only(topLeft: Radius.circular(14))
            : BorderRadius.only(bottomRight: Radius.circular(14)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(url),
        ),
      ),
    );
  }
}
