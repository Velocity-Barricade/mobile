import 'package:barricade/Models/config.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<RemoteConfig> fetchRemoteConfig() async {
  final RemoteConfig remoteConfig = await RemoteConfig.instance;

  remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: false));
  remoteConfig.setDefaults(Config.toJson());

  await remoteConfig.fetch(expiration: const Duration(hours: 12));
  await remoteConfig.activateFetched();

  Config.fromJson(remoteConfig.getAll());
  return remoteConfig;
}
