//Set up header items

class HeaderItem {
  final String title;
  final Function onTap;
  final bool isButton;
  final int? index;

  HeaderItem({required this.title, required this.onTap, this.isButton = false,  this.index});
}
