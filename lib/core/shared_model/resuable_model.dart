class ReusableModel {
  final String imagePath;
  final String title;
  final String description;
  final String subDescription;
  final void Function()? onPressedIconFavourite;
  final Function() onTapCard;
  final bool isDoctor;
  final bool isDetails;
  final double isRating;
  final bool isVaccineTimes;
  final bool isFavourite;
  final bool isCheckBoxTrue;
  final void Function()? onTapCheckBoxVaccineTimes;
  ReusableModel(
      {required this.imagePath,
      required this.title,
      required this.description,
      required this.subDescription,
      this.onPressedIconFavourite,
      required this.onTapCard,
      this.isDoctor = false,
      this.isRating = 0,
      this.isDetails = false,
      this.isVaccineTimes = false,
      this.onTapCheckBoxVaccineTimes,
      this.isFavourite = false,
      this.isCheckBoxTrue = false});
}
