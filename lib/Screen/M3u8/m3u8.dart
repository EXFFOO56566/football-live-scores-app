import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Httpservice/m3u8.dart';
import '../../Model/M3u8/m3u8.dart';
import '../Video_View/videoplayer.dart';

class M3u8Page extends StatefulWidget {
  const M3u8Page({Key? key}) : super(key: key);

  @override
  State<M3u8Page> createState() => _M3u8PageState();
}

class _M3u8PageState extends State<M3u8Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Live Stream"),
        ),
        body: FutureBuilder<List<M3U8>?>(
            future: HttpM3u8().getm3u8(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                              data.title!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          ChewieDemo(videourl: data.m3U8!))));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[800]!.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                          height: 50.h,
                                          width: 50.w,
                                          child: Image.network(data.imagea!)),
                                      Text(
                                        data.teama!,
                                        style: const TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        "Watch",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Text(
                                          "Live",
                                          style:
                                              TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                          height: 50.h,
                                          width: 50.w,
                                          child: Image.network(data.imageb!)),
                                      Text(
                                        data.teamb!,
                                        style: const TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }
}
