class Attributes {
  Attributes({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final String status;
  late final List<Data> data;

  Attributes.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.values,
    required this.V,
    required this.isFeature,
    required this.createdBy,
    required this.isActive,
  });
  late final String id;
  late final String name;
  late final List<String> values;
  late final int V;
  late final bool isFeature;
  late final String createdBy;
  late final bool isActive;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    values = List.castFrom<dynamic, String>(json['values']);
    V = json['__v'];
    isFeature = json['isFeature'];
    createdBy = json['createdBy'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['values'] = values;
    _data['__v'] = V;
    _data['isFeature'] = isFeature;
    _data['createdBy'] = createdBy;
    _data['isActive'] = isActive;
    return _data;
  }
}
