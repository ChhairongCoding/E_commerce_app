import 'package:e_commerce_app/controllers/home_controller.dart';
import 'package:e_commerce_app/widgets/custom_promotion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome,",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Our Fashions App,",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.grey[700]),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 9,
                    child: SearchContainer(
                      text: "Search in Store...",
                      icon: HugeIcons.strokeRoundedSearch01,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        HugeIcons.strokeRoundedFilterHorizontal,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: [
                    CustomPromotionCard(
                      title: "50% Off",
                      title2: "On everything today",
                      code: "FSCREATION",
                      imageUrl:
                          "https://soccerpost.com/cdn/shop/files/AURORA_DX2614-101_PHSFM001-2000_clipped_rev_1.png?v=1695216765&width=1440",
                    ),
                    CustomPromotionCard(
                      title: "70% Off",
                      title2: "On everything today",
                      code: "FSCREATION",
                      imageUrl:
                          "https://static.nike.com/a/images/t_default/9b178226-99d4-4f77-8f00-ba2f5caa2325/zoom-mercurial-superfly-9-elite-km-fg-high-top-football-boot-RbvQKW.png",
                    ),
                    CustomPromotionCard(
                      title: "50% Off",
                      title2: "On everything today",
                      code: "FSCREATION",
                      imageUrl:
                          "https://soccerpost.com/cdn/shop/files/AURORA_DX2614-101_PHSFM001-2000_clipped_rev_1.png?v=1695216765&width=1440",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;
  // final  bool showBackground , showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: CustomSearch());
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          spacing: 16,
          children: [
            Icon(icon),
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate<String> {
  final List<String> suggestions = [
    'T-Shirt',
    'Jeans',
    'Shoes',
    'Jacket',
    'Dress',
    'Hat',
    'Sweater',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // clear the input
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // close search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text('You searched for: $query'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSuggestions = suggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () {
            query = filteredSuggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
