import 'package:flutter/material.dart';

import './Pager.dart';

class Onboarding extends StatelessWidget {
  final String doneText = 'Let\'s go!';
  final List<PageData> onboardingData = [
    PageData(title: 'For movie lovers', description: 'View what’s in theaters, trending movies and much more.', image: AssetImage('assets/images/onboarding1.png')),
    PageData(title: 'Indiana would use it', description: 'It’s just so sleek and smooth. MovieFan is for you, the fan of movies.', image: AssetImage('assets/images/onboarding2.png')),
    PageData(title: 'Ready?', description: 'The onboarding is finished, you are now ready to enjoy movies like never before.', image: AssetImage('assets/images/onboarding3.png')),
  ];

  _didPressDone() {
    debugPrint('Done!');
  }

  @override
  Widget build(BuildContext context) {
    final pager = Pager(pages: this.onboardingData, doneText: this.doneText, doneAction: this._didPressDone);

    return DefaultTabController(
      length: onboardingData.length,
      child: pager,
    );
  }
}
