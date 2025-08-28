import 'package:e_commerce_app/controllers/shipping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void newShippingBottomSheet(
  BuildContext context,
  ShippingController controller, {
  int? editIndex,
}) {
  Get.bottomSheet(
    SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: Colors.white,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                editIndex != null ? "Edit Shipping Address" : "New Shipping Address",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildTextField(controller.nameController, "Full Name"),
              const SizedBox(height: 12),
              _buildTextField(controller.phoneController, "Phone", keyboardType: TextInputType.phone),
              const SizedBox(height: 12),
              _buildTextField(controller.addressController, "Address"),
              const SizedBox(height: 12),
              _buildTextField(controller.cityController, "City"),
              const SizedBox(height: 12),
              _buildTextField(controller.zipController, "Zip Code", keyboardType: TextInputType.number),
              const SizedBox(height: 30),
              Obx(() => ElevatedButton(

                    onPressed: controller.isLoading.value
                        ? null
                        : () => controller.submitShipping(editIndex: editIndex),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : Text(
                            editIndex != null ? "Update Address" : "Save Address",
                            style: const TextStyle(fontSize: 16,color: Colors.white),
                          ),
                  )),
            ],
          ),
        ),
      ),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}

Widget _buildTextField(
  TextEditingController controller,
  String label, {
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    validator: (val) => val!.isEmpty ? "Required" : null,
  );
}
