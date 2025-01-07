class AccountListTileModel {
  final String title;
  final String imageLeadingPath;
  final void Function()? onTap;

  AccountListTileModel(
      {required this.title,
      required this.imageLeadingPath,
      required this.onTap});
}
