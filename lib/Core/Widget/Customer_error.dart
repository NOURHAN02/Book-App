import 'package:book_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomerError extends StatelessWidget {
  const CustomerError({super.key, required this.errorMessage});
final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        errorMessage,
        style: Styles.textStyle18,
      ),
    );
  }
}
