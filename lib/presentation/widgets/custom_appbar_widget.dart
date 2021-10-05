import 'package:audio_bible_dramarized/data/category_model.dart';
import 'package:audio_bible_dramarized/data/constants.dart';
import 'package:audio_bible_dramarized/logics/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Consumer(
        builder: (context,watch, child) {
          final catIndex = watch(currentCategoryIndex).state;
          return Row(
            children: [
              DropdownButton<CategoryModel>(
                iconEnabledColor: Colors.white,
                  elevation: 0,
                  value: catIndex,
                  dropdownColor:Theme.of(context).primaryColor,
                  hint: Text(catIndex.title??'',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  style: TextStyle(color: Colors.white),
                  underline: Container(),
                  onChanged: (CategoryModel? item){
                    context.read(currentCategoryIndex).state = item!;
                  },
                  items:Constants.audioCategories.map((e) => DropdownMenuItem<CategoryModel>(
                      value: e,
                      child: Text(e.title??'',style: TextStyle(fontSize: 17),))).toList()),
              SizedBox(width: 24,),
              Text("नाटकीय बाइबल"),

            ],
          );
        }
      ),
    );
  }
}
