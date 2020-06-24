import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(10.0),
                title: const Text(
                    "a Lodjinha",
                    style: TextStyle(fontFamily: "Pacifico"),
                ),
                centerTitle: true,
              ),
            ),
          ],
        )
      ],
    );
  }
}
