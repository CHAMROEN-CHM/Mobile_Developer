// Exercise 2 : Bank System

class BankAccount {
  int id;
  String name;
  double _balance = 0;
  // method to check the duplicated id
  BankAccount({required this.id, required this.name});
  double get balance => _balance; // print the balance

  // methods
  void credit(double amount) {
    if (amount <= 0) {
      throw Exception(
        "Your amount: ${amount} must be greater then 0. Can't credit.",
      );
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (balance <= 0) {
      throw Exception("Can't Withdraw Your current balance is : ${balance}");
    }
    if (_balance < amount) {
      throw Exception(
        "Not Enough balance.Current balance: ${balance} Try Again.",
      );
    }
    _balance -= amount;
  }
}

class Bank {
  // list of the accounts
  List<BankAccount> bankAccount = [];
  String name;
  // constructor
  Bank({required this.name});

  BankAccount createAccount(int accountID, String accountOwner) {
    for (var i in bankAccount) {
      if (i.id == accountID) {
        throw Exception("This account ID is existed use other ID.");
      }
    }

    // create object for BankAccount class and add it to the list
    BankAccount newAccount = BankAccount(id: accountID, name: accountOwner);
    bankAccount.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
