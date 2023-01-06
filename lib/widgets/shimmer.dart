import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmers extends StatelessWidget {
  double? height;
  double? width;
  Shimmers({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[350]!,
      child: Container(
        width: width,

        height: height,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}

class Shimmercard extends StatelessWidget {
  const Shimmercard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmers(
              height: 70,
              width: 70,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmers(
                    height: 15,
                    width: 60,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Shimmers(
                    height: 15,
                    width: 90,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Shimmers(
                height: 40,
                width: 100,
              ),
            )
          ],
        ));
  }
}
