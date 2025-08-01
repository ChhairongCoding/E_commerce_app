import 'package:e_commerce_app/views/shipping_view/shipping_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewShippingBottomSheet extends StatelessWidget {
  const NewShippingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shipping")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => newShippingBottomSheet(context),
          child: Text("Open Shipping Bottom Sheet"),
        ),
      ),
    );
  }
}

void newShippingBottomSheet(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.90,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Shipping",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),

            // Add more fields here
            Form(
              key: formKey, // ← Correct placement here
              child: Column(
                children: [
                  ShippingTextForm(
                    hintText: "First name",
                    controller: firstNameController,
                  ),
                  ShippingTextForm(
                    hintText: "Last name",
                    controller: lastNameController,
                  ),
                  ShippingTextForm(
                    hintText: "City",
                    controller: cityController,
                  ),
                  ShippingTextForm(
                    hintText: "Province",
                    controller: provinceController,
                  ),
                  ShippingTextForm(
                    hintText: "Phone number",
                    controller: phoneNumberController,
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                backgroundColor: Colors.black
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text(
                "Add shipping",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
    isDismissible: false,
    enableDrag: true,
    isScrollControlled: true,
  );
}
