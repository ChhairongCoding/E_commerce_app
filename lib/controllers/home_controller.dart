import 'dart:async';

import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/models/review_model.dart';
import 'package:e_commerce_app/models/trending_model.dart';
import 'package:e_commerce_app/widgets/custom_detail_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedCategory = 'All'.obs;
  RxBool opendedFilter = false.obs;
  final RxInt setectedCateIndex = 1.obs;
  Rx<Product?> tempSelectedProduct = Rx<Product?>(null);

  final List<String> categories = [
    "All",
    "Kits",
    "Tshirt",
    "Shoes",
    "Accessories",
  ];

  RxMap<dynamic, dynamic> listDetail = {}.obs;
  List<Product> productList = [
    Product(
      id: UniqueKey().toString(),
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
      status: 'Popular',
    ),
    Product(
      id: UniqueKey().toString(),
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
      status: 'Popular',
    ),

    Product(
      id: UniqueKey().toString(),
      name: "F50 LEAGUE TURF BOOTS KIDS",
      price: 118.99,
      category: "Shoes",
      images: [
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754581800/Batch%2012/IF1374/IF1374_1_FOOTWEAR_Photography_Side_Lateral_Center_View_grey_vc6ztb.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754581803/Batch%2012/IF1374/IF1374_2_FOOTWEAR_Photography_Top_Portrait_View_grey_e3t99f.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754581804/Batch%2012/IF1374/IF1374_3_FOOTWEAR_Photography_Bottom_View_grey_lqnxba.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754581809/Batch%2012/IF1374/IF1374_5_FOOTWEAR_Photography_Front_Lateral_Top_View_grey_zrk7i9.jpg',
      ],
      sizes: ['38', '39', '40', '41', '42', '43', '44'],
      color: [Colors.purpleAccent],
      description:
          "Free the fast with the adidas F50. Created to unlock the full potential of your acceleration, movement and speed. Keeping you cool with a perforated tongue, the Fiberskin upper on these juniors' adidas League football boots shows off a Sprintgrid print on the forefoot. A lug rubber outsole adds responsiveness on artificial turf.",
      reviews: [Review(userName: "Tom", comment: "Looks great!", rating: 4.7)],
      status: 'New Arrival',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "F.C. Barcelona 2025/26 Match Away",
      price: 219.99,
      category: "Kits",
      images: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b0bece8c-ea9f-4d24-92f6-376a12e93c5e/FCB+M+NK+DFADV+JSY+SS+MATCH+AW.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dba5483f-d69d-4512-b83c-cf9b6cf651ef/FCB+M+NK+DFADV+JSY+SS+MATCH+AW.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ae4a5395-3259-48c3-a47a-0fdd0c4bb5d7/FCB+M+NK+DFADV+JSY+SS+MATCH+AW.png',
      ],
      sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      color: [Colors.yellowAccent],
      description:
          "Bring Mamba Mentality to match day. A celebration of Kobe's connection to the club, this authentic F.C. Barcelona Away shirt honours two icons whose legacies transcend sport.",
      reviews: [Review(userName: "Anna", comment: "Very comfy!", rating: 4.6)],
      status: 'Pupolar',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "Nike Club Elite",
      price: 78.99,
      category: "Accessories",
      images: [
        'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/15131214-c8ea-4806-ae2b-e17af7240b38/NK+CLUB+ELITE+-+FA24.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8762902f-a1f6-4876-aa84-bc80e1a97964/NK+CLUB+ELITE+-+FA24.png',
      ],
      sizes: ['5'],
      color: [Colors.white],
      description:
          "Get your next shot past the keeper with the Club Elite Football. Its moulded grooves disrupt airflow so the ball has a more stable flight through the air. Defenders beware: textured casing helps you maintain a consistent touch while your footwork dazzles.",
      reviews: [Review(userName: "Jake", comment: "Good fit!", rating: 4.5)],
      status: 'New Arrival',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "COPA PURE 2 CLUB FLEXIBLE GROUND BOOTS KIDS",
      price: 129.99,
      category: "Shoes",
      images: [
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754567113/Batch%2012/IG8737/IG8737_1_FOOTWEAR_Photography_Side_Lateral_Center_View_grey_zdshyr.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754567121/Batch%2012/IG8737/IG8737_5_FOOTWEAR_Photography_Front_Lateral_Top_View_grey_hylyqt.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754567116/Batch%2012/IG8737/IG8737_2_FOOTWEAR_Photography_Top_Portrait_View_grey_uxde2a.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754567130/Batch%2012/IG8737/IG8737_8_FOOTWEAR_Photography_Detail_View_2_grey_gnschy.jpg',
      ],

      sizes: ['38', '39', '40', '41', '42', '43', '44', '45'],
      color: [Colors.black],
      description:
          "From brain to boot, and back again. Connect with the ball on every level in adidas Copa Pure 2. The comfortable synthetic leather upper of these juniors' Club football boots displays iconic details to ensure you stand out on the field. Down below, a versatile outsole keeps you a class apart on a range of surfaces.",
      status: 'New Arrival',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "MANCHESTER UNITED 24/25 AWAY JERSEY",
      category: "Kits",
      price: 220.99,
      images: [
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754565453/Batch%2012/IU1390/IU1390_2_APPAREL_Photography_Front_Center_View_grey_oz0pal.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754565458/Batch%2012/IU1390/IU1390_4_APPAREL_On_Model_Standard_View_grey_xg7uro.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754565457/Batch%2012/IU1390/IU1390_6_APPAREL_On_Model_Back_View_grey_krxfrf.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1754565460/Batch%2012/IU1390/IU1390_5_APPAREL_On_Model_Front_View_grey_pusrcw.jpg',
      ],
      sizes: ['S', 'M', 'L', 'X', 'XL', 'XXL'],
      color: [Colors.blue],
      description:
          'With a bold design that nods to football culture, this adidas Manchester United jersey looks equally at home on and off the pitch. Silver details pop against an indigo base that also includes a subtle, repeating "M" monogram. The light blue graphic on that stylish polo collar pays tribute to the river on which Old Trafford sits. Moisture-managing AEROREADY keeps fans comfortable on away days.This product is made with 100% recycled materials. By reusing materials that have already been created, we help to reduce waste and our reliance on finite resources and reduce the footprint of the products we make.',
      status: 'Popular',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "ARSENAL 25/26 HOME JERSEY",
      category: "Kits",
      price: 199.99,
      images: [
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1750841599/Batch%2010/JI9517/JI9517_1_APPAREL_Photography_Front_Center_View_grey_z6nvze.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1750841604/Batch%2010/JI9517/JI9517_3_APPAREL_On_Model_Standard_View_grey_y731k1.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1751623014/batch%2011/JI9517/JI9517_4_APPAREL_On_Model_Back_View_grey_rrlle8.jpg',
        'https://res.cloudinary.com/dtc2q8arn/image/upload/v1750841598/Batch%2010/JI9517/JI9517_2_APPAREL_Photography_Back_Center_View_grey_wdlyfv.jpg',
      ],
      sizes: ['L', '2XL'],
      color: [Colors.red],
      description:
          "Red body. White sleeves. So far, so timeless. Look closely at this Arsenal home jersey from adidas, though, and you'll see club DNA flows beyond the colours. Repeated across the front and back, Gothic-style A's from a vintage team badge add a finishing touch that all fans will appreciate. Created for comfortable support, this football shirt comes with soft fabric and moisture-managing AEROREADY.",
      reviews: [
        Review(userName: 'User 1', rating: 4.5, comment: 'Great product!'),
        Review(
          userName: 'User 2',
          rating: 3.0,
          comment: 'Good quality, but could be better.',
        ),
      ],
      status: 'New Arrival',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "T-shirt Red Cruyff Barça",
      price: 39.99,
      category: "T-shirts",
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
      status: 'New arrival',
    ),

    Product(
      id: UniqueKey().toString(),
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
      status: 'Popular',
    ),
    Product(
      id: UniqueKey().toString(),
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
      status: 'Pupular',
    ),
    Product(
      id: UniqueKey().toString(),
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
      status: 'Pupular',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "Tee retro Spotify Camp Nou",
      price: 29.99,
      category: "Tshirt",
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
      status: 'Popular',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "Blaugrana charity bracelet",
      price: 9.99,
            category: "accessories",
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
      status: 'New arrival',
    ),
    Product(
      id: UniqueKey().toString(),
      name: "Hoodie Grey Panot Barça",
      price: 69.99,
      category: "Kits",
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
      status: 'Popular',
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

  final List<TrendingModel> trendings = [
    TrendingModel(
      image:
          "https://assets.goal.com/images/v3/bltef7443e8e22fd5a5/Manchester%20United%20Arsenal%20third%20kit%20.jpg",
    ),
    TrendingModel(
      image:
          "https://brand.assets.adidas.com/video/upload/f_auto,q_auto/if_w_gt_1920,w_1920/global_aclubs_away_realmadrid_football_fw25_launch_PDP_Banner_Hero_1_d_ea0c7aff4f.jpg",
    ),
    TrendingModel(
      image:
          "https://assets.goal.com/images/v3/blt62e2a3be8d1f81d2/Arsenal%20away%20kit%20.jpg?auto=webp&format=pjpg&width=3840&quality=60",
    ),
    TrendingModel(
      image:
          "https://static.nike.com/a/images/w_1920,c_limit,f_auto,q_auto/bff8dc7c-ff72-42e5-9b47-0a51ba7e2eba/image.jpg",
    ),
  ];

  final currentPromoPage = 0.obs;
  late PageController promoPageController;
  Timer? _promoTimer;
  final currentTrendingPage = 0.obs;
  late PageController trendingPageController;
  Timer? _trendingTimer;

  @override
  void onInit() {
    super.onInit();
    promoPageController = PageController(viewportFraction: 1.0);
    trendingPageController = PageController(viewportFraction: 1.0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startPromoAutoScroll();
      _startTrendingAutoScroll();
    });
  }

  void _startTrendingAutoScroll() {
    _trendingTimer?.cancel();
    _trendingTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!trendingPageController.hasClients) return;

      int nextPage = currentTrendingPage.value + 1;
      if (nextPage >= trendings.length) nextPage = 0;

      currentTrendingPage.value = nextPage;

      trendingPageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _startPromoAutoScroll() {
    _promoTimer?.cancel();
    _promoTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!promoPageController.hasClients) return;

      int nextPage = currentPromoPage.value + 1;
      if (nextPage >= promotions.length) nextPage = 0;

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
    _startPromoAutoScroll();
  }

  void onTrendingPageChanged(int index) {
    currentTrendingPage.value = index;
    _startTrendingAutoScroll();
  }

  @override
  void onClose() {
    _promoTimer?.cancel();
    _trendingTimer?.cancel();
    super.onClose();
  }
}
