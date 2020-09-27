import 'package:flutter/material.dart';
import 'package:tribus/Widgets/hovercard_about.dart';
import 'package:tribus/Widgets/title.dart';
import 'package:tribus/constants.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('images/aboutusbackground.jpg'),
            fit: BoxFit.fill),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: TitleString('ABOUT US'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HoverCard(
              bannerUrl:
                  'images/ourmission.jpg',
              title: 'Our Mission',
              desc:
                  'Our mission is to provide a platform to the people where they can find anything that they need. A place where a small idea would be welcomed by both hands and would be provided with the best results out of it. We want to develop an environment where every one of us can thrive and meet all the demands of the coming future. A place where each and every one ‘s voice, not only talking about our employees but our customers and everyone who incubate their ideas in the company would be relished upon and would be cared. ',
              url:
                  'images/mission_secondary.jpg',
            ),
            HoverCard(
              bannerUrl:
                  'images/ourplan.jpg',
              title: 'Our Plan',
              desc:
                  'We plan to provide the best products and services to the people. We never compromise with the quality as in the future we have to create benchmarks for us only. We have to make long term goals and have to create a proper structure to achieve it. We are here to provide great values and to earn and to make respect. ',
              url:
                  'images/plan_secondary.jpg',
            ),
            HoverCard(
              bannerUrl:
                  'images/ourvision.jpg',
              title: 'Our Vision',
              desc:
                  'We are passionate in our work and never look at alternatives for hard work. We build a strong connection with our colleagues, emotionally and professionally, which enable us to create a good environment in our company. We always treat our clients with a positive attitude, we treat them with due respect and maintain professionalism with them. As we always look at our company as a team of intellectuals, so we have created a democratic platform, in which everyone\'s voice and outlook is being mattered. ',
              url:
                  'images/vision_secondary.jpg',
            )
          ],
        ),
        Container(
          height: 270,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withOpacity(0.5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: kBlueColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  kLogoUrl,
                                  width:
                                      MediaQuery.of(context).size.width / 8.5,
                                ),
                                Text('Tribus Tech \nSolutions',
                                    textScaleFactor: 2,
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold))
                              ],
                            )),
                      ),
                      SizedBox(width: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 3,
                          height: MediaQuery.of(context).size.width / 8.5,
                          color: kBlueColor,
                        ),
                      ),
                      SizedBox(width: 25),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'CONTACT US',
                              style: TextStyle(
                                fontSize: 24,
                                color: kBlueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 8.4,
                              height: 6,
                              color: Colors.transparent),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SelectableText(
                              'Phone: +91-8005567003',
                              style: TextStyle(
                                fontSize: 18,
                                color: kWhiteColor,
                                //fontWeight:FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SelectableText(
                              'Email: tribustechsolutions2020@gmail.com',
                              style: TextStyle(
                                fontSize: 18,
                                color: kWhiteColor,
                                //fontWeight:FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SelectableText(
                              "Address : 174/49 Pratap Nagar, Sanganer,\n\t\t Jaipur (Rajasthan), India, 302033",
                              style: TextStyle(
                                fontSize: 18,
                                color: kWhiteColor,
                                //fontWeight:FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 3,
                          height: MediaQuery.of(context).size.width / 8.5,
                          color: kBlueColor,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 18),
                            child: Text(
                              'SOCIAL',
                              style: TextStyle(
                                fontSize: 24,
                                color: kBlueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 8.45,
                              height: 6,
                              color: Colors.transparent),
                          ButtonBar(
                              overflowButtonSpacing: 0,
                              buttonPadding: EdgeInsets.zero,
                              mainAxisSize: MainAxisSize.min,
                              alignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  iconSize:
                                      MediaQuery.of(context).size.width / 62,
                                  icon: Icon(Icons.radio_button_checked),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  iconSize:
                                      MediaQuery.of(context).size.width / 62,
                                  icon: Icon(Icons.radio_button_checked),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  iconSize:
                                      MediaQuery.of(context).size.width / 62,
                                  icon: Icon(Icons.radio_button_checked),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  iconSize:
                                      MediaQuery.of(context).size.width / 62,
                                  icon: Icon(Icons.radio_button_checked),
                                  onPressed: () {},
                                )
                              ]),
                          SizedBox(height: 60)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.8),
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                        '© Copyright Tribus Tech Solutions. All Rights Reserved @2020',
                        textScaleFactor: 1.2,
                        style: TextStyle(color: kWhiteColor)),
                  ),
                )
              ]),
        ),
      ]),
    );
  }
}
