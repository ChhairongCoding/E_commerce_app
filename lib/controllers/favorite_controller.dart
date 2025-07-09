import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxInt counter = 0.obs;
  RxList<RxMap<String, dynamic>> addToCartList = <RxMap<String, dynamic>>[].obs;
  List<Map<String, dynamic>> listFav = [
    {
      'image':
          "https://static.wixstatic.com/media/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png/v1/fill/w_480,h_480,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png",
      'name': 'Inter Milan 2024/25 Stadium Home Jersey',
      'rate': '4.5',
      'selled': '129',
      'price': '102',
    },
    {
      'image':
          "https://www.bestbuysoccer.com/cdn/shop/products/773361_01.png?v=1681923287",
      'name': 'PUMA AC Milan X Koche Authentic Jersey 23',
      'rate': '4.3',
      'selled': '229',
      'price': '92',
    },
    {
      'image':
          "https://static.wixstatic.com/media/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png/v1/fill/w_480,h_480,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png",
      'name': 'Inter Milan 2024/25 Stadium Home Jersey',
      'rate': '4.5',
      'selled': '129',
      'price': '102',
    },
    {
      'image':
          "https://www.bestbuysoccer.com/cdn/shop/products/773361_01.png?v=1681923287",
      'name': 'PUMA AC Milan X Koche Authentic Jersey 23',
      'rate': '4.3',
      'selled': '229',
      'price': '92',
    },
    {
      'image':
          "https://static.wixstatic.com/media/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png/v1/fill/w_480,h_480,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png",
      'name': 'Inter Milan 2024/25 Stadium Home Jersey',
      'rate': '4.5',
      'selled': '129',
      'price': '102',
    },
    {
      'image':
          "https://www.bestbuysoccer.com/cdn/shop/products/773361_01.png?v=1681923287",
      'name': 'PUMA AC Milan X Koche Authentic Jersey 23',
      'rate': '4.3',
      'selled': '229',
      'price': '92',
    },
    {
      'image':
          "https://static.wixstatic.com/media/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png/v1/fill/w_480,h_480,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/3f13d8_a9fbf853feb540bea02d8278f1dada61~mv2.png",
      'name': 'Inter Milan 2024/25 Stadium Home Jersey',
      'rate': '4.5',
      'selled': '129',
      'price': '102',
    },
    {
      'image':
          "https://www.bestbuysoccer.com/cdn/shop/products/773361_01.png?v=1681923287",
      'name': 'PUMA AC Milan X Koche Authentic Jersey 23',
      'rate': '4.3',
      'selled': '229',
      'price': '92',
    },
  ];

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }


  void addToCart(Map<String, dynamic> data) {
    addToCartList.add(data.obs);
    print(addToCartList);

  }
}
