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

void main() {
  print(n("2.0"));
}
