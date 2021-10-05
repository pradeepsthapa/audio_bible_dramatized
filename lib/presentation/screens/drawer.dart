import 'package:audio_bible_dramarized/logics/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = context.read(themeStateProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/matthew.jpg'),fit: BoxFit.cover)
            ),
            accountName: Text('Audio Bible Dramatized'),
            accountEmail: Text('pradeepsthapa@gmail.com',style: TextStyle(fontSize: 12,color: Colors.grey[200]),),),
          ExpansionTile(
            leading: Icon(Icons.palette_rounded),
            title: Text("Color",style: TextStyle(fontSize: 14),),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 12),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: theme.primaries.map((e) =>
                        InkWell(
                          borderRadius: BorderRadius.circular(5),
                          splashFactory: InkRipple.splashFactory,
                          onTap: ()=>theme.changeColor(colorIndex: theme.primaries.indexOf(e)),
                          child: Container(
                            padding: EdgeInsets.all(1),
                            height: 24,width: 24,
                            decoration:BoxDecoration(
                                shape: BoxShape.circle,
                                border: theme.currentColor==theme.primaries.indexOf(e)?Border.all(width: 2,color: e):null),
                            child: CircleAvatar(backgroundColor: e, radius: 15,),),
                        )).toList()),
              )],
          ),
          ListTile(
            dense: true,
            leading:Icon(CupertinoIcons.sun_min),
            title: Text("Dark Mode"),
            trailing:Consumer(
                builder: (context,watch, child) {
                  return Switch(
                    value: watch(themeStateProvider).isDark,
                    onChanged: (bool value) {
                      theme.toggleDarkMode();
                    },);
                }
            ),

          ),

          ListTile(leading: Icon(Icons.share),
            dense: true,
            title: Text("Share"),
            onTap: ()=>share(context),
          ),
          ListTile(leading: Icon(Icons.person_add_alt),
            dense: true,
            title: Text('About App'),
            onTap: (){
             customDialog(context);
            },
          ),

          ListTile(
            dense: true,
            leading: Icon(Icons.apps),
            title: Text("More Apps"),
            onTap: ()async{
              const url = 'https://play.google.com/store/apps/developer?id=pTech';
              if(await canLaunch(url)){
                await launch(url);
              }
              else{
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(leading: Icon(Icons.login_rounded),
            dense: true,
            title: Text("Exit"),
            onTap: ()=>SystemNavigator.pop(),
          ),
        ],

      ),
    );
  }

  void customDialog(BuildContext context) {
    showGeneralDialog(context: context,
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.black45,
        transitionDuration: Duration(milliseconds: 240),
        pageBuilder: (context,a1,a2){
          return AlertDialog(
            content: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Info here"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text('pradeepsthapa@gmail.com',style: TextStyle(color: Colors.grey[500],fontSize: 15),),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Close")),
            ],
          );
        });
  }
    void share(BuildContext context) {
      final String text = 'https://play.google.com/store/apps/details?id=com.ccbc.andrew_wommack';
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      Share.share(text,sharePositionOrigin: renderBox.localToGlobal(Offset.zero)&renderBox.size);
    }
}
