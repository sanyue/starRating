import 'package:flutter/material.dart';
import 'star_rating.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SYHomePage(),
    );
  }
}

class SYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('starRating'),
      ),
      body: SYHomeContent(),
    );
  }
}

class SYHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('默认展示：'),
          SYStarRating(count: 5,rating: 7.6,),
          SizedBox(height: 20,),
          Text('传入图片后的展示：'),
          Text('默认size:30'),
          SYStarRating(
            count: 5,
            rating: 9,
            selectedImage: Image(image: AssetImage('assets/images/selectedStar.png'),),
            unSelectedImage: Image(image: AssetImage('assets/images/unSelectedStar.png'),),
          ),
          SizedBox(height: 10,),
          Text('为了保持显示的准确性，size跟图片宽度要保持一致'),
          SYStarRating(
            count: 5,
            rating: 9,
            size: 25,
            selectedImage: Image(image: AssetImage('assets/images/selectedStar.png'),width: 25,),
            unSelectedImage: Image(image: AssetImage('assets/images/unSelectedStar.png'),width: 25,),
          ),
        ],
      ),
    );
  }
}



