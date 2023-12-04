class Device {
  late String description;
  late String name;
  late bool state;
  late int state_value;
  Device(this.description, this.state, this.name);

  Device.fromJson(Map<String, dynamic> json)
      : description =
            json.containsKey('description') ? json['description'] : "",
        state = json.containsKey('state') ? json['state'] : false,
        name = json.containsKey('name') ? json['name'] : "",
        state_value = json.containsKey('state_value') ? json['state_value'] : 0;
}
