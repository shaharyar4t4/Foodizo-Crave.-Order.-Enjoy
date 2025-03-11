import 'package:get/get.dart';
import 'package:shopstore/components/nav_bar.dart';
import 'package:shopstore/screen/veiw_thanks.dart';
import 'package:shopstore/screen/view_onbored.dart';
import 'package:shopstore/screen/view_order.dart';

import '../screen/veiw_onboredshop.dart';
import '../screen/view_dashbored.dart';
import '../screen/view_product.dart';

var allPage = [
  GetPage(name: '/onbroad', page: () => Onbroad(),
    transition: Transition.cupertino,
  ),
  GetPage(name: '/dashbored', page: () => ViewDashbored(),
    transition: Transition.cupertino,
  ),
  GetPage(name: '/NavBar', page: () => NavBar(),
    transition: Transition.cupertino,
  ),
  GetPage(name: '/product', page: () => ProductPage(),
    transition: Transition.cupertino,
  ),
  GetPage(name: '/order', page: () => OrderDetailsPage(),
    transition: Transition.cupertino,
  ),
  GetPage(name: '/pizza', page: () => PizzaHomePage(),
    transition: Transition.cupertino,
  ),
  GetPage(name: '/thanks', page: () => OrderCompletedScreen(),
    transition: Transition.cupertino,
  ),

];