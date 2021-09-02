enum NotificationType {
  alert,
  snack,
  notification,
}

class Notification {
  Notification({
    required this.type,
    required this.message,
    this.title = '',
  });
  String title;
  String message;
  NotificationType type;
}
