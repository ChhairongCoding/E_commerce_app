import 'dart:async';

import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/models/review_model.dart';
import 'package:e_commerce_app/widgets/custom_detail_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedCategory = 'All'.obs;
  RxBool opendedFilter = false.obs;
  final RxInt setectedCateIndex = 1.obs;
  Rx<Product?> tempSelectedProduct = Rx<Product?>(null);

  RxMap<dynamic, dynamic> listDetail = {}.obs;
  List<Product> productList = [
    Product(
      name: "Tee retro Spotify Camp Nou",
      price: 29.99,
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048&width=1200',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description:
          "Retro-styled tee featuring the iconic Spotify Camp Nou design, perfect for true FC Barcelona fans.",
      reviews: [
        Review(
          userName: "Alex",
          comment: "Great fit and quality!",
          rating: 4.5,
        ),
        Review(
          userName: "Alex",
          comment: "Great fit and quality!",
          rating: 4.5,
        ),
        
        Review(userName: "Maria", comment: "Love the retro look!", rating: 5.0),
        Review(
          userName: "Alex",
          comment: "Great fit and quality!",
          rating: 4.5,
        ),
      ],
    ),
    Product(
      name: "Blaugrana charity bracelet",
      price: 9.99,
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/pulsera.jpg?v=1742558048&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/pulsera.jpg?v=1742558048&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/pulsera.jpg?v=1742558048&width=1200',
      ],
      sizes: ['S', 'M', 'L'],
      color: [Colors.blue, Colors.white],
      description:
          "Support a cause with this stylish Blaugrana bracelet made for Barcelona fans.",
      reviews: [
        Review(userName: "Leo", comment: "Nice gift for fans.", rating: 4.0),
      ],
    ),
    Product(
      name: "Hoodie Grey Panot Barça",
      price: 69.99,
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/FE70420023_3.jpg?v=1750945670&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/FE70420023_3.jpg?v=1750945670&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/FE70420023_3.jpg?v=1750945670&width=1200',
      ],
      sizes: ['M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description:
          "A warm and cozy hoodie in grey with subtle Panot Barça design accents.",
      reviews: [
        Review(
          userName: "Nina",
          comment: "Super warm and stylish!",
          rating: 4.8,
        ),
      ],
    ),
    Product(
      name: "T-shirt Red Cruyff Barça",
      price: 39.99,
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/Shot_02_0027.jpg?v=1749648616&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/Shot_02_0027.jpg?v=1749648616&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/Shot_02_0027.jpg?v=1749648616&width=1200',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description:
          "Classic red tee honoring Johan Cruyff and his impact on Barça legacy.",
      reviews: [
        Review(userName: "Dani", comment: "Perfect for matches!", rating: 4.6),
      ],
    ),
    Product(
      name: "1995-97 Home Kit",
      price: 129.99,
      category: "Kits",
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/IMG_6274.jpg?v=1737554507&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/IMG_6274.jpg?v=1737554507&width=1200',
        'https://store.fcbarcelona.com/cdn/shop/files/IMG_6274.jpg?v=1737554507&width=1200',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description:
          "Relive the golden era with the 1995-97 retro home kit, a must-have for collectors.",
      reviews: [
        Review(userName: "Sam", comment: "Feels like '90s again!", rating: 5.0),
      ],
    ),
    Product(
      name: "1995-97 Away Kit",
      price: 12.99,
      category: "Kits",
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description:
          "Classic away kit from the 1995-97 season. Iconic and nostalgic for long-time fans.",
      reviews: [
        Review(
          userName: "Liam",
          comment: "Good price and retro style.",
          rating: 4.3,
        ),
      ],
    ),
    Product(
      name: "Tshirt retro style",
      price: 12.99,
      category: "Tshirt",
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description:
          "Minimalist retro-style t-shirt representing Barça heritage with a modern twist.",
      reviews: [
        Review(userName: "Ella", comment: "Simple and cool.", rating: 4.0),
      ],
    ),
    Product(
      name: "Tshirt retro style",
      price: 12.99,
      category: "Tshirt",
      rate: "4.5",
      images: [
        'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description: "This is a local brand, created for barcelona fan.",
      reviews: [
        Review(
          userName: "Juan",
          comment: "Support local. Love it!",
          rating: 4.5,
        ),
      ],
    ),
    Product(
      name: "F50 Elite Firm Ground Boots",
      price: 220.99,
      category: "Shoes",
      images: [
        'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/0efd53c278f04a348f29ac8fbb7b5cd0_9366/F50_Elite_Firm_Ground_Boots_White_JH7617_HM1.jpg',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      color: [Colors.blue, Colors.white],
      description:
          "Top-tier firm ground boots built for speed, precision, and performance.",
      reviews: [
        Review(
          userName: "Chris",
          comment: "Best cleats I’ve owned.",
          rating: 5.0,
        ),
        Review(
          userName: "Zara",
          comment: "Super light and responsive.",
          rating: 4.9,
        ),
      ],
    ),
  ];

  List<Map<String, dynamic>> listProductSellers = [
    {
      'name': 'T-shirt 1899 Ecru "We are Culers"',
      'price': '\$39,99 EUR',
      'category': "t-shirt",
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/FE70420018_2.jpg?v=1750946149&width=1200',
    },
    {
      'name': "T-shirt Core Barça Ecru",
      'price': '\$9,99 EUR',
      'category': 't-shirt',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/BZ3A4240.jpg?v=1750065394&width=1200',
    },
    {
      'name': "Modernist FC Barcelona Polo - Oversize ",
      'price': '\$59,99 EUR ',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/BLMP898003_1_1d16cce7-d927-4e3a-8b0f-4a383ab21674.jpg?v=1741004818&width=1200',
    },
    {
      'name': "T-shirt Red Cruyff Barça ",
      'price': '\$39,99 EUR',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/Shot_02_0027.jpg?v=1749648616&width=1200',
    },
    {
      'name': "UCL Men's home jersey 25/26 FC Barcelona - Player's Edition",
      'price': "\$149,99 EUR",
      'category': 'Kits',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/Mainbannermobile.jpg?v=1751433997&width=1200',
    },
    {
      'name': "1995-97 Away Kit",
      'price': "\$12,99 EUR",
      'category': 'Kits',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "Tshirt retro style",
      'price': "\$12,99 EUR",
      'category': 'Tshirt',
      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "Tshirt retro style",
      'price': "\$12,99 EUR",
      'category': 'Tshirt',

      'image':
          'https://store.fcbarcelona.com/cdn/shop/files/CORE-II4082_391dac34-f71d-4453-acdc-51b48962fdaf.jpg?v=1740042048',
    },
    {
      'name': "F50 Elite Firm Ground Boots",
      'price': "\$220,99 EUR",
      'category': 'Shoes',
      'image':
          'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/0efd53c278f04a348f29ac8fbb7b5cd0_9366/F50_Elite_Firm_Ground_Boots_White_JH7617_HM1.jpg',
    },
  ];

  List<Product> get filteredProducts {
    if (selectedCategory.value == 'All') {
      return productList; // <-- use productList instead of listProduct
    }
    return productList
        .where((product) => product.category == selectedCategory.value)
        .toList();
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void tempProduct(Product product) {
    tempSelectedProduct.value = product;

    listDetail.value = {
      'name': product.name,
      'price': product.price,
      'images': product.images,
      'descrition': product.description,
      'reviews': product.reviews,
    };

    Get.to(() => CustomDetailProduct());
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

    // Start timer after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startPromoAutoScroll();
    });
  }

  void _startPromoAutoScroll() {
    _promoTimer?.cancel(); // cancel existing timer if any
    _promoTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!promoPageController.hasClients)
        return; // only animate if controller is alive

      int nextPage = currentPromoPage.value + 1;
      if (nextPage >= promotions.length) nextPage = 0;

      currentPromoPage.value = nextPage;

      // Animate safely
      promoPageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void onPromoPageChanged(int index) {
    currentPromoPage.value = index;
    _startPromoAutoScroll(); // restart the timer when user swipes manually
  }

  @override
  void onClose() {
    _promoTimer?.cancel(); // stop the timer
    promoPageController.dispose(); // dispose controller
    super.onClose();
  }
}
