import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trailing_flutter/cubit/app_cubit_states.dart';
import 'package:trailing_flutter/cubit/app_cubits.dart';
import 'package:trailing_flutter/misc/colors.dart';
import 'package:trailing_flutter/widgets/app_large_text.dart';
import 'package:trailing_flutter/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'assets/img/balloning.png': 'Balloning',
    'assets/img/hiking.png': 'Hiking',
    'assets/img/kayaking.png': 'Kayaking',
    'assets/img/snorkling.png': 'Snorkling',
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // menu & profile
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.menu, size: 30, color: Colors.black54),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // text - discover
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(text: 'Discover'),
                ),
                const SizedBox(height: 20),
                // TabBar
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController, // required TickerProviderStateMixin & TabController
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    isScrollable: true, // work with Align(alignment: Alignment.centerLeft), it is tricky
                    indicatorSize: TabBarIndicatorSize.label, // fit label line length with label size
                    indicator: const CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                    tabs: const [
                      Tab(text: 'Places'),
                      Tab(text: 'Inspiration'),
                      Tab(text: 'Emotions'),
                    ],
                  ),
                ),
                // images - TabBarView
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController, // required TickerProviderStateMixin & TabController
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => BlocProvider.of<AppCubits>(context).detailPage(info[index]),
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage('http://mark.bslmeiyu.com/uploads/' + info[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const Text('There'),
                      const Text('Bye'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // text - explore more
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: 'Explore more', size: 22),
                      AppText(text: 'See all', color: AppColors.textColor1),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // images - categories
                Container(
                  width: double.maxFinite,
                  height: 100,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(images.keys.elementAt(index)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            AppText(text: images.values.elementAt(index), size: 11, color: AppColors.textColor2),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    // circle dot position
    final Offset circleOffset = Offset((configuration.size!.width - radius) / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
