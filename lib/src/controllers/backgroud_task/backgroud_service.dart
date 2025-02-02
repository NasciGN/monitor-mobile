import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/controllers/notification/notification_service.dart';
import 'package:monitor_mobile/src/models/adapters/user_login_adapter.dart';

// Classe para gerenciar o Background Fetch e Notificações
class BackgroundService with WidgetsBindingObserver {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'zabbix_alerts_channel',
    'Zabbix Alerts',
    description: 'Notificações para incidentes do Zabbix',
    importance: Importance.high,
  );

  final UserDataController userDataController = UserDataController();
  final ProblemDataController problemDataController = ProblemDataController();

  AppLifecycleState _appState = AppLifecycleState.resumed;

  BackgroundService() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appState = state;

    if (state == AppLifecycleState.resumed) {
      _flutterLocalNotificationsPlugin.cancelAll();
    }
  }

  Future<void> handleIncidents(List incidents) async {
    if (incidents.isNotEmpty) {
      if (_appState == AppLifecycleState.resumed) {
        incidents.length == 1
            ? Get.snackbar("🚨 Alerta do Zabbix!", "Novo incidente detectado.",
                duration: const Duration(seconds: 5))
            : Get.snackbar("🚨 Alerta do Zabbix!",
                "${incidents.length} novos incidentes detectados.",
                duration: const Duration(seconds: 5));
      } else {
        incidents.length == 1
            ? await NotificationService().showNotification(
                0, "🚨 Alerta do Zabbix!", "Novo incidente detectado.")
            : await NotificationService().showNotification(
                0,
                "🚨 Alerta do Zabbix!",
                "${incidents.length} novos incidentes detectados.");
      }
    }
  }

  @pragma('vm:entry-point')
  Future<void> backgroundFetchHeadlessTask(HeadlessTask task) async {
    String taskId = task.taskId;
    bool isTimeout = task.timeout;

    if (isTimeout) {
      BackgroundFetch.finish(taskId);
      return;
    }

    User? user;
    try {
      UserDataController userDataController = UserDataController();
      user = await userDataController.getUserLoginInfo();

      if (user == null || user.apicode.isEmpty) {
        BackgroundFetch.finish(taskId);
        return;
      }
    } catch (e) {
      print("[BackgroundFetch] Erro ao acessar o Hive: $e");
    }

    final incidents =
        await problemDataController.fetchProblemsWithToken(user!.apicode);

    handleIncidents(incidents);

    BackgroundFetch.finish(taskId);
  }

  Future<void> initBackgroundFetch() async {
    int status = await BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15,
          stopOnTerminate: false,
          enableHeadless: true,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresStorageNotLow: false,
          requiresDeviceIdle: false,
          requiredNetworkType: NetworkType.NONE,
        ), (String taskId) async {
      User? user;
      try {
        user = await userDataController.getUserLoginInfo();

        if (user == null || user.apicode.isEmpty) {
          BackgroundFetch.finish(taskId);
          return;
        }
      } catch (e) {
        print("[BackgroundFetch] Erro ao acessar o Hive: $e");
      }

      final incidents =
          await problemDataController.fetchProblemsWithToken(user!.apicode);
      handleIncidents(incidents);

      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      print("[BackgroundFetch] ❌ Timeout da tarefa: $taskId");
      BackgroundFetch.finish(taskId);
    });

    print("[BackgroundFetch] ✅ Configuração bem-sucedida: $status");

    BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  }
}
