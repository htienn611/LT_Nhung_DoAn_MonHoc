import 'package:doan_monhoc/api/model/devices.dart';

class Room {
  late String name;
  late bool follow;
  List<Device> lstDevice =[];
  Room(this.name, this.follow, this.lstDevice);

  Room.fromJson(Map<String, dynamic> json)
      : name = json.containsKey('name') ? json['name'] : "",
        follow = json.containsKey('follow') ? json['follow'] : false,
        lstDevice = (json['devices'] as List?)
                ?.where((device) => device != null)
                .map((device) => Device.fromJson(device))
                .toList() ??
            [];
}
