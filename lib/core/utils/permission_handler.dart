import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

/// This methods Handle all Permission From the Device,
/// Platforms:
///
/// |   Android   |   IOS   |   Web   |
/// |--------------|-----------------|-----------------|
/// | `✔️` | `✔️` | `❌` | <br>
///
abstract class PermissionHandler {
  /// Used to check Android permissions status
  ///
  /// Important:
  ///
  /// * This will always gets a bool.
  /// * If return true `[READ]` and `[WRITE]` permissions is Granted, else `[READ]` and `[WRITE]` is Denied.
  ///
  /// Platforms:
  ///
  /// Android `✔️` --- IOS `✔️` --- Web `❌`
  ///
  Future<bool> get isGranded;

  /// If the user denied this permission.
  Future<bool> get isDenied;

  /// Used to request Android permissions.
  ///
  /// Important:
  ///
  /// * This method will always return a bool.
  /// * If return true `[READ]` and `[WRITE]` permissions is Granted, else `[READ]` and `[WRITE]` is Denied.
  ///
  /// Platforms:
  ///
  /// Android `✔️` --- IOS `✔️` --- Web `❌`
  ///
  Future<bool> requestPermissions();
}

/// Android: External Storage Permission
///
/// iOS: Access to folders like `Documents` or `Downloads`. Implicitly
/// granted.
class StoragePermission extends PermissionHandler {
  /// If the user granted this permission.
  @override
  Future<bool> get isGranded =>  OnAudioQuery().permissionsStatus();

  /// If the user denied this permission.
  @override
  Future<bool> get isDenied => Permission.storage.isDenied;

  @override
  Future<bool> requestPermissions() async {
    return await OnAudioQuery().permissionsRequest();

    // final permissionStatus = await Permission.storage.request();
    // return permissionStatus == PermissionStatus.granted;
  }
}
