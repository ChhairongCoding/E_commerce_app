import 'package:get/get.dart';

class ShopController extends GetxController {
  RxInt selectedIndex = (-1).obs; // -1 means no item is expanded

  List<Map<String, dynamic>> listCate = [
    {
      'name': 'Shoes',
      'imageUrl':
          'https://www.rebelsport.com.au/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dwf19506fd/hof/250430-HPLP-Football-3D-Nike-SuperflyMbappe.png',
    },
    {
      'name': 'Collection',
      'imageUrl':
          'https://www.indianultras.com/cdn/shop/files/CelticAmazon.png?v=1739370085&width=550',
    },
    {
      'name':'Accessories',
      'imageUrl':'https://static.vecteezy.com/system/resources/thumbnails/023/477/419/small_2x/ai-generative-collection-of-sports-equipment-commonly-sold-at-a-supermarket-circle-label-for-a-sports-goods-free-png.png',
    }
  ];

  List<Map<String, List<String>>> listCateItem = [
    {
      'Shoes': ['Running', 'Soccer', 'Sneaker', 'Basketball'],
      'Collection': ['Copa', 'F50', 'Superstar', 'Sportswear','Copa', 'F50', 'Superstar', 'Sportswear'],
    },
  ];
}
