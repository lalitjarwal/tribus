import 'package:flutter/material.dart';
import 'package:tribus/Widgets/title.dart';
import 'package:tribus/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://image.freepik.com/free-vector/watercolor-background_87374-69.jpg'),
              fit: BoxFit.fill)),
      child: Center(
        child: Column(children: [
          TitleString('ABOUT'),
          AboutCard(
            url:
                'https://image.freepik.com/free-vector/businessman-top-mountain_1133-275.jpg',
            title: 'Our Mission',
            desc:
                'Our mission is to provide a platform to the people where they can find anythingthat they need. A place where a small idea would be welcomed by both hands and would be provided with the best results out of it.',
          ),
          AboutCard(
            url:
                'https://image.freepik.com/free-vector/manager-prioritizing-tasks-list_74855-5272.jpg',
            title: 'Our Plan',
            desc:
                'Our mission is to provide a platform to the people where they can find anythingthat they need. A place where a small idea would be welcomed by both hands and would be provided with the best results out of it.',
          ),
          AboutCard(
            url:
                'https://image.freepik.com/free-vector/businessman-flying-rocket-business-concept_107791-76.jpg?',
            title: 'Our Vission',
            desc:
                'Our mission is to provide a platform to the people where they can find anythingthat they need. A place where a small idea would be welcomed by both hands and would be provided with the best results out of it.',
          ),
          Spacer(),
          Container(
            height: 80,
            width: double.infinity,
            color: Colors.white.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us:',
                      style: TextStyle(
                          color: kBlueColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.phone),
                            onPressed: () {
                              launch('tel:=918005567003');
                            })
                      ],
                    )
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  final String url;
  final String title;
  final String desc;
  const AboutCard({Key key, this.url, this.title, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          flex: 1,
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 3,
            child: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: kBlueColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: kBlackColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
