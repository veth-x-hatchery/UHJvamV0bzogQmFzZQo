import 'dart:io';

import 'package:hatchery/core/utils/logger.dart';
import 'package:path_provider/path_provider.dart';

// ignore: avoid_classes_with_only_static_members
class FilesUtil {
  // Future<Directory?>? _requestAppDocumentsDirectory() {
  //   return getApplicationDocumentsDirectory();
  // }

  // Future<Directory?>? _requestAppSupportDirectory() {
  //   return getApplicationSupportDirectory();
  // }

  // Future<Directory?>? _requestAppLibraryDirectory() {
  //   return getLibraryDirectory();
  // }

  // Future<Directory?>? _requestExternalStorageDirectory() {
  //   return getExternalStorageDirectory();
  // }

  // Future<List<Directory>?>? _requestExternalStorageDirectories(
  //     StorageDirectory type) {
  //   return getExternalStorageDirectories(type: type);
  // }

  // Future<List<Directory>?> _requestExternalCacheDirectories() {
  //   return getExternalCacheDirectories();
  // }

  static Future<String> createFolderInAppDocDir(String folderName) async {
    //Get this App Document Directory
    final Directory _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory _appDocDirFolder =
        Directory('${_appDocDir.path}/$folderName/');

    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  static Future<String> validateDirectory(Directory directory) async {
    Logger.utils('validateDirectory -> $directory');
    if (await directory.exists()) {
      return directory.path;
    } else {
      final Directory _appDocDirNewFolder =
          await directory.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }
}
