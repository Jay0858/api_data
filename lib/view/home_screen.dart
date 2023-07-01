import 'dart:convert';

import 'package:api_data/model/user_model.dart';
import 'package:api_data/res/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();

  List<UserModelList> userModelList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            IconButton(
              onPressed: () => getUserData(),
              icon: Icon(Icons.get_app),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: userModelList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {},
            title: Text(userModelList[index].name ?? ""),
            subtitle: Text(userModelList[index].email ?? ""),
            leading: Text(userModelList[index].id.toString()),
          ),
        ));
  }

  getUserData() async {
    Response response;

    response = await dio.get(
      '${Constant.baseUrl}/users',
    );
    debugPrint(response.data.toString());
    userModelList = userModelListFromJson(jsonEncode(response.data));
    setState(() {});
    debugPrint("userModelList -------------> ${userModelList[0].name}");
  }
}
