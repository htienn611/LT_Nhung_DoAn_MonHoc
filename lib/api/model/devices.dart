class Device {
  late String description;
  late String name;
  late bool state;
  late int state_value;
  Device(this.description, this.state, this.state_value,this.name);

  Device.fromJson(Map<String, dynamic> json)
      : description =
            json.containsKey('description') ? json['description'] : "",
        state = json.containsKey('state') ? json['state'] : false,
        name = json.containsKey('name') ? json['name'] : "",
        state_value = json.containsKey('state_value') ? json['state_value'] : 0;
  Device.fromMap(Map<Object?, Object?>? map) {
    if (map != null) {
      description = map['description'] as String? ?? '';
      state = map['state'] as bool? ?? false;
      state_value = (map['state_value'] as int?) ?? 0;
    } else {
      // Xử lý trường hợp map là null
      // Có thể đặt giá trị mặc định hoặc ném một ngoại lệ tùy thuộc vào yêu cầu của bạn.
    }
  }
}
