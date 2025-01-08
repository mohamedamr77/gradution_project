class FavDoctorsModel{
  final String name;
  final String description;
  final double rate;
  final String imagePath;
  bool isFav = false;



  FavDoctorsModel( {required this.isFav ,required this.name, required this.description, required this.rate, required this.imagePath,});
}
/*
 imagePath: AppImages.doctorAmrTest,
        title: "د / محمد عمرو",
        description: "اخصائى اطفال",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {},
        isDoctor: true,
        isRating: 4.5,
 */
/*
 imagePath: AppImages.tuberVaccineTest,
        title: AppText.rotavirusVaccine,
        description: "فعال بنسبة99%",
        subDescription: "يتم اخده مره واحده",
        onPressedIconFavourite: () {},
        onTapCard: () {},
        isDetails: true,
 */