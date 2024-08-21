import 'dart:convert';
import 'package:apifatching/switch_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SwitchButton(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${data}')),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        getApi();
        postApi({
          "name": "Sparkle Angel",
          "age": 3,
          "colour": "blue"}
          );
          setState(() {});
        }
      ),
    );
  }
  void postApi(Map<String,dynamic> id) async{
    var url = Uri.parse('https://crudcrud.com/api/76270376046444f6a6c0b2a35a86e7d4/unicorns');
     try {
    var response = await http.post(
      url,
      body: jsonEncode(id),
      headers: {'Content-Type': 'application/json'},
    );

    // Check if the request was successful
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    } else {
      print('Failed to post data. Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }

  }

  void getApi() async{
    var url = Uri.parse('https://crudcrud.com/api/76270376046444f6a6c0b2a35a86e7d4/unicorns');
     try {
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    for (var eachMap in responsebody) {
      data.add(eachMap);
    }
    // Check if the request was successful
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    } else {
      print('Failed to post data. Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }

  }
}
