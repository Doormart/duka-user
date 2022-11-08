class NotificationModel {
  final int number;
  final DateTime date;
  final List<NotificationItem> data;

  NotificationModel({
    required this.number,
    required this.date,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        number: json['number'],
        date: DateTime.parse(json['date']),
        data: List<NotificationItem>.from(
            json['data'].map((element) => NotificationItem.fromJson(element))),
      );
}

class NotificationItem {
  final String notificationMessage;
  final DateTime notificationDate;
  final bool read;

  NotificationItem({
    required this.notificationMessage,
    required this.read,
    required this.notificationDate,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      NotificationItem(
        notificationMessage: json["message"],
        read: json['read'],
        notificationDate: DateTime.parse(json["date"]),
      );
}
