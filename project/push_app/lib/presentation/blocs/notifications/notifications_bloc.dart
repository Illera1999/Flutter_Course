import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationsBloc() : super(NotificationsState()) {
    // on<NotificationsEvent>((event, emit) {
    // });
    on<NotificationStatusChange>(_notificationStatusChanged);
    _initialStatusCheck();
  }

  static Future<void> initializedFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }


  void _notificationStatusChanged(NotificationStatusChange event, Emitter<NotificationsState> emit){
    emit(state.copyWith(
      status: event.status
    ));
    _getFCMToken();
  }


  void _initialStatusCheck() async{
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChange(settings.authorizationStatus));

    /*
      usuario.com: [
        token1,
        token2,
        token3,
      ]
    */
  }

  void _getFCMToken() async{
    if (state.status != AuthorizationStatus.authorized) return;
    final token = await messaging.getToken();
    print(token);
  }

  void requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    add(NotificationStatusChange(settings.authorizationStatus));
  }
}
