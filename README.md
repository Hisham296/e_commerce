# Flutter Mini E-Commerce App

A small Flutter e-commerce application built as a technical assignment to demonstrate Flutter fundamentals, project structure, state management, navigation, form validation, and UI development.

## Features

* Mock email/password authentication
* Product listing using local mock data
* Product images, names, and prices
* Add products to cart
* Cart item quantity management
* Increase/decrease product quantity
* Remove products from cart
* Automatic cart total calculation
* Cart state persists while navigating between Home and Cart

## Approach

The application was intentionally kept small and focused on the required user flow:

**Login → Home → Cart**

No backend or real authentication service is used because the assignment allows mock authentication and local data.

Product data is stored locally as mock data, while the cart is managed in memory using Provider.

## Architecture

The project follows a simple layered structure:

```text
lib/
├── data/
│   └── mock_products.dart
├── models/
│   ├── product.dart
│   └── cart_item.dart
├── providers/
│   └── cart_provider.dart
├── screens/
│   ├── login_screen.dart
│   ├── home_screen.dart
│   └── cart_screen.dart
├── widgets/
│   ├── product_card.dart
│   └── cart_item.dart
└── main.dart

assets/
└── images/
```

### Why this structure?

The project separates responsibilities into different layers:

* **Models:** Define the application's data structures.
* **Data:** Contains the local mock product data.
* **Providers:** Manage application state such as the shopping cart.
* **Screens:** Represent the main application pages.
* **Widgets:** Contain reusable UI components.

This structure keeps the project organized and makes it easier to extend without making the code unnecessarily complex for a small application.

## State Management

The project uses **Provider** with `ChangeNotifier` for cart state management.

`CartProvider` is responsible for:

* Adding products
* Increasing quantities
* Decreasing quantities
* Removing products
* Calculating the total number of items
* Calculating the total cart price

The provider is placed above the main application screens, allowing both Home and Cart to access the same cart state.

For example:

```text
CartProvider
     │
     ├── Home Screen
     │      └── Add to Cart
     │
     └── Cart Screen
            ├── Increase Quantity
            ├── Decrease Quantity
            └── Remove Item
```

Provider was chosen because it is lightweight, simple to understand, and sufficient for the limited state requirements of this application.

## Main Application States

The application mainly handles the following states:

### Authentication

The user enters an email and password. The form validates the input before navigating to the Home screen.

Authentication is mocked because a real backend is not required for this assignment.

### Product List

The Home screen displays a collection of products loaded from local mock data.

### Cart

The cart can contain multiple products and keeps track of each product's quantity.

### Empty Cart

When no products are in the cart, the application displays an empty-cart state instead of the product list.

## Navigation

Flutter's built-in `Navigator` is used for navigation between screens.

The main flow is:

```text
LoginScreen
     ↓
HomeScreen
     ↓
CartScreen
```

`pushReplacement` is used after login so that the user does not return to the login screen when navigating back from the Home screen.

## Technical Decisions

### Mock Authentication

A real authentication backend was not implemented because it is outside the scope of the assignment.

### Local Product Data

Products are stored in a local Dart file instead of using an API or database. This keeps the application simple and focused on the required functionality.

### Provider

Provider was selected for state management because the main shared state is the shopping cart, and the application does not require a more complex state management solution.

### Reusable Widgets

Product cards and cart items are separated into reusable widgets to keep the screen files cleaner and make the UI components easier to maintain.

## Challenges

One of the main challenges was keeping the cart state synchronized between the Home and Cart screens.

This was handled by placing `CartProvider` above the application screens and using `ChangeNotifier` to notify the UI whenever the cart changes.

Another consideration was keeping the project simple while still maintaining a clear structure. The architecture was therefore kept lightweight instead of introducing unnecessary layers or packages.

## Production Improvements

If this application were developed for production, I would consider adding:

* Real authentication and user accounts
* Backend API integration
* Remote product data
* Persistent cart storage
* Product details screen
* Search and filtering
* Checkout and payment integration
* Order history
* Error handling and loading states
* Unit and widget tests
* Dependency injection
* Secure authentication and token management

## Dependencies

The project uses a minimal number of dependencies.

### Main Dependency

* `provider` — State management for the shopping cart.

Other functionality uses Flutter's built-in libraries and widgets.

## Conclusion

This project demonstrates a simple Flutter e-commerce flow while keeping the implementation focused on the assignment requirements.

The application uses local mock data, Provider for shared cart state, reusable widgets, and a simple layered project structure to keep the code readable and maintainable.
