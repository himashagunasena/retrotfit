import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

Widget CatchImage() {
  return Container(
    child: CachedNetworkImage(
      imageUrl:
          "https://images.unsplash.com/photo-1519501025264-65ba15a82390?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTF8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
      width: 20,
      height: 20,
      placeholder: (context, url) => Circular(),
    ),
  );
}

Widget Circular() {
  return SizedBox(
    height: 100,
    width: 100,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
