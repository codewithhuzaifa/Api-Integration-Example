import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/models/postmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Postmodel> postlist =
      []; //agr api [ start h rahi hai aur end ] hw rahi hai, mtlb list hai jb custom list banani paregi.
  Future<List<Postmodel>> getpostapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      //  postlist.clear();
      for (Map i in data) {
        postlist.add(Postmodel.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getpostapi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Loading');
                } else {
                  return ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index) {
                      //return Text(index.toString());
                      //return Text(postlist[index].title.toString());
                      return Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(postlist[index].id.toString()),
                          Text(postlist[index].title.toString()),
                          Text(postlist[index].body.toString()),
                        ],
                      ));
                    },
                  );
                }
              },
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
