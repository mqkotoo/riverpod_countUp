import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/logic.dart';
import '../provider.dart';

class ViewModel{

  Logic _logic = Logic();

  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
  }

  get count => _ref.watch(countDataProvider).count.toString();
  get countUp => _ref.watch(countDataProvider).countUp.toString();
  get countDown => _ref.watch(countDataProvider).countDown.toString();


  void onIncrease() {
    _logic.increase();
    _ref.watch(countDataProvider.notifier).state = _logic.countData;
  }

  void onDecrease() {
    _logic.decrease();
    _ref.watch(countDataProvider.notifier).state = _logic.countData;
  }

  void onReset() {
    _logic.reset();
    _ref.watch(countDataProvider.notifier).state = _logic.countData;
  }


}