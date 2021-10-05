import 'package:audio_bible_dramarized/audio/media_state.dart';
import 'package:audio_bible_dramarized/audio/queue_state.dart';
import 'package:audio_bible_dramarized/presentation/widgets/audio_seekbar.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

class NowPlaying extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async{
        // context.read(adStateProvider).showMainAds();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          // leading: IconButton(
          //   icon: Icon(LineIcons.chevronDown,),
          //   onPressed: () => Navigator.pop(context),
          // ),
          title: Text("Now Playing", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            // StreamBuilder<MediaState>(
            //   stream: mediaStateStream,
            //   builder: (context, snapshot) {
            //     final mediaState = snapshot.data;
            //     return CachedNetworkImage(
            //       fit: BoxFit.cover,
            //       placeholder: (context, url) => Image.asset('assets/images/wallpaper.jpg',fit: BoxFit.cover,),
            //       imageUrl: mediaState!.mediaItem!.artUri!.toString(),
            //       errorWidget: (context, url, error) => Image.asset('assets/images/wallpaper.jpg',fit: BoxFit.cover),
            //     );
            //   }
            // ),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColorDark,
              ],
              begin: Alignment.topCenter, end: Alignment.bottomRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  StreamBuilder<MediaState>(
                    stream: mediaStateStream,
                    builder: (context, snapshot) {
                      final mediaState = snapshot.data;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-7, 9),
                                  blurRadius: 7),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(7, 9),
                                  blurRadius: 9),
                            ]),
                            child: Card(
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.zero,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container()
                      // CachedNetworkImage(
                      // fit: BoxFit.cover,
                      // height: 300,
                      // width: size.width * .8,
                      // placeholder: (context, url) => Image.asset('assets/images/wallpaper.jpg',fit: BoxFit.cover),
                      // imageUrl: mediaState?.mediaItem?.artUri?.toString()??'',
                      // errorWidget: (context, url, error) => Image.asset('assets/images/wallpaper.jpg',fit: BoxFit.cover),
                      // ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SeekBar(
                            duration: mediaState?.mediaItem?.duration ??
                                Duration.zero,
                            position: mediaState?.position ?? Duration.zero,
                            onChangeEnd: (newPosition) {
                              AudioService.seekTo(newPosition);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(),
                  StreamBuilder<QueueState>(
                    stream: queueStateStream,
                    builder: (context, snapshot) {
                      final queueState = snapshot.data;
                      final queue = queueState?.queue ?? [];
                      final mediaItem = queueState?.mediaItem;
                      // final String date = mediaItem?.genre ?? DateTime.now().toString();
                      // final formattedDate = DateFormat.yMMMEd().format(DateTime.parse(date));
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 15),
                            child: Text(
                              mediaItem?.title ?? '',
                              style: TextStyle(
                                  color: isDark
                                      ? Theme.of(context).accentColor
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 20),
                            child: Text(
                                mediaItem?.album??'',
                                style: TextStyle(color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (queue.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.shuffle,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: mediaItem == queue.first
                                        ? null
                                        : AudioService.skipToPrevious,
                                    icon: Icon(
                                      Icons.skip_previous_rounded,
                                      color: Colors.white,
                                    )),
                                StreamBuilder<AudioProcessingState>(
                                  stream: AudioService.playbackStateStream
                                      .map((state) => state.processingState)
                                      .distinct(),
                                  builder: (context, snapshot) {
                                    final processingState = snapshot.data ??
                                        AudioProcessingState.none;
                                    return StreamBuilder<bool>(
                                        stream: AudioService.playbackStateStream
                                            .map((state) => state.playing)
                                            .distinct(),
                                        builder: (context, snapshot) {
                                          final playing =
                                              snapshot.data ?? false;
                                          return IconButton(
                                            iconSize: 60,
                                            onPressed: playing
                                                ? AudioService.pause
                                                : AudioService.play,
                                            icon: CircleAvatar(
                                              backgroundColor: isDark
                                                  ? Colors.white
                                                  : Colors.black38,
                                              minRadius: 60,
                                              child: processingState ==
                                                      AudioProcessingState
                                                          .buffering
                                                  ? CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              isDark
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white))
                                                  : Icon(
                                                      playing
                                                          ? Icons.pause
                                                          : Icons.play_arrow,
                                                      color: isDark
                                                          ? Colors.black
                                                          : Colors.white,
                                                      size: 40,
                                                    ),
                                            ),
                                          );
                                        });
                                  },
                                ),
                                IconButton(
                                    onPressed: mediaItem == queue.last
                                        ? null
                                        : AudioService.skipToNext,
                                    icon: Icon(
                                      Icons.skip_next_rounded,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      // queueDownload(context,mediaItem!.id, mediaItem.title);
                                    },
                                    icon: Icon(
                                      Icons.download_rounded,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                  SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
