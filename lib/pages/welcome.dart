import 'package:freestyle_exercise/widgets/exercises_widget.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildAppBar(context),
            ExercisesWidget(),
          ],
        ),
      );

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
        title: Text('FreeStyle Exercise'),
        centerTitle: true,
        pinned: true,
        actions: [
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => About(),
                  )),
              child: Icon(
                Icons.info,
                size: 28,
              )),
          SizedBox(width: 12),
        ],
      );
}
