import 'package:blockapi/models/model.dart';
import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key,  required this.e}) : super(key: key);
  final CustomerModel e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.green,
      title: const Text("User Details"),
      centerTitle: true,),
      body:Center(
        child:Padding(
          padding:const EdgeInsets.all(20.0),
          child:Column(
            children: [
              const Center(
                child:CircleAvatar(
                  maxRadius:60,
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2022/09/28/05/53/squirrel-7484292_960_720.jpg'),
                ),
              ),
              SizedBox(
                height: 200,
              width:200,
              child:Column(
                children:[
                Text(
                "Name: ${e.name}",
              ),
              Text(
                "Email: ${e.email}",
              ),
              Text(
                "Phone: ${e.phone}",
              ),
              Text(
                "Website: ${e.website}",
              ),

                ],
              ),
              ),
            ]
          )
        )
      )
    );
  }
}
