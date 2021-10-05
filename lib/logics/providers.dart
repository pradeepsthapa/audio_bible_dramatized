import 'package:audio_bible_dramarized/data/category_model.dart';
import 'package:audio_bible_dramarized/data/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'audio_repository.dart';
import 'theme_state.dart';

final themeStateProvider = ChangeNotifierProvider<MainTheme>((ref)=>MainTheme());

final audioProvider = FutureProvider<RssFeed?>((ref){
  return AudioRepository.getAudioList(url: ref.watch(currentCategoryIndex).state.url);
});

final currentCategoryIndex = StateProvider<CategoryModel>((ref)=>Constants.audioCategories.first);

