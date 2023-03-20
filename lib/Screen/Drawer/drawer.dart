// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football3/constent.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../AboutFootball/aboutfootball.dart';
import '../Privacy_Policy/privacypolicy.dart';
import '../Privacy_Policy/tearmscondition.dart';

enum Availability { loading, available, unavailable }

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final InAppReview _inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            Container(
              padding: EdgeInsets.all(10.r),
              child: Text(
                appname,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            menu(
                icon: Icons.privacy_tip,
                name: "About Football XT",
                onTap: () {
                  redirectpage(const AboutFootballPage());
                }),
            const Divider(),
            menu(
                icon: Icons.privacy_tip,
                name: "Privecy Policy",
                onTap: () {
                  redirectpage(const PrivacyPolicyPage());
                }),
            const Divider(),
            menu(
                icon: Icons.security,
                name: "Tearms and Condition",
                onTap: () {
                  redirectpage(const TearmconditionPagePage());
                }),
            const Divider(),
            menu(
                icon: Icons.privacy_tip,
                name: "Rate us",
                onTap: () async {
                  await _inAppReview.isAvailable();
                  setState(() {
                    _inAppReview.requestReview();
                  });
                }),
            const Divider(),
            menu(
                icon: Icons.security,
                name: "Feedback",
                onTap: () async {
                  const uri =
                      'mailto:****@gmail.com?cc=bar@example.com&subject=Greetings%20from%20Cupertino!&body=Wish%20you%20were%20here!';
                  if (await canLaunch(uri)) {
                    await launch(uri);
                  } else {
                    throw 'Could not launch $uri';
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget menu({GestureTapCallback? onTap, IconData? icon, String? name}) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: size.width * 0.7,
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                  color: Colors.white,
                ),
                const SizedBox(width: 20),
                Text(
                  name!,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void redirectpage(Widget name) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => name,
        ));
  }

  Widget fidbackdialog() {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              "Feedback",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
                "Our team is continually working to improve WicketScore to give you the best possible experience. If you have any feedback or suggestions we'd love to hear from you, just email us."),
          ),
          textbox("Your e-mail address"),
          textbox("Your feedback", maxline: 5),
          Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.indigo, borderRadius: BorderRadius.circular(10)),
            child: const Text(
              "Feedback",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget textbox(String hintname, {int maxline = 1}) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        maxLines: maxline,
        decoration: InputDecoration(
            fillColor: Colors.grey[200],
            isDense: true,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(5)),
            hintText: hintname),
      ),
    );
  }
}
