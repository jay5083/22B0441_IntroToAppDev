import 'package:flutter/material.dart';

void main() {
  runApp(BudgetTrackerApp());
}

class BudgetTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_circle_left_outlined,
          color: Colors.white,
          size: 32,
        ),
        title: Text(
          'Budget Tracker',
          style: TextStyle(
            fontSize: 35,
            color: Colors.limeAccent,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle_sharp,
                size: 200,
                color: Colors.black,
              ),
              SizedBox(height: 16),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpenseScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                ),
                label: Text(
                  'Total: 48700',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.arrow_circle_down_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Budget Tracker',
          style: TextStyle(
            fontSize: 35,
            color: Colors.limeAccent,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              label: Text(
                'Total: 48700',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                ),
              ),
              icon: Icon(Icons.attach_money),
            ),
            SizedBox(height: 16),
            buildExpenseItem('Groceries', 300),
            SizedBox(height: 16),
            buildExpenseItem('Bills', 1000),
            SizedBox(height: 16),
            buildExpenseItem('Salary', 50000),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String? category;
              double? amount;

              return AlertDialog(
                backgroundColor: Colors.deepPurple, // Set the background color to purple
                title: Center(
                  child: Text(
                    'New Entry', // Move "New Entry" text to the center
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Category'),
                      onChanged: (value) {
                        category = value;
                      },
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        amount = double.tryParse(value);
                      },
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (category != null && amount != null) {
                        // Perform the action here, such as adding the expense to the list
                        print('Category: $category');
                        print('Amount: $amount');
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Text(
          '+',
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 50,
          ),
        ),
        backgroundColor: Colors.white70,
      ),
    );
  }

  Widget buildExpenseItem(String category, double amount) {
    return InkWell(
      onTap: () {
        // Handle the delete action here
      },
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepPurpleAccent),
            ),
            child: Icon(Icons.attach_money),
          ),
          title: Row(
            children: [
              Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
              SizedBox(width: 8),
              Text(
                '$category = $amount',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
