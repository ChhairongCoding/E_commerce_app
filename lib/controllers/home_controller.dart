import 'dart:async';

import 'package:e_commerce_app/widgets/custom_detail_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedCategory = 'All'.obs;

  RxMap<dynamic, dynamic> listDetail = {}.obs;
  List<Map<String, dynamic>> listProduct = [
    {
      'name': "Tee retro Spotify Camp Nou ",
      'price': '€29,99 EUR',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048&width=1200',
    },
    {
      'name': "Blaugrana charity bracelet",
      'price': '€9,99 EUR',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/pulsera.jpg?v=1742558048&width=1200',
    },
    {
      'name': "Hoodie Grey Panot Barça ",
      'price': '€69,99 EUR',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/FE70420023_3.jpg?v=1750945670&width=1200',
    },
    {
      'name': "T-shirt Red Cruyff Barça ",
      'price': '€39,99 EUR',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/Shot_02_0027.jpg?v=1749648616&width=1200',
    },
    {
      'name': "1995-97 Home Kit",
      'price': "€129,99 EUR",
      'category': 'Kits',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/IMG_6274.jpg?v=1737554507&width=1200',
    },
    {
      'name': "1995-97 Away Kit",
      'price': "€12,99 EUR",
      'category': 'Kits',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "Tshirt retro style",
      'price': "€12,99 EUR",
      'category': 'Tshirt',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "Tshirt retro style",
      'price': "€12,99 EUR",
      'category': 'Tshirt',
      'descrition': "This is a local brand, created for barcelona fan.",
      'rate': "4.5",
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "F50 Elite Firm Ground Boots",
      'price': "€220,99 EUR",
      'category': 'Shoes',
      'image':
          'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/0efd53c278f04a348f29ac8fbb7b5cd0_9366/F50_Elite_Firm_Ground_Boots_White_JH7617_HM1.jpg',
    },
  ];

  List<Map<String, dynamic>> listProductSellers = [
    {
      'name': 'T-shirt 1899 Ecru "We are Culers"',
      'price': '€39,99 EUR',
      'category': "t-shirt",
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/FE70420018_2.jpg?v=1750946149&width=1200',
    },
    {
      'name': "T-shirt Core Barça Ecru",
      'price': '€9,99 EUR',
      'category': 't-shirt',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/BZ3A4240.jpg?v=1750065394&width=1200',
    },
    {
      'name': "Modernist FC Barcelona Polo - Oversize ",
      'price': '€59,99 EUR ',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/BLMP898003_1_1d16cce7-d927-4e3a-8b0f-4a383ab21674.jpg?v=1741004818&width=1200',
    },
    {
      'name': "T-shirt Red Cruyff Barça ",
      'price': '€39,99 EUR',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/Shot_02_0027.jpg?v=1749648616&width=1200',
    },
    {
      'name': "UCL Men's home jersey 25/26 FC Barcelona - Player's Edition",
      'price': "€149,99 EUR",
      'category': 'Kits',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/Mainbannermobile.jpg?v=1751433997&width=1200',
    },
    {
      'name': "1995-97 Away Kit",
      'price': "€12,99 EUR",
      'category': 'Kits',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "Tshirt retro style",
      'price': "€12,99 EUR",
      'category': 'Tshirt',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "Tshirt retro style",
      'price': "€12,99 EUR",
      'category': 'Tshirt',

      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "F50 Elite Firm Ground Boots",
      'price': "€220,99 EUR",
      'category': 'Shoes',
      'image':
          'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/0efd53c278f04a348f29ac8fbb7b5cd0_9366/F50_Elite_Firm_Ground_Boots_White_JH7617_HM1.jpg',
    },
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory.value == 'All') {
      return listProduct;
    }
    return listProduct
        .where((item) => item['category'] == selectedCategory.value)
        .toList();
  }


  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void tempProduct(Map<String, dynamic> product) {
    listDetail.addAll(product);
    Get.to(CustomDetailProduct());
  }

  final promotions = [
    {
      'title': "50% Off",
      'title2': "On everything today",
      'code': "FSCREATION",
      'imageUrl':
          "https://soccerpost.com/cdn/shop/files/AURORA_DX2614-101_PHSFM001-2000_clipped_rev_1.png?v=1695216765&width=1440",
    },
    {
      'title': "70% Off",
      'title2': "On everything today",
      'code': "FSCREATION",
      'imageUrl':
          "https://static.nike.com/a/images/t_default/9b178226-99d4-4f77-8f00-ba2f5caa2325/zoom-mercurial-superfly-9-elite-km-fg-high-top-football-boot-RbvQKW.png",
    },
    {
      'title': "50% Off",
      'title2': "On everything today",
      'code': "FSCREATION",
      'imageUrl':
          "https://soccerpost.com/cdn/shop/files/AURORA_DX2614-101_PHSFM001-2000_clipped_rev_1.png?v=1695216765&width=1440",
    },
  ];

  final currentPromoPage = 0.obs;
  late PageController promoPageController;
  Timer? _promoTimer;

  @override
  void onInit() {
    super.onInit();
    promoPageController = PageController(viewportFraction: 1.0);

    // Delay starting timer until after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startPromoAutoScroll();
    });
  }

  void _startPromoAutoScroll() {
    _promoTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!promoPageController.hasClients) return;

      int nextPage = currentPromoPage.value + 1;
      if (nextPage >= promotions.length) {
        nextPage = 0;
      }
      currentPromoPage.value = nextPage;
      promoPageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void onPromoPageChanged(int index) {
    currentPromoPage.value = index;
    _promoTimer?.cancel();
    _startPromoAutoScroll();
  }

  @override
  void onClose() {
    _promoTimer?.cancel();
    promoPageController.dispose();
    super.onClose();
  }
}
