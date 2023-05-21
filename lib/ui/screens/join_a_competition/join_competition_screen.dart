import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovatoyu/ui/screens/competition/competition_screen.dart';
import 'package:ovatoyu/ui/theme/colors.dart';

class JoinCompetitionScreen extends StatelessWidget {
  static const routeName = "/join_competition";
  const JoinCompetitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
      'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          "Competitions",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 16.sp, color: black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Add",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: primary),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: imageList.length,
          itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CompetitionScreen.routeName);
                  },
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        image: NetworkImage(
                          imageList[index],
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "#WEARETOGETHER",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
