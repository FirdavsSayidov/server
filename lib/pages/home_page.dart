import 'package:flutter/material.dart';

import 'package:server/services/https_services.dart';
import 'model/post_model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
    var post = Post(id: 1,title: 'PDP',body: 'Online',userId: 1);
    //_apiPostCreate(post);
  }


  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),

    });
  }
  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  /*void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) =>
    {
      print(response),
      _showResponse(response!),
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}