import 'package:audio_bible_dramarized/logics/providers.dart';
import 'package:audio_bible_dramarized/presentation/widgets/miniplayer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'audio_loaded_screen.dart';

class AudioDetails extends StatefulWidget {

  @override
  _AudioDetailsState createState() => _AudioDetailsState();
}

class _AudioDetailsState extends State<AudioDetails> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(audioProvider);
             return state.when(
                 data: (data)=>AudioLoadedScreen(data!),
                 loading: ()=>Center(child: CircularProgressIndicator(),),
                 error: (_,st)=>Center(child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset('assets/images/no-signal.png',fit: BoxFit.cover,height: 50,width: 50,),
                     SizedBox(height: 20,),
                     Text(_.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[500]),),
                   ],
                 ),));
            },
          ),
        ),
        MiniPlayerWidget()
      ],
    );
  }
}
