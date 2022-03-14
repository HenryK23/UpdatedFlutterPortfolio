import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website/Models/model_project_item.dart';

class Projects with ChangeNotifier {
  List projectList = [];
  List CVImagePath = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> fetchAndSetProjects() async {
    CollectionReference projects =
        FirebaseFirestore.instance.collection('Projects');
    try {
      await projects.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          projectList.add(result.data());
        }
        print(projectList);
        notifyListeners();
      });
    } catch (error) {}
  }

  List get CV {
    return CVImagePath;
  }

  Future<void> fetchAndSetCV() async {
    CollectionReference projects = FirebaseFirestore.instance.collection('CV');
    try {
      await projects.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          CVImagePath.add(result.data());
        }
        print(CVImagePath);
        notifyListeners();
      });
    } catch (error) {}
  }
}
