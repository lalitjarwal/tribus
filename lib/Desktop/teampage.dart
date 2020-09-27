import 'package:flutter/material.dart';
import 'package:tribus/Widgets/hoverprofile.dart';
import 'package:tribus/Widgets/title.dart';

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
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          TitleString('TEAM'),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HoverProfile(
                dpUrl:
                    'images/jarwal.jpg',
                title: 'Co-Founder & CEO',
                name: 'Lalit Jarwal',
                email: 'lalitjarwal315@gmail.com',
                instaUrl: 'https://www.instagram.com/oyelalit/',
                linkedInUrl:
                    'https://www.linkedin.com/in/lalit-jarwal-94b14b15a/',
              ),
              HoverProfile(
                title: 'Co-Founder & CTO',
                name: 'Nandan Wewhare',
                dpUrl:
                    'images/king.jpg',
                instaUrl: 'https://www.instagram.com/nandan.vyavahare/',
                linkedInUrl: 'https://www.linkedin.com/in/nandanwewhare',
                email: 'nandanwewhare25@gmail.com',
              ),
              HoverProfile(
                title: 'BDA',
                name: 'Adhaar Saxena ',
                dpUrl:
                    'images/adhaar.jpg',
                instaUrl: '',
                linkedInUrl:
                    'https://www.linkedin.com/in/adhaar-saxena-a88b811a3/',
                email: 'saxenaadhaar033@gmail.com',
              ),
              HoverProfile(
                title: 'Chief, HR',
                name: 'Abhishek Sharma',
                dpUrl:
                    'images/powder.jpg',
                instaUrl: 'https://www.instagram.com/absolutely_abhi_/',
                linkedInUrl:
                    'https://www.linkedin.com/in/abhishek-sharma-130950178/',
                email: '',
              )
            ],
          ),
        ],
      )),
    );
  }
}
