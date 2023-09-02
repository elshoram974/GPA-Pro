import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final int crossAxisCount;
  final List<Widget> widgets;
  final ScrollPhysics? physics;
  final double childAspectRatio;

  const MyGridView({
    super.key,
    this.crossAxisCount = 3,
    required this.widgets,
    this.physics,
    this.childAspectRatio = 3,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
      ),
      physics: physics,
      children: List.generate(
        widgets.length,
        (index) => GridTile(
          child: FittedBox(child: widgets[index]),
        ),
      ),
    );
  }
}
