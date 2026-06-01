// Exercise 4 : Bonus : Shop Management
class Address {
  final String city;
  final String street;
  final String country;
  Address(this.city, this.street, this.country);
}

// Product class
class Product {
  int productQuantity;
  String productName;
  double productPrice;
  Product({
    required this.productQuantity,
    required this.productName,
    required this.productPrice,
  });
}

// DeliveryMethod using enum
enum DeliveryMethod { delivery, pickup }

// Order class
class Order {
  List<Product> products = [];
  DeliveryMethod d_Method;
  Address? address;
  Order(this.products, this.address, this.d_Method);
  double getTotalAmount() {
    double total = 0;
    for (var prod in products) {
      total += (prod.productPrice * prod.productQuantity);
    }
    return total;
  }

  void printOrder() {
    if (d_Method == DeliveryMethod.pickup) {
      print("Deliver method: Pickup.");
    } else {
      print(
        "Deliver method : Delivery",
      );
    }
  }
}

// Customer class
class Customer {
  final String name;
  final String gmail;
  final String? phoneNum;
  List<Order> orders = [];
  Customer({required this.name, required this.gmail, this.phoneNum});

  void addOrders(Order order) {
    orders.add(order);
  }
}

void main() {
  // Address object
  Address add = Address("PP", "st 32", "Cambodia");
  Product pro1 = Product(
    productQuantity: 2,
    productName: "phone",
    productPrice: 50,
  );
  Product pro2 = Product(
    productQuantity: 1,
    productName: "Fridge",
    productPrice: 200,
  );
  Product pro3 = Product(
    productQuantity: 4,
    productName: "Bottle",
    productPrice: 10,
  );
  Order ord1 = Order([pro1, pro2], add, DeliveryMethod.pickup);
  Order ord2 = Order([pro3], add, DeliveryMethod.pickup);
  Customer cus = Customer(name: "sam", gmail: "chameoen@gmail.com");
  cus.addOrders(ord1);
  double price = ord1.getTotalAmount();
  print(
    "Customer: ${cus}\nAddress: ${add.city},${add.street},${add.country}\nProduct: ${[pro1.productName, pro2.productName]}\nTotal amount: ${price}",
  );
  ord1.printOrder();

  cus.addOrders(ord2);
  price = ord1.getTotalAmount() + ord2.getTotalAmount();
  print(
    "Customer: ${cus}\nAddress: ${add.city},${add.street},${add.country}\nProduct: ${[pro1.productName, pro2.productName,pro3.productName]}\nTotal amount: ${price}",
  );
  ord2.printOrder();
}
