import 'package:flutter/material.dart';
import 'package:flutter_star_rating/star_rating/utils/clipper.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: RateStar(
          rating: 2,
          ratingCount: 12,
        ),
      ),
    );
  }
}

class RateStar extends StatelessWidget {
  final double rating;
  final double size;
  final int ratingCount;
  const RateStar(
      {super.key,
      required this.rating,
      required this.ratingCount,
      this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> starList = [];

    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        starList.add(Icon(Icons.star,
            color: Theme.of(context).primaryColor, size: size));
      } else if (i == realNumber) {
        starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(Icons.star,
                  color: Theme.of(context).primaryColor, size: size),
              ClipRect(
                clipper: Clipper(part: partNumber),
                child: Icon(Icons.star, color: Colors.grey, size: size),
              )
            ],
          ),
        ));
      } else {
        starList.add(Icon(Icons.star, color: Colors.grey, size: size));
      }
    }
    ratingCount != null
        ? starList.add(
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('($ratingCount)',
                    style: TextStyle(
                        fontSize: size * 0.8,
                        color: Theme.of(context).disabledColor))),
          )
        : const SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starList,
    );
  }
}
