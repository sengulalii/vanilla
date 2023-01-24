class OnBoardModel {
  final String title;
  final String description;
  final String imageName;
  OnBoardModel(this.title, this.description, this.imageName);

  String get imageWithPath => "asset/images/$imageName.jpg";
}

class OnBoardsModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel('Order',
        'Now you can order food any time right from your mobile.', 'ic_1'),
    OnBoardModel('Order',
        'Now you can order food any time right from your mobile.', 'ic_2'),
    OnBoardModel('Order',
        'Now you can order food any time right from your mobile.', 'ic_3'),
  ];
}
