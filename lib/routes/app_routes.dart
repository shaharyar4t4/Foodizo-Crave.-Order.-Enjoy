import 'package:get/get.dart';
import 'package:shopstore/components/nav_bar.dart';
import 'package:shopstore/screen/veiw_thanks.dart';
import 'package:shopstore/screen/view_onbored.dart';
import 'package:shopstore/screen/view_order.dart';
import 'package:shopstore/screen/view_product_two.dart';

import '../screen/veiw_onboredshop.dart';
import '../screen/view_dashbored.dart';
import '../screen/view_product.dart';

var allPage = [
  GetPage(
    name: '/onbroad',
    page: () => Onbroad(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/dashbored',
    page: () => ViewDashbored(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/NavBar',
    page: () => NavBar(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/product',
    page: () => ProductPage(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/producttwo',
    page: () => ViewProductTwo(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/order',
    page: () => OrderDetailsPage(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/pizza',
    page: () => PizzaHomePage(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: '/thanks',
    page: () => OrderCompletedScreen(),
    transition: Transition.leftToRight,
  ),
];
