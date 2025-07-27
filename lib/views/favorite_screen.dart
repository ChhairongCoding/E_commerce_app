import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final RxString selectedTab = "all".obs; // add this

  final List<Map<String, dynamic>> favoriteItems = [
    {
      'name': 'PUMA AC Milan X Koche Authentic Jersey 23',
      'price': '\$59.00',
      'rating': "4.5",
      'reviews': "38",
      'image':
          'https://www.bestbuysoccer.com/cdn/shop/products/puma-ac-milan-x-koche-authentic-jersey-23-2085875.png?v=1752540342',
    },
    {
      'name': 'Inter Milan',
      'price': '\$79.00',
      'rating': "4.5",
      'reviews': "98",
      'image':
          'https://indiansoccermart.in/cdn/shop/files/67ab0dd9b92cd0a2baa3e65862ecd51a.png-z-0_0_f-webp.webp?v=1739417936',
    },
    {
      'name': 'Juventus Home Jersey 24/25',
      'price': '\$65.00',
      'rating': "4.2",
      'reviews': "45",
      'image':
          'https://soccerpost.com/cdn/shop/files/ScreenShot2024-07-30at8.04.31AM_clipped_rev_1.png?v=1722341143',
    },
    {
      'name': 'FC Barcelona Away Kit',
      'price': '\$70.00',
      'rating': "4.7",
      'reviews': "120",
      'image':
          'https://static.nike.com/a/images/w_1280,q_auto,f_auto/bf7eecbb-bd11-4edb-8bc5-73a69c3e1c1d/f-c-barcelona-2024-25-stadium-away-x-cactus-jack-men-s-nike-dri-fit-football-replica-shirt-iq8330-010-release-date.jpg',
    },
    {
      'name': 'Real Madrid Third Kit',
      'price': '\$75.00',
      'rating': "4.4",
      'reviews': "90",
      'image':
          'https://soccerpost.com/cdn/shop/files/ScreenShot2024-08-22at2.24.27PM_clipped_rev_1.png?v=1724351271',
    },
    {
      'name': 'Manchester United Kit',
      'price': '\$60.00',
      'rating': "4.3",
      'reviews': "75",
      'image':
          'https://cdn11.bigcommerce.com/s-bgbkv8f/images/stencil/1280x1280/products/14328/20171/H31447H31090_7e518add-1e57-456e-8764-8292bb231a2b_1024x1024__22139.1626668100.png?c=2?imbypass=on',
    },
    {
      'name': 'Bayern Munich Jersey',
      'price': '\$68.00',
      'rating': "4.6",
      'reviews': "60",
      'image':
          'https://goalkicksoccer.com/cdn/shop/files/adidas-mens-fc-bayern-20232024-home-jersey-ij7442-981423.png?v=1747946949',
    },
    {
      'name': 'PSG Home Kit',
      'price': '\$72.00',
      'rating': "4.5",
      'reviews': "85",
      'image':
          'https://footballcentral.co.nz/cdn/shop/files/AURORA_HJ4593-411_PHSFH001-3144_700x700.png?v=1749418292',
    },
    {
      'name': 'Chelsea FC Jersey',
      'price': '\$64.00',
      'rating': "4.1",
      'reviews': "50",
      'image':
          'https://worldofsoccer-us.com/cdn/shop/files/chelseahomefront_c73355c2-320e-453f-b14e-e532e8fbf7a7.png?v=1750998254',
    },
    {
      'name': 'Liverpool FC Kit',
      'price': '\$67.00',
      'rating': "4.8",
      'reviews': "110",
      'image':
          'https://gfx.r-gol.com/media/res/products/562/121562/795x1035/koszulka-new-balance-liverpool-fc-2018-19-domowa-mt830000rdp_1.png',
    },
  ];

  
  final List<Map<String, dynamic>> boardItems = [
      {
        'name': 'Board Item 1',
        'price': '\$30.00',
        'rating': "4.0",
        'reviews': "10",
        'image': 'https://via.placeholder.com/200x200.png?text=Board+1',
      },
      {
        'name': 'Board Item 2',
        'price': '\$40.00',
        'rating': "4.2",
        'reviews': "12",
        'image': 'https://via.placeholder.com/200x200.png?text=Board+2',
      },
    ];

    
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Obx(() {
            final itemsToShow = selectedTab.value == "all"
                ? favoriteItems
                : boardItems;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffFEF7FF),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => selectedTab.value = "all",
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            color: selectedTab.value == "all"
                                ? Colors.black
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "All Items",
                                style: TextStyle(
                                  color: selectedTab.value == "all"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => selectedTab.value = "board",
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            color: selectedTab.value == "board"
                                ? Colors.black
                                : Colors.transparent,
                            child: Center(
                              child: Text(
                                "Boards",
                                style: TextStyle(
                                  color: selectedTab.value == "board"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  runSpacing: 16.0,
                  children: List.generate(
                    itemsToShow.length,
                    (index) => CustomCardFavWidget(
                      imageUrl: itemsToShow[index]["image"],
                      name: itemsToShow[index]["name"],
                      price: itemsToShow[index]["price"],
                      reviews: itemsToShow[index]["reviews"],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CustomCardFavWidget extends StatelessWidget {
  const CustomCardFavWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.reviews,
  });
  final String imageUrl;
  final String name;
  final String price;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.pink, size: 24.0),
                ),
              ),
            ],
          ),

          Text(
            "AC Milian 25/26",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(price, style: Theme.of(context).textTheme.titleMedium),
          Row(
            children: [
              Row(
                children: List.generate(
                  4,
                  (index) => Icon(Icons.star, color: Colors.amber, size: 16),
                ),
              ),
              Text(
                "(#${reviews})",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
