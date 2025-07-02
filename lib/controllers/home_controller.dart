import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString selectedCategory = 'All'.obs;
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
      'Price': '€69,99 EUR',
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
      'category':'t-shirt',
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
}
