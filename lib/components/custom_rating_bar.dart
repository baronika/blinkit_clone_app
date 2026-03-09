import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class custom_rating_bar extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  custom_rating_bar({
    Key? key,
    required this.rating,
    this.size=16,
    this.color=Colors.amber,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemCount: 5,
      itemSize: size,
      direction: Axis.horizontal,
      itemBuilder: (context, index) =>
          Icon(
            Icons.star_rounded,
            color: color,
          ),
    );
  }
}
