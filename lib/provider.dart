import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/count_data.dart';

final titleProvider = Provider<String>((ref){
  return 'Riverpod demo page';
});

final textProvider = Provider<String>((ref){
  return "you have pushed the buttoon this many times";
});

final countProvider = 
    StateProvider<int>((ref) => 0);

final countDataProvider = StateProvider<CountData>(
        (ref) => CountData(
            count: 0,
            countDown: 0,
            countUp: 0,
        ));