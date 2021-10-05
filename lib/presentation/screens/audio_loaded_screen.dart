import 'package:audio_bible_dramarized/data/constants.dart';
import 'package:audio_bible_dramarized/logics/providers.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioLoadedScreen extends StatelessWidget {
  final RssFeed rssFeed;
  AudioLoadedScreen(this.rssFeed);
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.asset("assets/images/placeholder_1.jpg",height: 200,width: double.infinity,fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 7),
            child: Text(rssFeed.description??"",style: TextStyle(color: isDark?Colors.white70:Colors.grey[600]),maxLines: 5,overflow: TextOverflow.ellipsis,),
          ),
          AudioCardList(items: rssFeed.items!.getRange(0, 28).toList(),title: "मत्तिको सुसमाचार",description: "Book of Matthew",nepNumber: "१.",),
          AudioCardList(items: rssFeed.items!.getRange(28, 44).toList(),title: "मर्कूसको पुस्तक",description: "Book of Mark",nepNumber: "२.",),
          AudioCardList(items: rssFeed.items!.getRange(44, 68).toList(),title: "लूकाले लेखेको सुसमाचार",description: "Book of Luke",nepNumber: "३.",),
          AudioCardList(items: rssFeed.items!.getRange(68, 89).toList(),title: "यूहन्नाको पुस्तक",description: "Book of John",nepNumber: "४.",),
          AudioCardList(items: rssFeed.items!.getRange(89, 117).toList(),title: "प्रेरित",description: "Book of Acts",nepNumber: "५.",),
          AudioCardList(items: rssFeed.items!.getRange(117, 133).toList(),title: "रोमी",description: "Book of Romans",nepNumber: "६.",),
          AudioCardList(items: rssFeed.items!.getRange(133, 149).toList(),title: "१ कोरिन्थी",description: "1 Corinthians",nepNumber: "७.",),
          AudioCardList(items: rssFeed.items!.getRange(149, 162).toList(),title: "२ कोरिन्थी",description: "2 Corinthians",nepNumber: "८.",),
          AudioCardList(items: rssFeed.items!.getRange(162, 168).toList(),title: "गलातीको पुस्तक",description: "Book of Galatians",nepNumber: "९.",),
          AudioCardList(items: rssFeed.items!.getRange(168, 174).toList(),title: "एफिसीको पुस्तक",description: "Book of Ephesians",nepNumber: "१०.",),
          AudioCardList(items: rssFeed.items!.getRange(174, 178).toList(),title: "फिलिप्पी",description: "Book of Philippians",nepNumber: "११.",),
          AudioCardList(items: rssFeed.items!.getRange(178, 182).toList(),title: "कलस्सी",description: "Book of Colossians",nepNumber: "१२.",),
          AudioCardList(items: rssFeed.items!.getRange(182, 187).toList(),title: "१ थेसलोनिकी",description: "1 Thessalonians",nepNumber: "१३.",),
          AudioCardList(items: rssFeed.items!.getRange(187, 190).toList(),title: "२ थेसलोनिकी",description: "2 Thessalonians",nepNumber: "१४.",),
          AudioCardList(items: rssFeed.items!.getRange(190, 196).toList(),title: "१ तिमोथी",description: "1 Timothy",nepNumber: "१५.",),
          AudioCardList(items: rssFeed.items!.getRange(196, 200).toList(),title: "२ तिमोथी",description: "2 Timothy",nepNumber: "१६.",),
          AudioCardList(items: rssFeed.items!.getRange(200, 203).toList(),title: "तीतस",description: "Book of Titus",nepNumber: "१७.",),
          AudioCardList(items: rssFeed.items!.getRange(203, 204).toList(),title: "फिलेमोन",description: "Book of Philemon",nepNumber: "१८.",),
          AudioCardList(items: rssFeed.items!.getRange(204, 217).toList(),title: "हिब्रूको पुस्तक",description: "Book of Hebrews",nepNumber: "१९.",),
          AudioCardList(items: rssFeed.items!.getRange(217, 222).toList(),title: "याकूबको पत्र",description: "Book of James",nepNumber: "२०.",),
          AudioCardList(items: rssFeed.items!.getRange(222, 227).toList(),title: "१ पत्रुस",description: "1 Peter",nepNumber: "२१.",),
          AudioCardList(items: rssFeed.items!.getRange(227, 230).toList(),title: "२ पत्रुस",description: "2 Peter",nepNumber: "२२.",),
          AudioCardList(items: rssFeed.items!.getRange(230, 235).toList(),title: "१ यूहन्ना",description: "1 John",nepNumber: "२३.",),
          AudioCardList(items: rssFeed.items!.getRange(235, 236).toList(),title: "२ यूहन्ना",description: "2 John",nepNumber: "२४.",),
          AudioCardList(items: rssFeed.items!.getRange(236, 237).toList(),title: "३ यूहन्ना",description: "3 John",nepNumber: "२५.",),
          AudioCardList(items: rssFeed.items!.getRange(237, 238).toList(),title: "यहूदा",description: "Book of Jude",nepNumber: "२६.",),
          AudioCardList(items: rssFeed.items!.getRange(238, 260).toList(),title: "प्रकाशको पुस्तक",description: "Book of Revelation",nepNumber: "२७.",),
        ],
      ),
    );
  }
}


class AudioCardList extends StatelessWidget {
  final List<RssItem> items;
  final String? title;
  final String? nepNumber;
  final String? description;

  AudioCardList({required this.items, this.title, this.description, this.nepNumber});

  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        initialPadding: const EdgeInsets.only(bottom: 7),
        initialElevation: 7,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        duration: Duration(milliseconds: 300),
        key: cardA,
        leading: Material(elevation:2,shape:CircleBorder(),child: CircleAvatar(backgroundColor:Theme.of(context).cardColor,child: Text(nepNumber??''),)),
        title: Text(title??'',style: TextStyle(fontWeight: FontWeight.w500),),
        subtitle: Text(description??'',style: TextStyle(color: Colors.grey[600],fontSize: 13),),
        children: <Widget>[
          Divider(thickness: 1.0, height: 1.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: items.length,
                primary: false,shrinkWrap: true,
                itemBuilder: (context,index){
                final audio = items[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: (){
                          // print(audio.link);
                          final currentModel = context.read(currentCategoryIndex).state;
                          Constants.startAudioPlayer(categoryModel: currentModel, items: items,index: index);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        dense: true,
                        title: Text(context.read(currentCategoryIndex).state.title=="Nepali"?audio.title?.substring(8,audio.title?.length)??'':audio.title??'',
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(audio.description??''),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(thickness: 1.0, height: 1.0),
                      ),
                    ],
                  );
                }),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            buttonHeight: 52.0,
            buttonMinWidth: 90.0,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  cardA.currentState?.collapse();
                },
                child: Column(
                  children: <Widget>[
                    Icon(CupertinoIcons.chevron_up),
                    Text('Close',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
