import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import './roundButton.dart';

class PageData {
  const PageData({
    @required this.title,
    @required this.description,
    @required this.image,
  });

  final String title;
  final String description;
  final AssetImage image;
}

final _titleStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Kavoon',
  fontSize: 26.0,
  decoration: TextDecoration.none,
);
final _descriptionStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
  fontSize: 14.0,
  decoration: TextDecoration.none,
);

class _PagerItem extends StatelessWidget {
  const _PagerItem({
    @required this.data,
    @required this.doneItem
  });

  final PageData data;
  final Widget doneItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Image(image: this.data.image),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(this.data.title, style: _titleStyle, textAlign: TextAlign.center),
              Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 50.0),
                padding: const EdgeInsetsDirectional.only(start: 50.0, end: 50.0),
                child: Text(this.data.description, style: _descriptionStyle, textAlign: TextAlign.center),
              ),
              doneItem,
            ]
            .where((o) => o != null)
            .toList(),
          ),
        )
      ],
    );
  }
}

class Pager extends StatelessWidget {
  const Pager({
    @required this.pages,
    @required this.doneText,
    @required this.doneAction,
  });

  final List<PageData> pages;
  final String doneText;
  final Function doneAction;

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);

    final doneButton = RoundButton(title: this.doneText, action: this.doneAction);
    final pageItems = List<Widget>();

    for (var i = 0; i < this.pages.length; i++) {
      final data = this.pages[i];
      pageItems.add(_PagerItem(data: data, doneItem: i == this.pages.length - 1 ? doneButton : null));
    }

    return Column(
      children: [
        Expanded(
          child: TabBarView(
            children: pageItems,
          ),
        ),
        Container(
          child: TabPageSelector(
            controller: controller,
            color: Colors.grey,
            selectedColor: Colors.white,
            indicatorSize: 15.0,
          )
        ),
      ],
    );
  }
}
