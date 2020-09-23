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
              image: NetworkImage(
                'https://image.freepik.com/free-vector/white-elegant-texture-background_23-2148434266.jpg',
              ))),
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          TitleString('TEAM'),
          SizedBox(height:50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HoverProfile(
                dpUrl:
                    'https://raw.githubusercontent.com/lalitjarwal/lalitjarwal/master/PicsArt_03-02-04.39.57.jpg',
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
                    'https://raw.githubusercontent.com/Nandan-Wewhare/personal/master/img.jpg?token=AMO2QI3PNVDPBNFDAW3NUUK7M5CNO',
                instaUrl: 'https://www.instagram.com/nandan.vyavahare/',
                linkedInUrl: 'https://www.linkedin.com/in/nandanwewhare',
                email: 'nandanwewhare25@gmail.com',
              ),
              HoverProfile(
                title: 'BDA',
                name: 'Adhar Saxena ',
                dpUrl:
                    'https://raw.githubusercontent.com/Adhaar11/personal/master/IMG_20200919_110828.jpg',
                instaUrl: '',
                linkedInUrl:
                    'https://www.linkedin.com/in/adhaar-saxena-a88b811a3/',
                email: 'saxenaadhaar033@gmail.com',
              ),
              HoverProfile(
                title: 'Chief, HR',
                name: 'Abhishek Sharma',
                dpUrl:
                    'https://raw.githubusercontent.com/Abhishek-5harma/my-image/master/20180722_174138.jpg?token=ALZOZSFFADFSLXQ2KI343DC7M5EZE',
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

