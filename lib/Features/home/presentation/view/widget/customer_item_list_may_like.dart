import 'package:book_app/Core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//****************
class CustomerItemListMayLike extends StatelessWidget {
  const CustomerItemListMayLike({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5/4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.cyan,
          image: DecorationImage(
            image: AssetImage(AssetsData.kLogo),
          ),
        ),
      ),
    );
  }
}
