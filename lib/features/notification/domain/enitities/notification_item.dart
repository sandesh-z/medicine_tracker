class NotificationItem {
  int? id;
  String? title;
  String? body;
  String? payload;
  String? type;

  NotificationItem({this.id, this.title, this.body, this.payload, this.type});
}

class NotificationType {
  static const medicine = 'medicine';
  static const advertisement = 'advertisement';
}
