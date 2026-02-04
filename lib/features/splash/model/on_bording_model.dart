//create a model class for onboarding screen

class OnBoardingModel {
  final String image;
  final String heading;
  final String subtext;

  OnBoardingModel({
    required this.image,
    required this.heading,
    required this.subtext,
  });

  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      image: "assets/onBoarding1.png",
      heading: "Sell What You Don’t Need",
      subtext: "Turn your unused items into instant cash with just a few taps.",
    ),
    OnBoardingModel(
      image: "assets/onBoarding2.png",
      heading: "Buy Quality. Pay Less.",
      subtext: "Discover verified listings near you at the best prices.",
    ),
    OnBoardingModel(
      image: "assets/onBoarding3.png",
      heading: "Buy & Sell Locally, Safely",
      subtext: "Chat directly, meet nearby, and deal with confidence.",
    ),
  ];
}
