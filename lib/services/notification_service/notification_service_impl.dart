import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_task_app/core/logger.dart';
import 'package:weather_task_app/core/strings/strings.dart';
import 'package:weather_task_app/services/notification_service/notification_service.dart';

@LazySingleton(as: NotificationService)
class NotificationServiceImpl implements NotificationService {
  late final FlutterLocalNotificationsPlugin _notificationsPlugin;

  static const int _itMightRainNotificationId = 0;

  @override
  Future<void> init() async {
    // Needed initialisation of timezone package, for more context refer to
    // https://pub.dev/packages/flutter_local_notifications#scheduling-a-notification
    tz.initializeTimeZones();
    final String localTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(localTimeZone));

    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    const IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: iosInitializationSettings,
      android: androidInitializationSettings,
    );

    await _notificationsPlugin.initialize(initializationSettings);

    _requestPermissionsForIOS();
  }

  @override
  Future<void> scheduleNotification({
    required Duration durationToScheduleTheNotificationFor,
  }) async {
    // Not clearing a notification here as scheduling a new notification
    // will override the old one (as I only use one notification, having
    // always the same id)

    return _notificationsPlugin.zonedSchedule(
      _itMightRainNotificationId,
      itMightRainNotificationTitle,
      itMightRainNotificationBody,
      tz.TZDateTime.now(tz.local).add(durationToScheduleTheNotificationFor),
      const NotificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  @override
  Future<void> clearScheduledNotification() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await _notificationsPlugin.pendingNotificationRequests();

    if (pendingNotificationRequests.firstWhereOrNull(
            (notification) => notification.id == _itMightRainNotificationId) !=
        null) {
      Log.logInfo(
        'Cleared scheduled notification with id: $_itMightRainNotificationId',
      );

      return _notificationsPlugin.cancel(_itMightRainNotificationId);
    }
  }

  void _requestPermissionsForIOS() {
    if (Platform.isIOS) {
      _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }
}
