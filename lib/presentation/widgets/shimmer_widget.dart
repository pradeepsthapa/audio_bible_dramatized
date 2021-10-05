import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            child: ListTile(
              leading: LoadingShimmer(
                height: 50,
                width: 45,
                shapeBorder: RoundedRectangleBorder(),),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingShimmer(
                    height: 15,
                    width: size.width * .5,
                    shapeBorder: RoundedRectangleBorder(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  LoadingShimmer(
                    height: 12,
                    width: size.width,
                    shapeBorder: RoundedRectangleBorder(),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class LoadingShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder? shapeBorder;

  const LoadingShimmer(
      {@required this.width,
        @required this.height,
        @required this.shapeBorder});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[900]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[800]! : Colors.grey[200]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
            color: isDark ? Colors.grey[800]! : Colors.grey[300],
            shape: shapeBorder!),
      ),
    );
  }
}
