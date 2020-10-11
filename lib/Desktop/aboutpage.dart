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
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          HoverCard(
            bannerUrl: 'images/ourmission.jpg',
            title: kMissionTitle,
            desc: kMissionDesc,
            url: 'images/mission_secondary.jpg',
          ),
          HoverCard(
            bannerUrl: 'images/ourplan.jpg',
            title: kPlanTitle,
            desc: kPlanDesc,
            url: 'images/plan_secondary.jpg',
          ),
          HoverCard(
            bannerUrl: 'images/ourvision.jpg',
            title: kVisionTitle,
            desc: kVisionDesc,
            url: 'images/vision_secondary.jpg',
          ),
        ]),
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
                            child: Row(children: [
                              Image.asset(
                                'images/logo.png',
                                width: MediaQuery.of(context).size.width / 8.5,
                              ),
                              Text('Tribus Tech \nSolutions',
                                  textScaleFactor: 2,
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold))
                            ]),
                          ),
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SelectableText(
                                'Email: tribustechsolutions@gmail.com',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kWhiteColor,
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
                                  width:
                                      MediaQuery.of(context).size.width / 8.45,
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
                                          MediaQuery.of(context).size.width /
                                              62,
                                      icon: Icon(Icons.radio_button_checked),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      iconSize:
                                          MediaQuery.of(context).size.width /
                                              62,
                                      icon: Icon(Icons.radio_button_checked),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      iconSize:
                                          MediaQuery.of(context).size.width /
                                              62,
                                      icon: Icon(Icons.radio_button_checked),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      iconSize:
                                          MediaQuery.of(context).size.width /
                                              62,
                                      icon: Icon(Icons.radio_button_checked),
                                      onPressed: () {},
                                    )
                                  ]),
                              SizedBox(height: 60)
                            ]),
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.8),
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                        '© Copyright Tribus Tech Solutions @ 2020. All Rights Reserved.',
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
