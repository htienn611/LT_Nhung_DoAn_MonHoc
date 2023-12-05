import 'package:doan_monhoc/api/model/devices.dart';

class Room {
  late String name;
  late bool follow;
  late dynamic idx;
  List<Device> lstDevice = List.filled(0, Device("", true, "",""), growable: true);
  Room(this.name, this.follow, this.lstDevice, this.idx);
  Room.fromJson(Map<String, dynamic> json)
      : name = json.containsKey('name') ? json['name'] : "",
       idx = json.containsKey('idx') ? json['idx'] : "",

        follow = json.containsKey('follow') ? json['follow'] : false,
        lstDevice = (json['devices'] as List?)
                ?.where((device) => device != null)
                .map((device) => Device.fromJson(device))
                .toList() ??
            [];
}
