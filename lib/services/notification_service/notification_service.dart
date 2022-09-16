abstract class NotificationService {
  Future<void> init();

  Future<void> scheduleNotification({
    required Duration durationToScheduleTheNotificationFor,
  });

  Future<void> clearScheduledNotification();
}
