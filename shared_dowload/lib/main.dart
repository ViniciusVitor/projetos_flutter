import 'dart:async';
import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final imgUrl = "https://unsplash.com/photos/iEJVyyevw-U/download?force=true";
  bool downloading = false;
  var progressString = "";
  Directory _downloadsDirectory;

  @override
  void initState() {
    super.initState();

    //downloading = true;
    initDownloadsDirectoryState();
    //downloadFile();
  }

  Future<void> initDownloadsDirectoryState() async {
    Directory downloadsDirectory;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }

    if (!mounted) return;

    setState(() {
      _downloadsDirectory = downloadsDirectory;
    });

    print("dir2: " + _downloadsDirectory.path.toString());
    downloadFile();
  }

  Future<void> downloadFile() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    Dio dio = Dio();

    try {
      var dir = _downloadsDirectory;

      await dio.download(imgUrl, "${dir.path}/myimage.jpg",
          onReceiveProgress: (rec, total) {
        print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
    var dir = await getApplicationDocumentsDirectory();
    //var dir2 = await getLibraryDirectory();
    var dir3 = await getExternalStorageDirectory();
    var dir4 = await getApplicationSupportDirectory();

    print("Dir: " + dir.path.toString());

    print("dir3: " + dir3.path.toString());

    print("dir4: " + dir4.path.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: downloading
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Downloading File: $progressString",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : RaisedButton(
                child: Text("SHARE"),
                onPressed: () async {
                  // get file from local store
                  final String dir = (await DownloadsPathProvider.downloadsDirectory).path;
                  final String path = '$dir/myimage.jpg';

                  ShareExtend.share(path, "file");
                },
              ),
      ),
    );
  }
}
