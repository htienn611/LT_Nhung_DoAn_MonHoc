import 'package:doan_monhoc/api/model/devices.dart';

class Room {
  late String name;
  late bool follow;
  List<Device> lstDevice = List.filled(0, Device("", true, 1,""), growable: true);
  Room(this.name, this.follow, this.lstDevice);

  Room.fromJson(Map<String, dynamic> json)
      : name = json.containsKey('name') ? json['name'] : "",
        follow = json.containsKey('follow') ? json['follow'] : false,
        lstDevice = (json['devices'] as List?)
                ?.where((device) => device != null)
                .map((device) => Device.fromJson(device))
                .toList() ??
            [];

  Room.fromMap(Map<Object?, Object?>? map) {
    if (map != null) {
      name = map['name'] as String? ?? '';
      follow = map['follow'] as bool? ?? false;

      // Khởi tạo danh sách thiết bị từ danh sách trong map
      lstDevice = (map['lstDevice'] as List<dynamic>?)
              ?.map((deviceMap) =>
                  Device.fromMap(deviceMap as Map<Object?, Object?>?))
              .toList() ??
          [];
    } else {
      // Xử lý trường hợp map là null
      // Có thể đặt giá trị mặc định hoặc ném một ngoại lệ tùy thuộc vào yêu cầu của bạn.
    }
  }
}
