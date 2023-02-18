import 'package:flutter/material.dart';

///Defines Some Extemsions for The SnapShpt returned by [FutureBuilder] and [StreamBuilder]
extension SnapShotExtension on AsyncSnapshot<Object?> {
  ///Checks if the [Stream] is still Active in a Stream builder.
  ///
  ///```dart
  ///StreamBuilder(
  ///...,
  ///builder :(context, snapShot){
  ///   if(snapShot.isActive()){
  ///     ...
  ///   }else{
  ///   ...
  ///   }
  /// }
  ///
  ///)
  ///```
  bool isActive() {
    if (connectionState == ConnectionState.active) {
      if (hasError) {
        return false;
      }
      if (!hasData) {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }

  ///This extension should be used instead of [isActive] when the result from the future or stream can be null
  bool isConnectionActiveAndNoError() {
    if (connectionState == ConnectionState.active) {
      if (hasError) {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }

  ///Checks if the [Future] is still Done in a Stream builder.
  ///
  ///```dart
  ///FutureBuilder(
  ///...,
  ///builder :(context, snapShot){
  ///   if(snapShot.isDone()){
  ///     ...
  ///   }else{
  ///   ...
  ///   }
  /// }
  ///
  ///)
  ///```
  bool isDone() {
    if (connectionState == ConnectionState.done) {
      if (hasError) {
        return false;
      }
      if (!hasData) {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }
}
