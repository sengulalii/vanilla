import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vanilla/future/onboard/onboard_model.dart';
import 'package:vanilla/future/onboard/tab_indicator.dart';
import 'package:vanilla/product/padding/page_padding.dart';
import 'package:vanilla/product/widget/onboard_card.dart';

part './module/start_fab_button.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  final String _skipTile = "Skip";
  int _selectedIndex = 0;
  bool get _isLastPage =>
      OnBoardsModels.onBoardItems.length - 1 == _selectedIndex;

  ValueNotifier<bool> isBackEnable = ValueNotifier(false);

  bool get _isFirstPage => _selectedIndex == 0;

  void _incerementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }
    incrementSelectedPage(value);
  }

  void incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) {
      return;
    }
    isBackEnable.value = !isBackEnable.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _StartFabButton(
                  isLastPage: _isLastPage,
                  onPressed: () {
                    _incerementAndChange();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
            valueListenable: isBackEnable,
            builder: (BuildContext context, bool value, Widget? child) {
              return value
                  ? const SizedBox()
                  : TextButton(onPressed: () {}, child: Text(_skipTile));
            })
      ],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
                size: 30,
              ),
            ),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
        onPageChanged: ((value) {
          _incerementAndChange(value);
        }),
        itemCount: OnBoardsModels.onBoardItems.length,
        itemBuilder: (context, index) {
          return OnBoardCard(
            model: OnBoardsModels.onBoardItems[index],
          );
        });
  }
}
