import 'dart:math';

num mathMin(List<num> args) {
  var m = args[0];
  for (var i = 0; i < args.length; i++) {
    if (args[i] < m) {
      m = args[i];
    }
  }
  return m;
}

num mathMax(List<num> args) {
  var m = args[0];
  for (var i = 0; i < args.length; i++) {
    if (args[i] > m) {
      m = args[i];
    }
  }
  return m;
}

class Math {
  static num abs(x) => sqrt(x * x);
  static num min(List<num> args) => mathMin(args);
  static num max(List<num> args) => mathMax(args);
}

typedef Array = List<dynamic>;
typedef function = dynamic;
typedef let = dynamic;
int parseInt(x) {
  try {
    return x.toInt();
  } catch (e) {
    try {
      return int.parse(x);
    } catch (e) {
      return double.parse(x).toInt();
    }
  }
}

function n(x) {
  try {
    return BigInt.from(x);
  } catch (e) {
    try {
      return BigInt.parse(x);
    } catch (e) {
      return BigInt.from(double.parse(x));
    }
  }
}




class Number {
  dynamic _value;
  Number(this._value);
  dynamic get valueOf => _value;
   operator >= (Object other){
     if(other is Number){
      _value = other.valueOf;
       return true;
     }
     if((other is int)
      ||(other is double)
      ||(other is String)
      ||(other is BigInt)){
       _value = other;
        return true;
      }
     return false;
   }
   operator >>> (Object other){
      if(other is Number){
       return _value >= other.valueOf;
      }
      if((other is int)
       ||(other is double)
       ||(other is String)
       ||(other is BigInt)){
        return _value >= other;
       }
      return false;
    }
  @override
  String toString() => '$valueOf';
}

void main() {
  Number a = Number(5);
  print(a);
  a>=7;
  print(a);
}

