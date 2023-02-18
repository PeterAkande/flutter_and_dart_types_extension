extension ListExtensions on List<Object> {
  ///Removes elements of a list from start to the end
  ///Its a removeRange without the need to know the end.
  ///```dart
  ///final l = [0, 1, 2, 3, 4, 5]
  ///
  ///l.removeFrom(3)
  ///
  ///print(l) # [0, 1, 2]
  ///```
  removeFrom(int start) {
    if (length < start) return;
    removeRange(start, length);
  }
}
