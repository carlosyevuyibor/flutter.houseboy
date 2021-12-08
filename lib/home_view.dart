

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class MyHome extends StatefulWidget {
  const MyHome({ Key? key }): super(key: key);


@override
_MyHomeState createState()=> _MyHomeState();
}



class _MyHomeState extends State<MyHome> {
  List<String> imagesList =[
    'https://images.unsplash.com/photo-1638767306392-a30224cc2d6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1626718349853-c9430b2b9fdb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
    'https://images.unsplash.com/photo-1638726201802-bea9ae11bd00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    'https://images.unsplash.com/photo-1638727409337-456bdbdc5233?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
    'https://images.unsplash.com/photo-1633114128729-0a8dc13406b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1621844073603-02a81fca3bcc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',
    'https://images.unsplash.com/photo-1638633067372-8902ae92070a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
    'https://images.unsplash.com/photo-1638611584315-c1d6f2163c82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=414&q=80',
    'https://images.unsplash.com/photo-1638640730119-d7a307fdd053?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',
  ];

  get index => null;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        
           backgroundColor: Colors.transparent,
           elevation: 0,
           title: Text('Pinterest Clone'),
           leading: Icon(Icons.camera_alt),
           actions: [
             Icon(Icons.more_vert),
             Icon(Icons.search)
           ], 
             
      ),
      backgroundColor: Colors.pink,
   body: 
   SafeArea(
     child: Container(
       margin: EdgeInsets.all(12),
       child: StaggeredGridView.countBuilder(
         mainAxisSpacing: 8,
         crossAxisSpacing: 8,
         itemCount: imagesList.length,
         crossAxisCount: 2,
         itemBuilder:(context, index){
             return  InkWell(
               onTap: (){
                    showModalBottomSheet(context: context,
                     builder: (context)=>SizedBox(
                       height: MediaQuery.of(context).size.height,
                       width: MediaQuery.of(context).size.width,
                      child: Image.network(imagesList[index],
                      fit: BoxFit.cover,
                      ),
                     ),
                     );
               },
               child: Container(
                 decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                 ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)
                  ),
                  child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,
                   image: imagesList[index],
                   fit: BoxFit.cover,
                   ),
                ),
               ),
             );
         },
         staggeredTileBuilder:(index){
           return StaggeredTile.count(1, index.isOdd ? 1.2 : 1.8);
         },
       ),
     ),
   ),
    );
  }
  
}

