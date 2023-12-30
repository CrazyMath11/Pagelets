import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidgetList(),
    );
  }
}

class MyWidgetList extends StatefulWidget {
  @override
  _MyWidgetListState createState() => _MyWidgetListState();
}

class _MyWidgetListState extends State<MyWidgetList> {

  List components = [
    Future.delayed(Duration(seconds: 2), () {return Center(
      child: Container(
        height: 700,
        width: 800,

        margin: EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 10 ),
        decoration: BoxDecoration(
        ),
        child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Flag_of_Palestine.svg/1200px-Flag_of_Palestine.svg.png',fit: BoxFit.fill),
      ),
    );}),
    Future.delayed(Duration(seconds: 4), (){return Center(
      child: Container(

        child: Center(
          child: Text('This is palestine ',style: TextStyle(
            fontSize: 50,


          )),
        ),
      ),
    );}),
    Future.delayed(Duration(seconds: 6), () { return  Center(
      child: Container(
  margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
  child: Center(
  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/1/14/Dome_of_the_Rock1.jpg'),
  )),
    );}),
  ];

  @override
  Widget build(BuildContext context) {
    var hieght =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Pagelets Example ',style: TextStyle(
          fontSize: 50,
        color: Colors.black,
        fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,


      ),
      body: ListView.separated(
        itemCount: components.length,

        itemBuilder: (context, index) {
          return FutureBuilder(
            future: components[index],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data as Widget;
              } else {
                return Center(
                child: LoadingAnimationWidget.flickr(
                 size: 60, leftDotColor: Colors.red, rightDotColor: Colors.black,));
    };
              }

          );
        }, separatorBuilder: (BuildContext context, int index) {
         return SizedBox(height: 60,);
      },
      ),
    );
  }
}