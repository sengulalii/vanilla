part of '../on_board_view.dart';

class _StartFabButton extends StatelessWidget {
  const _StartFabButton({
    Key? key,
    required this.isLastPage,
    this.onPressed,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String start = "Start";
  final String end = "Next";
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Text(isLastPage ? start : end),
    );
  }
}
