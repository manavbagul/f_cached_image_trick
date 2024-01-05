import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  final imageUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYscfUBUbqwGd_DHVhG-ZjCOD7MUpxp4uhNe7toUg4ug&s";

  const MyApp({super.key});

  @override
  Widget build(BuildContext Context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CACHED IMAGE EXAMPLE',
      home: Scaffold(
        appBar: AppBar(
          title: Text('HELLO'),

        ),
        body: Container(
          child: Column(
            children: [
              Text('Image'),
              Image.network(
                  imageUrl,
                width: 200,
                height: 200
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl)
                  )
                ),
              ),
            Text('2'),
              Center(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  imageBuilder: (context, imageProvider){
                    return Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill
                        )
                      ),
                    );
                  },
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}

