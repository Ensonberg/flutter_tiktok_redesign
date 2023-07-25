import 'package:flutter/material.dart';

import 'package:ovatoyu/ui/screens/single_live/single_live_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'live_view_model.dart';

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage>
    with SingleTickerProviderStateMixin {
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
    return ViewModelBuilder<LiveViewModel>.reactive(
        viewModelBuilder: () => LiveViewModel(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 45),
            child: Container(
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 24,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, SingleLiveScreen.routeName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.dstATop),
                                image: NetworkImage(
                                  imageList[index],
                                ),
                              ),
                              backgroundBlendMode: BlendMode.darken,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        child: Image.asset(
                                            "assets/svgs/Ellipse 1.png"),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Name",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.visibility_outlined,
                                                color: Colors.white,
                                                size: 13,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "14.k",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontFamily: "San Francisco",
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                    }),
              ),
            ),
          );
        });
  }
}
