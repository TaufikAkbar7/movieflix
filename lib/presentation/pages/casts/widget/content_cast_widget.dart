import 'package:flutter/material.dart';
import 'package:movie_app/presentation/constants/app_constants.dart';

class ContentCastWidget extends StatelessWidget {
  final List<Map<String, String>> data;
  const ContentCastWidget({super.key, required this.data});

  @override
  Widget build(context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: const EdgeInsets.all(8.0), // padding around the grid
      itemCount: data.length, // total number of items
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(data[index]['image'] != ''
                  ? "${ImageConstant.tmbdImageCard}/${data[index]['image']}"
                  : ImageConstant.defaultImage),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(height: 2.0),
            Text(data[index]['job'] ?? '-',
                style: const TextStyle(color: Colors.grey, fontSize: 12.0)),
            const SizedBox(height: 2.0),
            Text(data[index]['name'] ?? '-',
                style: const TextStyle(color: Colors.white))
          ],
        );
      },
    );
  }
}
