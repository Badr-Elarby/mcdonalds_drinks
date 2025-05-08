class DrinkModel {
  final String name;
  final String price;
  final String image;
  final String title;

  DrinkModel(
      {required this.name,
      required this.price,
      required this.image,
      required this.title});

  static List<DrinkModel> drinks = [
    DrinkModel(
        name: 'Brownie Island',
        price: '60',
        image: 'assets/drinks/Brownie Island.png',
        title: '6 flavors of your drink'),
    DrinkModel(
        name: 'Coke',
        price: '65',
        image: 'assets/drinks/Strawberry.png',
        title: '20 flavors of your drink'),
    DrinkModel(
        name: 'Chocolate',
        price: '5.00',
        image: 'assets/drinks/Chocolate.png',
        title: '5 flavors of your drink'),
    DrinkModel(
        name: 'Banana',
        price: '20',
        image: 'assets/drinks/Banana.png',
        title: '14 flavors of your drink'),
    DrinkModel(
        name: 'Salted Caramel',
        price: '40',
        image: 'assets/drinks/Salted Caramel.png',
        title: '12 flavors of your drink'),
    DrinkModel(
        name: 'Coke',
        price: '65',
        image: 'assets/drinks/Strawberry.png',
        title: '20 flavors of your drink'),
    DrinkModel(
        name: 'Brownie Island',
        price: '60',
        image: 'assets/drinks/Brownie Island.png',
        title: '6 flavors of your drink'),
  ];
}
