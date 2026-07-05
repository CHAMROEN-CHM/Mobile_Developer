class ButtonData {
  String name;
  bool isselected;

  ButtonData(this.name, this.isselected);

  static ButtonData fromJson(Map<String, dynamic> json) {
    String namekey = 'name';
    String isSelectedkey = 'isSelected';
    assert(json[namekey] is String);
    assert(json[isSelectedkey] is bool);

    String name = json[namekey];
    bool isSelected = json[isSelectedkey];
    return ButtonData(name, isSelected);
  }
}
