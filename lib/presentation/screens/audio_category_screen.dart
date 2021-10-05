// import 'package:audio_bible_dramarized/data/category_model.dart';
// import 'package:audio_bible_dramarized/data/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'audio_details.dart';
//
// class FeedCategory extends StatelessWidget {
//
//   final List<CategoryModel> allCategory = Constants.audioCategories;
//
//   @override
//   Widget build(BuildContext context) {
//     return StaggeredGridView.countBuilder(
//       crossAxisCount: 4,
//       itemCount: allCategory.length,
//       itemBuilder: (BuildContext context, int index) {
//         final item = allCategory[index];
//         return Card(
//           margin: EdgeInsets.zero,
//           elevation: 5,
//           shadowColor: Colors.black45,
//           child: InkWell(
//             borderRadius: BorderRadius.circular(5),
//             splashFactory: InkRipple.splashFactory,
//             onTap: (){
//               Navigator.push(context, PageRouteBuilder(
//                   transitionDuration: Duration(milliseconds: 700),
//                   transitionsBuilder: (context,a1,a2,child){
//                     return FadeTransition(
//                       opacity: a1,
//                       child: child,
//                     );
//                   },
//                   pageBuilder: (context,  a1, a2) {
//                     return AudioDetails(item);
//                   }));
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(7.0),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
//                     child: Container(
//                       height: 150,color: Colors.greenAccent,
//                     ),
//                   ),
//                   Center(child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
//                     child: Text(item.title??'',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
//                   )),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//                     child: Text(item.description??'',style: TextStyle(fontSize: 12,),maxLines: 7,overflow: TextOverflow.ellipsis,),
//                   ),
//                 ],),
//             ),
//           ),
//         );
//       },
//       staggeredTileBuilder: (int index) {
//         return StaggeredTile.fit(2);
//       },
//       mainAxisSpacing: 7.0,
//       crossAxisSpacing: 7.0,
//     );
//   }
// }