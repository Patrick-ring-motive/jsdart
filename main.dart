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
  static num sqrt(num x) => sqrt(x);
  static num ceil(num x) => x.ceil();
  static num floor(num x) => x.floor();
  static num round(num x) => x.round();
  static num trunc(num x) =>  x.truncate();
}


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



class Array implements List<dynamic> {
  final List<dynamic> _innerList = [];

  @override
  dynamic operator [](int index) => _innerList[index];

  @override
  void operator []=(int index, dynamic value) {
    _innerList[index] = value;
  }

  @override
  int get length => _innerList.length;

  @override
  set length(int newLength) {
    _innerList.length = newLength;
  }    @override
    Array operator +(List<dynamic> other) {
      return Array()..addAll(_innerList + other);
    }

  
  static Array from(Iterable<dynamic> iterable) {
    Array array = Array(); 
    array.addAll(iterable);
    return array;
  }


    @override
    set first(dynamic value) {
      if (_innerList.isNotEmpty) {
        _innerList[0] = value;
      } else {
        _innerList.add(value);
      }
    }

    @override
    set last(dynamic value) {
      if (_innerList.isNotEmpty) {
        _innerList[_innerList.length - 1] = value;
      } else {
        _innerList.add(value);
      }
    }

    @override
    bool remove(Object? value) {
      return _innerList.remove(value);
    }

    @override
    void removeWhere(bool Function(dynamic) test) {
      _innerList.removeWhere(test);
    }

    @override
    List<dynamic> sublist(int start, [int? end]) {
      return _innerList.sublist(start, end);
    }

  void push(dynamic value) {
    _innerList.add(value);
  }

  dynamic pop() {
    return _innerList.removeLast();
  }

  dynamic shift() {
    return _innerList.removeAt(0);
  }

  void unshift(dynamic value) {
    _innerList.insert(0, value);
  }

  Array slice([int start = 0, int? end]) {
    return Array()..addAll(_innerList.sublist(start, end));
  }

  Array splice(int start, int deleteCount, [dynamic item]) {
    var removed = _innerList.sublist(start, start + deleteCount);
    _innerList.removeRange(start, start + deleteCount);
    if (item != null) {
      _innerList.insert(start, item);
    }
    return Array()..addAll(removed);
  }

  bool includes(dynamic element) {
    return _innerList.contains(element);
  }

  Array concat(List<dynamic> other) {
    return Array()..addAll(_innerList)..addAll(other);
  }

  Array filter(bool Function(dynamic) callback) {
    return Array()..addAll(_innerList.where(callback));
  }

  dynamic reduce(dynamic Function(dynamic, dynamic) callback, [dynamic initialValue]) {
    if (initialValue != null) {
      return _innerList.fold(initialValue, callback);
    } else {
      return _innerList.reduce(callback);
    }
  }

  Array copyWithin(int target, int start, [int? end]) {
    end ??= length;
    int to = target >= 0 ? target : length + target;
    int from = start >= 0 ? start : length + start;
    int finalEnd = end >= 0 ? end : length + end;
    if (to < 0) to = 0;
    if (from < 0) from = 0;
    if (finalEnd > length) finalEnd = length;
    while (from < finalEnd) {
      if (to < length) {
        _innerList[to] = _innerList[from];
      } else {
        _innerList.add(_innerList[from]);
      }
      to++;
      from++;
    }
    return this;
  }

  Iterable<dynamic> entries() {
    return _innerList.asMap().entries;
  }


  void fill(dynamic value, [int start = 0, int? end]) {
    _innerList.fillRange(start, end ?? _innerList.length, value);
  }

  dynamic find(bool Function(dynamic) test) {
    return _innerList.firstWhere(test, orElse: () => null);
  }

  int findIndex(bool Function(dynamic) test) {
    return _innerList.indexWhere(test);
  }

  dynamic findLast(bool Function(dynamic) test) {
    return _innerList.lastWhere(test, orElse: () => null);
  }

  int findLastIndex(bool Function(dynamic) test) {
    return _innerList.lastIndexWhere(test);
  }

  Array flat([int depth = 1]) {
     flatten(list, depth) {
      return list.expand((i) => i is List && depth > 0 ? flatten(i, depth - 1) : [i]);
     }
    return Array()..addAll(flatten(_innerList, depth));
  }

  bool some(bool Function(dynamic) test) {
    return _innerList.any(test);
  }

  Array toSorted([int Function(dynamic, dynamic)? compare]) {
    var sortedList = List.from(_innerList)..sort(compare);
    return Array()..addAll(sortedList);
  }

  Array toReversed() {
    return Array()..addAll(_innerList.reversed);
  }

  Array reverse() {
    return Array()..addAll(_innerList.reversed);
  }

  Array toSpliced(int start, int deleteCount, [dynamic item]) {
    return this.splice(start, deleteCount, item);
  }

  String toLocaleString() {
    return _innerList.toString();
  }

  Iterable<dynamic> keys() {
    return _innerList.asMap().keys;
  }

  Iterable<dynamic> values() {
    return _innerList;
  }

  Array withAt(int index, dynamic value) {
    _innerList[index] = value;
    return this;
  }

  @override
  String toString() => _innerList.toString();

  @override
  void add(dynamic value) {
    _innerList.add(value);
  }

  @override
  void addAll(Iterable<dynamic> iterable) {
    _innerList.addAll(iterable);
  }

  @override
  bool any(bool Function(dynamic) test) {
    return _innerList.any(test);
  }

  @override
  Map<int, dynamic> asMap() {
    return _innerList.asMap();
  }

  @override
  List<R> cast<R>() {
    return _innerList.cast<R>();
  }

  @override
  void clear() {
    _innerList.clear();
  }

  @override
  bool contains(Object? element) {
    return _innerList.contains(element);
  }

  @override
  dynamic elementAt(int index) {
    return _innerList.elementAt(index);
  }

  @override
  bool every(bool Function(dynamic) test) {
    return _innerList.every(test);
  }

  @override
  Iterable<R> expand<R>(Iterable<R> Function(dynamic) f) {
    return _innerList.expand(f);
  }

  @override
  void fillRange(int start, int end, [dynamic fillValue]) {
    _innerList.fillRange(start, end, fillValue);
  }

  @override
  dynamic get first => _innerList.first;

  @override
  dynamic firstWhere(bool Function(dynamic) test, {dynamic Function()? orElse}) {
    return _innerList.firstWhere(test, orElse: orElse);
  }

  @override
  R fold<R>(R initialValue, R Function(R, dynamic) combine) {
    return _innerList.fold(initialValue, combine);
  }

  @override
  Iterable<dynamic> followedBy(Iterable<dynamic> other) {
    return _innerList.followedBy(other);
  }

  @override
  void forEach(void Function(dynamic) f) {
    _innerList.forEach(f);
  }

  @override
  Iterable<dynamic> getRange(int start, int end) {
    return _innerList.getRange(start, end);
  }

  @override
  int indexOf(dynamic element, [int start = 0]) {
    return _innerList.indexOf(element, start);
  }

  @override
  int indexWhere(bool Function(dynamic) test, [int start = 0]) {
    return _innerList.indexWhere(test, start);
  }

  @override
  void insert(int index, dynamic element) {
    _innerList.insert(index, element);
  }

  @override
  void insertAll(int index, Iterable<dynamic> iterable) {
    _innerList.insertAll(index, iterable);
  }

  @override
  bool get isEmpty => _innerList.isEmpty;

  @override
  bool get isNotEmpty => _innerList.isNotEmpty;

  @override
  Iterator<dynamic> get iterator => _innerList.iterator;

  @override
  String join([String separator = '']) {
    return _innerList.join(separator);
  }

  @override
  dynamic get last => _innerList.last;

  @override
  int lastIndexOf(dynamic element, [int? start]) {
    return _innerList.lastIndexOf(element, start);
  }

  @override
  int lastIndexWhere(bool Function(dynamic) test, [int? start]) {
    return _innerList.lastIndexWhere(test, start);
  }

  @override
  dynamic lastWhere(bool Function(dynamic) test, {dynamic Function()? orElse}) {
    return _innerList.lastWhere(test, orElse: orElse);
  }

  @override
  Iterable<R> map<R>(R Function(dynamic) f) {
    return _innerList.map(f);
  }

  @override
  dynamic removeAt(int index) {
    return _innerList.removeAt(index);
  }

  @override
    dynamic removeLast() {
      return _innerList.removeLast();
    }

    @override
    void removeRange(int start, int end) {
      _innerList.removeRange(start, end);
    }

    @override
    void replaceRange(int start, int end, Iterable<dynamic> replacements) {
      _innerList.replaceRange(start, end, replacements);
    }

    @override
    void retainWhere(bool Function(dynamic) test) {
      _innerList.retainWhere(test);
    }

    @override
    Iterable<dynamic> get reversed => _innerList.reversed;

    @override
    void setAll(int index, Iterable<dynamic> iterable) {
      _innerList.setAll(index, iterable);
    }

    @override
    void setRange(int start, int end, Iterable<dynamic> iterable, [int skipCount = 0]) {
      _innerList.setRange(start, end, iterable, skipCount);
    }

    @override
    void shuffle([Random? random]) {
      _innerList.shuffle(random);
    }

    @override
    int get single => _innerList.single;

    @override
    dynamic singleWhere(bool Function(dynamic) test, {dynamic Function()? orElse}) {
      return _innerList.singleWhere(test, orElse: orElse);
    }

    @override
    Iterable<dynamic> skip(int count) {
      return _innerList.skip(count);
    }

    @override
    Iterable<dynamic> skipWhile(bool Function(dynamic) test) {
      return _innerList.skipWhile(test);
    }

    @override Array sort([int Function(dynamic, dynamic)? compare]) {
  _innerList.sort(compare);
  return this;
}

    @override
    Iterable<dynamic> take(int count) {
      return _innerList.take(count);
    }

    @override
    Iterable<dynamic> takeWhile(bool Function(dynamic) test) {
      return _innerList.takeWhile(test);
    }

    @override
    List<dynamic> toList({bool growable = true}) {
      return _innerList.toList(growable: growable);
    }

    @override
    Set<dynamic> toSet() {
      return _innerList.toSet();
    }

    @override
    Iterable<dynamic> where(bool Function(dynamic) test) {
      return _innerList.where(test);
    }

    @override
    Iterable<R> whereType<R>() {
      return _innerList.whereType<R>();
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

