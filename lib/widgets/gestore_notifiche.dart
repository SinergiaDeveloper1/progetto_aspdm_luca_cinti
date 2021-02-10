import 'dart:async';
import 'package:app_luca_cinti/states/stato_refresh.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class GestoreNotifiche extends StatefulWidget {
  final Widget child;
  final StatoRefresh statoRefresh;

  GestoreNotifiche({
    this.child,
    this.statoRefresh,
  });

  @override
  _GestoreNotificheState createState() => _GestoreNotificheState();
}

class _GestoreNotificheState extends State<GestoreNotifiche> {
  StreamSubscription<RemoteMessage> _subscription;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    inizializzaMessaggi();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    super.dispose();
  }

  Future<void> inizializzaMessaggi() async {
    final fcm = FirebaseMessaging.instance;
    final messaggio = await fcm.getInitialMessage();

    if (messaggio != null) {
      await gestisciNotifiche(messaggio);
    }

    _subscription = FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      if (event != null) {
        await gestisciNotifiche(event);
      }
    });

    fcm.subscribeToTopic('aggiornamento');
  }

  Future<void> gestisciNotifiche(RemoteMessage message) async {
    await widget.statoRefresh.aggiornaDB();
  }
}
