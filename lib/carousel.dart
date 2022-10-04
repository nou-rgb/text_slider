import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

  class DestinationCarousel extends StatefulWidget{
    const DestinationCarousel({required key}) : super( key: key);


    @override 
    // ignore: library_private_types_in_public_api
    _DestinationCarouselState createState()=> _DestinationCarouselState();
  }


  class _DestinationCarouselState extends State <DestinationCarousel> {

    int _current = 0;
    final List<String>images=[
'assets/images/1.jpg',
 'assets/images/2.jpg',
 'assets/images/3.jpg',
 'assets/images/4.jpg',
 'assets/images/5.jpg',
    ];
    final List<String> places= [
      'PORT',
      'HAUTE MER',
      'CHARGEMENT',
      'ACCOSTAGE',
      'VUE AERIENNE'  

    ];

    List<Widget> generateImagesTiles(){
      return images.map((element )=>ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child:Image.asset(element,
        fit:BoxFit.cover,),
      ),).toList();
    }
    @override
    Widget build(BuildContext context){  
      return Container(
         color:Colors.white,
         padding:const EdgeInsets.only(top:50),
         child: Stack(
          children: [
            CarouselSlider(items:generateImagesTiles(), 
            options:CarouselOptions(
              
              enlargeCenterPage: true,
              autoPlay: true,
              //aspectRatio: 18/8,
              onPageChanged: (index, other) {
                setState(() {
                  _current=index;
                });
              } 


            ),),
            AspectRatio(aspectRatio:18/8,
            child: Center(
              child: Text(places[_current]
                , style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.amber,
                  fontSize:MediaQuery.of(context).size.width/15
                  ),
                  ),
            ),),
          ],),
          
      );
    }
  }