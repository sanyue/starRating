import 'package:flutter/material.dart';
class SYStarRating extends StatefulWidget {
  final int  count;                // 展示的星星数
  final double rating;             // 当前分数
  final double maxRating;          // 最大分数
  final double size;               // 星星大小
  final Color selectedColor;       // 选中的颜色[针对默认的有效]
  final Color unSelectedColor;     // 未选中时的颜色[针对默认的有效]
  final Widget selectedImage;      // 放自定义的图片[选中的]
  final Widget unSelectedImage;    // 放自定义的图片[未选中的]
  SYStarRating({
    this.count = 5,
    @required this.rating,
    this.maxRating = 10.0,
    this.size = 30.0,
    this.selectedColor = Colors.red,
    this.unSelectedColor = Colors.grey,
    Widget selectedImage,
    Widget unSelectedImage,
  }) : selectedImage = selectedImage ?? Icon(Icons.star,size: size, color: selectedColor,),
        unSelectedImage = unSelectedImage ?? Icon(Icons.star_border,size: size, color: unSelectedColor,);
  @override
  _SYStarRatingState createState() => _SYStarRatingState();
}

class _SYStarRatingState extends State<SYStarRating> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: _getUnSelectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: _getSelectedStar()),
      ],
    );
  }

  // 创建未选中时候的星星
  List<Widget> _getUnSelectedStar(){
    return List.generate(this.widget.count, (_){
      return this.widget.unSelectedImage;
    });
  }

  // 选中时候的星星
  List<Widget> _getSelectedStar(){

    List<Widget> stars = [];
    final star = this.widget.selectedImage;
    // 1. 填充满星
    // 单个星所占分数
    double oneRating = this.widget.maxRating / this.widget.count;

    // 满星个数[向下取整]
    int fullCount = (this.widget.rating / oneRating).floor();
    for (int i = 0; i < fullCount; i++){
      stars.add(star);
    }

    // 2.半星
    double remainRating = (this.widget.rating / oneRating) - fullCount;
    print('remainRating:$remainRating');
    if (remainRating > 0){
      double remainWidth = remainRating * this.widget.size;
      final remainStar = ClipRect(
        child: star,
        clipper: SYStarClipper(width: remainWidth),
      );
      stars.add(remainStar);
    }

    if (fullCount > this.widget.count){
      return stars.sublist(0,this.widget.count);
    }
    return stars;
  }
}

class SYStarClipper extends CustomClipper<Rect> {
  final width;
  SYStarClipper({@required this.width});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, this.width, size.height);
  }

  @override
  bool shouldReclip(SYStarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}