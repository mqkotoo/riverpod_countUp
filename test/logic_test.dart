import 'package:riverpod_countup/logic/logic.dart';
import 'package:test/test.dart';

void main() {
  Logic target = Logic();
  
  setUp(() async{
    target = Logic();
  });

  //initial value test
  test('init',() async{
    expect(target.countData.count,0);
    expect(target.countData.countUp,0);
    expect(target.countData.countDown,0);
  });

  //increase() test
  test('increase',() async{
    target.increase();
    expect(target.countData.count,1);
    expect(target.countData.countUp,1);
    expect(target.countData.countDown,0);

    target.increase();
    target.increase();
    target.increase();

    expect(target.countData.count,4);
    expect(target.countData.countUp,4);
    expect(target.countData.countDown,0);
  });


  //decrease() test
  test('decrease',() async{
    target.decrease();

    expect(target.countData.count,-1);
    expect(target.countData.countUp,0);
    expect(target.countData.countDown,1);


    target.decrease();
    target.decrease();
    target.decrease();

    expect(target.countData.count,-4);
    expect(target.countData.countUp,0);
    expect(target.countData.countDown,4);

  });

  //reset() test
  test('reset',() async{

    expect(target.countData.count,0);
    expect(target.countData.countUp,0);
    expect(target.countData.countDown,0);


    target.increase();
    target.increase();
    target.decrease();

    expect(target.countData.count,1);
    expect(target.countData.countUp,2);
    expect(target.countData.countDown,1);

    target.reset();

    expect(target.countData.count,0);
    expect(target.countData.countUp,0);
    expect(target.countData.countDown,0);
  });
}