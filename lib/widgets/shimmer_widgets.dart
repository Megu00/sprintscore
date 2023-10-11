import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SizedBox(

  
  child: Shimmer.fromColors(
    baseColor: Colors.red,
    highlightColor: Colors.yellow,
    child:const Center(
      child: Text(
        'Loading',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight:
          FontWeight.bold,
        ),
      ),
    ),
  ),
),






    );
  }
}