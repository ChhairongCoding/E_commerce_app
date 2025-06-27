# 📱 E-Commerce App (Customer Side)

A Flutter-based mobile application designed for users to browse and shop products. This app connects with the `e_commerce_admin_app` backend to display dynamic data, such as products, categories, brands, and more. Built with **GetX** for state management, routing, and dependency injection, the app delivers a fast and reactive shopping experience.

## 🚀 Features

- 🔐 User Authentication (Login/Register)
- 🛍️ Browse Products by Category & Brand
- 🧺 Add to Cart Functionality
- 📦 View Product Details
- 🔄 Realtime State Management with GetX
- 🔗 Connected with `e_commerce_admin_app` for:
  - Dynamic Product Listing
  - Brand & Category Management
  - Image & Data Sync via API

## 🛠️ Tech Stack

- **Flutter** (Frontend UI Framework)
- **GetX** (Routing, State Management, Dependency Injection)
- **Dart** (Programming Language)
- **HTTP** (API communication)
- **e_commerce_admin_app** (Admin Dashboard - Backend & API provider)


## 🔌 How It Works

- The admin creates and manages product data from the `e_commerce_admin_app`.
- This app fetches that data through REST APIs.
- GetX is used to:
  - Manage state reactively (e.g., cart updates, login status)
  - Navigate between screens without boilerplate
  - Inject dependencies across the app
