import 'package:flutter/material.dart';
import 'package:json_test/main.dart';

class StateModel {
  String id;
  String name;
  List<Cities> cities;

  StateModel({this.id, this.name, this.cities});

  StateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = new List<Cities>();
      json['cities'].forEach((v) {
        cities.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.cities != null) {
      data['cities'] = this.cities.map((v) => v.toJson()).toList();
    }
    return data;
  }

  List<StateModel> listFromJson(dynamic json) {
    if (json != null) {
      return json.map<StateModel>((ct) {
        return StateModel.fromJson(ct);
      }).toList();
    }

    return null;
  }

  dynamic listToJson(List<StateModel> list) {
    List<Map> items = List<Map>();
    if (list != null) {
      for (var item in list) {
        items.add(item.toJson());
      }
    }

    return items;
  }
}

class Cities {
  String id;
  String name;

  Cities({this.id, this.name});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  List<Cities> listFromJson(dynamic json) {
    if (json != null) {
      return json.map<Cities>((ct) {
        return Cities.fromJson(ct);
      }).toList();
    }

    return null;
  }

  dynamic listToJson(List<Cities> list) {
    List<Map> items = List<Map>();
    if (list != null) {
      for (var item in list) {
        items.add(item.toJson());
      }
    }

    return items;
  }
}
