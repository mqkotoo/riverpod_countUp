import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/provider.dart';
import 'package:riverpod_countup/view_model/view_model.dart';

import 'data/count_data.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  ViewModel _viewModel = ViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.setRef(ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
             ref.watch(titleProvider),
         ),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                ref.watch(textProvider),
              ),
            //カウントの数字
            Text(
                // ref.watch(countDataProvider).count.toString(),
              _viewModel.count,
                style: Theme.of(context).textTheme.headline4,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //minus button
                FloatingActionButton(
                  onPressed: () {
                    _viewModel.onDecrease();
                  },
                  child: const Icon(Icons.remove),
                ),
                // plus button
                FloatingActionButton(
                  onPressed: () {
                   _viewModel.onIncrease();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //minus count
                Text(_viewModel.countDown),
                //plus count
                Text(_viewModel.countUp),
              ],
            )
          ],
        ),
      ),
      //reset button
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _viewModel.onReset();
          },
          child: const Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
