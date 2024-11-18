import 'package:book_app/Core/utils/assets.dart';
import 'package:book_app/Features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

class CustomerApp extends StatelessWidget {
  const CustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Image.asset(
            AssetsData.kLogo,
            height: 20,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(
              Icons.search_outlined,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
