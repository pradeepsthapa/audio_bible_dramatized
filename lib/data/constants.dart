import 'package:audio_bible_dramarized/audio/audio_task.dart';
import 'package:audio_bible_dramarized/data/category_model.dart';
import 'package:audio_service/audio_service.dart';
import 'package:webfeed/domain/rss_item.dart';

class Constants {
static const String DARK_MODE = "darkMode";
static const String colorIndex = "colorIndex";


static const List<CategoryModel> audioCategories = [
  const CategoryModel(id:1,title:"Nepali", description:"Nepali Dramatized Audio Bible", image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL05FUE5SVk4yREEvQXJ0LzE2MDB4MTYwMC9ORVBOUlZOMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D", url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/N2NEPNRV.xml"),
  const CategoryModel(id:2,title:"Newari",description:"Newari Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL05FV05CU04yREEvQXJ0LzE2MDB4MTYwMC9ORVdOQlNOMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/N2NEWNBS.xml"),
  const CategoryModel(id:3,title:"Sherpa",description:"Sherpa Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL1hTUldCVE4yREEvQXJ0LzE2MDB4MTYwMC9YU1JXQlROMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/XSRWBTN2DA.xml"),
  const CategoryModel(id:4,title:"Limbu",description:"Limbu Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL0xJRldCVE4yREEvQXJ0LzE2MDB4MTYwMC9MSUZXQlROMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/N2LIFWBT.xml"),
  const CategoryModel(id:5,title:"Tamang",description:"Tamang Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL1RBSldCVE4yREEvQXJ0LzE2MDB4MTYwMC9UQUpXQlROMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/TAJWBTN2DA.xml"),
  const CategoryModel(id:6,title:"Tharu",description:"Tharu Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL1RITFdZSU4yREEvQXJ0LzE2MDB4MTYwMC9USExXWUlOMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/THLWYIN2DA.xml"),
  const CategoryModel(id:7,title:"Sunuwar",description:"Sunuwar Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL1NVWldCVE4yREEvQXJ0LzE2MDB4MTYwMC9TVVpXQlROMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/SUZWBTN2DA.xml"),
  const CategoryModel(id:8,title:"Sampang",description:"Sampang Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL1JBVk5MUE4yREEvQXJ0LzE2MDB4MTYwMC9SQVZOTFBOMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/RAVNLPN2DA.xml"),
  const CategoryModel(id:9,title:"Rajbanshi",description:"Rajbanshi Dramatized Audio Bible",image:"https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL1JKU0lFTU4yREEvQXJ0LzE2MDB4MTYwMC9SSlNJRU1OMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D",url: "https://podcast.faithcomesbyhearing.com/feeds/audio-bibles/RJSIEMN2DA.xml"),
];

static Future<void> startAudioPlayer({required CategoryModel categoryModel, required List<RssItem> items, int? index}) async{
  final List<Map<String, dynamic>> lists = [];
  for (int i = 0; i < items.length; i++) {
    RssItem item = items[i];
    MediaItem media = MediaItem(
        id: item.enclosure?.url??'',
        album: categoryModel.description??'',
        title: item.description??'',
        artist: categoryModel.title??'',
        artUri: Uri.parse(categoryModel.image??'https://cachedimages.podchaser.com/512x512/aHR0cDovL2ZjYmhhYmRtLnMzLmFtYXpvbmF3cy5jb20vbXAzYXVkaW9iaWJsZXMyL1JKU0lFTU4yREEvQXJ0LzE2MDB4MTYwMC9SSlNJRU1OMkRBLmpwZw%3D%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D')
    );
    lists.add(media.toJson());
  }

  await AudioService.start(
    backgroundTaskEntrypoint: audioPlayerTaskEntrypoint,
    androidNotificationChannelName: 'Audio Bible Dramatized',
    androidNotificationIcon: 'mipmap/ic_launcher',
    androidEnableQueue: true,
    params: {"data": lists}
  );

  // await AudioService.updateQueue(playlist);
  // if(index !=null)  await AudioService.skipToQueueItem(playlist[index].id);
  // AudioService.play();
}

}