import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_project/secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  String getData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getData,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 40.0,),
              TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter your text',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                ),
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () {
                  String enteredText = textEditingController.text;
                  print('Entered text: $enteredText');
                  SecureStorage().writeSecureData('qwerty', enteredText);
                },
                child: const Text('Store Data'),
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () async {
                  getData = await SecureStorage().readSecureData('qwerty');
                  setState(() {});
                },
                child: Text('Read Data'),
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () {
                  SecureStorage().deleteSecureData('qwerty');
                  getData = "Data Deleted";
                  setState(() {});
                },
                child: Text('Delete Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
