import 'package:flutter/material.dart';
import 'package:trailing_flutter/misc/colors.dart';
import 'package:trailing_flutter/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
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
          const SizedBox(height: 40),
          // discover
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: 'Discover'),
          ),
          const SizedBox(height: 30),
          // tab bar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController, // required TickerProviderStateMixin & TabController
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                isScrollable: true, // work with Align(alignment: Alignment.centerLeft), it is tricky
                indicatorSize: TabBarIndicatorSize.label, // fit label line length with label size
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: 'Places'),
                  Tab(text: 'Inspiration'),
                  Tab(text: 'Emotions'),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController, // required TickerProviderStateMixin & TabController
              children: [
                Text('Hi'),
                Text('There'),
                Text('Bye'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

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