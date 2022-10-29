import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mapa_de_buracos_app_flutter/app/resources/theme.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });
  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    super.initState();
    loadCamera();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tirar Foto do Buraco"),
        backgroundColor: AppTheme.backgroundColor,
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          try {
            if (controller != null) {
              //check if contrller is not null
              if (controller!.value.isInitialized) {
                //check if controller is initialized
                image = await controller!.takePicture(); //capture image
                setState(() {
                  //update UI
                });
                Navigator.pop(context, image!.path);
              }
            }
          } catch (e) {
            print(e); //show error
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      body: controller == null
          ? const Center(child: Text("Carregando Camera..."))
          : !controller!.value.isInitialized
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CameraPreview(controller!),
    );
  }
}
