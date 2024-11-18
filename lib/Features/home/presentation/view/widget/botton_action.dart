import 'package:book_app/Core/Widget/Customer_botton.dart';
import 'package:book_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottonAction extends StatelessWidget {
  const BottonAction({super.key, required this.goTo});
  final String goTo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Expanded(
        //   child: CustomerBotton(
        //     color:const Color(0xffEF8262),
        //     bottonText: "Free",
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(20),
        //       bottomLeft: Radius.circular(20),
        //     ),
        //     textStyle: Styles.textStyle18.copyWith(color: Colors.black),
        //   ),
        // ),
        Expanded(
          child: CustomerBotton(
            onPressed: () {},
            color: Colors.white,
            bottonText: " Free",
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            textStyle: Styles.textStyle18.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: CustomerBotton(
            onPressed: () async {
              final Uri url = Uri.parse(goTo);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            color: const Color(0xffEF8262),
            bottonText: " Preview",
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            textStyle: Styles.textStyle16.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
