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
            image: NetworkImage(
                'https://image.freepik.com/free-vector/watercolor-background_87374-69.jpg'),
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
          url:
              'https://image.freepik.com/free-vector/businessman-top-mountain_1133-275.jpg',
          title: 'Our Mission',
          desc:
              'We work hard everyday to develop high quality software solutions for our clients\' enterprises and businesses.',
        ),
        AboutCard(
          left: true,
          url:
              'https://image.freepik.com/free-vector/manager-prioritizing-tasks-list_74855-5272.jpg',
          title: 'Our Plan',
          desc:
              'To be focused towards the goal i.e. excellence and most importantly customer satisfaction.',
        ),
        AboutCard(
          left: false,
          url:
              'https://image.freepik.com/free-vector/businessman-flying-rocket-business-concept_107791-76.jpg?',
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
              image: NetworkImage(
                  'https://image.freepik.com/free-vector/shiny-white-gray-background-with-wavy-lines_1017-25101.jpg'))),
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
          image: NetworkImage(url),
        ),
      ),
    );
  }
}
