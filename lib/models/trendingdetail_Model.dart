class TrendingModel {
  final String bigImage;
  final String Image1;
  final String Image2;
  final String Image3;
  final String Image4;
  final String title;
  final String price;
  final String description;

  TrendingModel(this.bigImage, this.Image1, this.Image2, this.Image3,
      this.Image4, this.title, this.price, this.description);
}

List<TrendingModel> trendingdata = [
  new TrendingModel(
      "images/xbox controller.png",
      "images/xbox controller.png",
      "images/xbox controller.png",
      "images/xbox controller.png",
      "images/xbox controller.png",
      'X-Box',
      '21,000',
      "Xbox is a video gaming brand created and owned by Microsoft. The brand consists of five video game consoles, as well as applications (games), streaming services, an online service by the name of Xbox network, and the development arm by the name of Xbox Game Studios.")
];
