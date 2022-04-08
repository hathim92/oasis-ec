class TopSellingProducts {
  final String Image;
  final String Name;
  final String Price;
  final String Category;

  TopSellingProducts(this.Image, this.Name, this.Price, this.Category);

  List<TopSellingProducts> topSellingProducts = [
    new TopSellingProducts("images/xbox controller.png", "Xbox Controller",
        "4,000", "Video Games"),
    new TopSellingProducts(
        "images/Gaming Mouse.png", "Gaming Mouse", "8,000", " Accesories"),
    new TopSellingProducts(
        "images/ordinary mouse.png", "Ordinary mouse", "1,200", " Accesories"),
    new TopSellingProducts(
        "images/keyboard.png", "Keyboard", "2500", " Accesories"),
    new TopSellingProducts(
        "images/playstation.png", "Playstation", "21,000", "Video Games"),
    new TopSellingProducts(
        "images/xbox controller.png", "Xbox Controller", "4,000", "Video Games")
  ];
}
