import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddress {
  final String name;
  final String phone;
  final String address;
  final String city;
  final String zip;
  final bool isDefault;

  ShippingAddress({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.zip,
    this.isDefault = false,
  });
}

class ShippingController extends GetxController {
  // Form controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  // List of saved addresses
  var shippingList = <ShippingAddress>[].obs;

  void addShipping(ShippingAddress address) {
    // If first entry, set default
    if (shippingList.isEmpty) {
      shippingList.add(
        ShippingAddress(
          name: address.name,
          phone: address.phone,
          address: address.address,
          city: address.city,
          zip: address.zip,
          isDefault: true,
        ),
      );
    } else {
      shippingList.add(address);
    }
  }

  void setDefaultShipping(int index) {
    for (int i = 0; i < shippingList.length; i++) {
      shippingList[i] = ShippingAddress(
        name: shippingList[i].name,
        phone: shippingList[i].phone,
        address: shippingList[i].address,
        city: shippingList[i].city,
        zip: shippingList[i].zip,
        isDefault: i == index,
      );
    }
  }

  void deleteShipping(int index) {
    shippingList.removeAt(index);
    Get.showSnackbar(GetSnackBar(message: "Shipping Address Deleted"));
  }

  void updateShipping(int index, ShippingAddress updatedAddress) {
    bool defaultStatus = shippingList[index].isDefault; // Keep default flag
    shippingList[index] = ShippingAddress(
      name: updatedAddress.name,
      phone: updatedAddress.phone,
      address: updatedAddress.address,
      city: updatedAddress.city,
      zip: updatedAddress.zip,
      isDefault: defaultStatus,
    );
  }

  void submitShipping({int? editIndex}) {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      Future.delayed(const Duration(seconds: 1), () {
        final newAddress = ShippingAddress(
          name: nameController.text,
          phone: phoneController.text,
          address: addressController.text,
          city: cityController.text,
          zip: zipController.text,
        );

        if (editIndex != null) {
          updateShipping(editIndex, newAddress);
        } else {
          addShipping(newAddress);
        }

        isLoading.value = false;
        Get.back(); 
        clearForm();
      });
    }
  }

  void clearForm() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    cityController.clear();
    zipController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipController.dispose();
    super.onClose();
  }
}
