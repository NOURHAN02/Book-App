import 'package:book_app/Features/home/data/model/BookModel.dart';
import 'package:book_app/Features/home/presentation/view/details_home_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItemList extends StatelessWidget {
  const BookItemList({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  DetailsHomeView(bookModel: book,)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: book.volumeInfo!.imageLinks?.thumbnail ??
                "",
            placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
            errorWidget: (context, url, error) => Container(
                color: Colors.white,
                child: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 40,
                )),
          ),
        ),
      ),
    );
  }
}
