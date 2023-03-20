import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football3/Screen/YoutubeVideo/youtubeplayer.dart';
import 'package:provider/provider.dart';

import '../../Provider/youtube.dart';

class YoutubeVideoPage extends StatefulWidget {
  const YoutubeVideoPage({Key? key}) : super(key: key);

  @override
  State<YoutubeVideoPage> createState() => _YoutubeVideoPageState();
}

class _YoutubeVideoPageState extends State<YoutubeVideoPage> {
  PageController? _pageController;

  int _currentpage = 2;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return cardview();
  }

  Widget cardview() {
    final youtube = Provider.of<YoutubeProvider>(context);
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 210.h,
          width: double.infinity,
          child: PageView.builder(
              onPageChanged: ((value) {
                setState(() {
                  _currentpage = value;
                });
              }),
              itemCount: youtube.youtubelist!.items!.length,
              controller: _pageController,
              itemBuilder: ((context, index) {
                var data = youtube.youtubelist!.items![index];
                return AnimatedBuilder(
                  animation: _pageController!,
                  builder: (context, child) {
                    double value = 1;
                    if (_pageController!.position.haveDimensions) {
                      value = _pageController!.page! - index;
                      value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                    }
                    return Center(
                      child: SizedBox(
                        height: Curves.easeOut.transform(value) * 200.h,
                        width: 250.0,
                        child: child,
                      ),
                    );
                  },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => YoutubePlayerPage(
                                    youtubeid: data.id!,
                                  ))));
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            data.snippet!.thumbnails!.thumbnailsDefault!.url!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.indigoAccent),
                                color: Colors.indigoAccent,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(Icons.play_arrow),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              data.snippet!.title!,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              youtube.youtubelist!.items!.length,
              (index) => Container(
                    margin: EdgeInsets.only(right: 5.w),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: _currentpage == index
                                ? const Color(0xFFD7C64F)
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Container(
                      height: 7.h,
                      width: 7.w,
                      decoration: BoxDecoration(
                          color: const Color(0xFFD7C64F),
                          borderRadius: BorderRadius.circular(100.r)),
                    ),
                  )),
        )
      ],
    );
  }
}
