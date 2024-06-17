import 'package:flutter/material.dart';
import 'package:clevertap_plugin/clevertap_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CleverTap Web Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _identityController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final _productNameController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    CleverTapPlugin.init("886-85W-7Z7Z");

    // Enable Web Push
    var pushData = {
      'titleText': 'Would you like to receive Push Notifications?',
      'bodyText': 'We promise to only send you relevant content and give you updates on your transactions',
      'okButtonText': 'Ok',
      'rejectButtonText': 'Cancel',
      'okButtonColor': '#F28046',
      //'askAgainTimeInSeconds': 5,
      'serviceWorkerPath': '/service-worker-sw.js'
    };

    CleverTapPlugin.enableWebPush(pushData);
    
  }

  //OnUserLogin Method
  void onUserLogin() {
    var profile = {
      'Name': _nameController.text,
      'Email': _emailController.text,
      'Identity': _identityController.text,
      'Phone': _phoneNumberController.text,
    };
    CleverTapPlugin.onUserLogin(profile);
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _identityController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  //Custom Event
  void recordEvent(String productName, String category) {
    var eventData = {
      'Product Name': productName,
      'Category': category,
    };
    CleverTapPlugin.recordEvent('Product Viewed', eventData);
  }

  //Charged Event
  void recordChargedEvent() {
    var AC = {
      'Name': 'Godrej 1 Ton 5 Star',
      'Amount': '₹28,990'
    };
    var Refrigerator = {
      'Name': 'LG 242 L 5 Star Double Door Refrigerator',
      'Amount': '₹25,990'
    };
    var items = [AC, Refrigerator];
    var chargeDetails = {
      'Total Amount': '₹54,980',
      'Payment': 'Cash'
    };
    CleverTapPlugin.recordChargedEvent(chargeDetails, items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter CleverTap Web Integration',
        style: TextStyle(
                      color: Colors.red,
                      backgroundColor: Colors.white)
                      ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          image: DecorationImage(
            image: AssetImage(''),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20,),
              buildTextFormField(_nameController, 'Name', 'Please enter your name'),
              const SizedBox(height: 20),
              buildTextFormField(_emailController, 'Email', 'Please enter your email'),
              const SizedBox(height: 20),
              buildTextFormField(_identityController, 'Identity', 'Please enter your identity'),
              const SizedBox(height: 20),
              buildTextFormField(_phoneNumberController, 'Phone Number', 'Please enter your phone number'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onUserLogin,
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red), // Text color
                child: const Text('OnUserLogin'),
                
              ),
              const SizedBox(height: 20),
              buildTextFormField(_productNameController, 'Product Name', ''),
              const SizedBox(height: 20),
              buildTextFormField(_categoryController, 'Category', ''),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  recordEvent(
                    _productNameController.text,
                    _categoryController.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
              ),
                child: const Text('Custom Event'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: recordChargedEvent,
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
              ),
                child: const Text('Charged Event'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildTextFormField(TextEditingController controller, String labelText, String validationText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validationText;
          }
          return null;
        },
      ),
    );
  }
}