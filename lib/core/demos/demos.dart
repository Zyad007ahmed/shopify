import 'package:shopify/core/widgets/banner/m/banner_m_style_1.dart';
import 'package:shopify/core/widgets/banner/m/banner_m_style_2.dart';
import 'package:shopify/core/widgets/banner/m/banner_m_style_3.dart';
import 'package:shopify/core/widgets/banner/m/banner_m_style_4.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

const productDemoImg1 = "https://i.imgur.com/CGCyp1d.png";
const productDemoImg2 = "https://i.imgur.com/AkzWQuJ.png";
const productDemoImg3 = "https://i.imgur.com/J7mGZ12.png";
const productDemoImg4 = "https://i.imgur.com/q9oF9Yq.png";
const productDemoImg5 = "https://i.imgur.com/MsppAcx.png";
const productDemoImg6 = "https://i.imgur.com/JfyZlnO.png";

const brandName = "Lipsy london";

List<Product> demoPopularProducts = [
  Product(
    images: [productDemoImg1],
    title: "Mountain Warehouse for Women",
    price: 540,
  ),
  Product(
    images: [productDemoImg4],
    title: "Mountain Beta Warehouse",
    price: 800,
  ),
  Product(
    images: [productDemoImg5],
    title: "FS - Nike Air Max 270 Really React",
    price: 650.62,
  ),
  Product(
    images: [productDemoImg6],
    title: "Green Poplin Ruched Front",
    price: 1264,
  ),
  Product(
    images: ["https://i.imgur.com/tXyOMMG.png"],
    title: "Green Poplin Ruched Front",
    price: 650.62,
  ),
  Product(
    images: ["https://i.imgur.com/h2LqppX.png"],
    title: "white satin corset top",
    price: 1264,
  ),
];
List<Product> demoFlashSaleProducts = [
  Product(
    images: [productDemoImg5],
    title: "FS - Nike Air Max 270 Really React",
    price: 650.62,
  ),
  Product(
    images: [productDemoImg6],
    title: "Green Poplin Ruched Front",
    price: 1264,
  ),
  Product(
    images: [productDemoImg4],
    title: "Mountain Beta Warehouse",
    price: 800,
  ),
];
List<Product> demoBestSellersProducts = [
  Product(
    images: ["https://i.imgur.com/tXyOMMG.png"],
    title: "Green Poplin Ruched Front",
    price: 650.62,
  ),
  Product(
    images: ["https://i.imgur.com/h2LqppX.png"],
    title: "white satin corset top",
    price: 1264,
  ),
  Product(
    images: [productDemoImg4],
    title: "Mountain Beta Warehouse",
    price: 800,
  ),
];
List<Product> kidsProducts = [
  Product(
    images: ["https://i.imgur.com/dbbT6PA.png"],
    title: "Green Poplin Ruched Front",
    price: 650.62,
  ),
  Product(
    images: ["https://i.imgur.com/7fSxC7k.png"],
    title: "Printed Sleeveless Tiered Swing Dress",
    price: 650.62,
  ),
  Product(
    images: ["https://i.imgur.com/pXnYE9Q.png"],
    title: "Ruffle-Sleeve Ponte-Knit Sheath",
    price: 400,
  ),
  Product(
    images: ["https://i.imgur.com/V1MXgfa.png"],
    title: "Green Mountain Beta Warehouse",
    price: 400,
  ),
  Product(
    images: ["https://i.imgur.com/8gvE5Ss.png"],
    title: "Printed Sleeveless Tiered Swing Dress",
    price: 654,
  ),
  Product(
    images: ["https://i.imgur.com/cBvB5YB.png"],
    title: "Mountain Beta Warehouse",
    price: 250,
  ),
];

List<Category> demoCategories = [
  Category(name: "All Categories"),
  Category(name: "On Sale", image: "assets/icons/Sale.svg"),
  Category(name: "Man's", image: "assets/icons/Man.svg"),
  Category(name: "Woman’s", image: "assets/icons/Woman.svg"),
  Category(name: "Kids", image: "assets/icons/Child.svg"),
];

List demoOffers = [
  BannerMStyle1(text: "New items with \nFree shipping", press: () {}),
  BannerMStyle2(
    title: "Black \nfriday",
    subtitle: "Collection",
    discountParcent: 50,
    press: () {},
  ),
  BannerMStyle3(title: "Grab \nyours now", discountParcent: 50, press: () {}),
  BannerMStyle4(
    // image: , user your image
    title: "SUMMER \nSALE",
    subtitle: "SPECIAL OFFER",
    discountParcent: 80,
    press: () {},
  ),
];
