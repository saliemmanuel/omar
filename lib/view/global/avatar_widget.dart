// ignore_for_file: depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omar/config/palette.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({super.key});

  @override
  State<AvatarWidget> createState() => AvatarWidgetState();
}

class AvatarWidgetState extends State<AvatarWidget> {
  final ImagePicker _picker = ImagePicker();
  bool avatarIsLoading = false;
  final box = GetStorage();
  String avatar = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return avatar.isEmpty ? nullavatar() : builAvatar();
  }

  showModalBottomSheet() {
    Get.bottomSheet(Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ShadButton(
                      width: Get.width,
                      text: const Text('Camera'),
                      onPressed: () {
                        _pickerImage(ImageSource.camera, context);
                      },
                    ),
                  ),
                  Expanded(
                    child: ShadButton(
                      width: Get.width,
                      text: const Text('Galerie'),
                      onPressed: () {
                        _pickerImage(ImageSource.gallery, context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }

  _pickerImage(ImageSource source, BuildContext context) async {
    Get.back();
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile == null) {
      avatarIsLoading = false;
      setState(() {});
      return;
    }
    CroppedFile? file = await ImageCropper.platform.cropImage(
        cropStyle: CropStyle.circle,
        compressQuality: 40,
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
    if (file == null) {
      avatarIsLoading = false;
      return;
    } else {
      setState(() {});
      compressImage(path: file.path, quality: 66);
    }
  }

  compressImage({required String path, required int quality}) async {
    final newPath = p.join((await getTemporaryDirectory()).path,
        '${DateTime.now()}${p.extension(path)}');
    final result = await FlutterImageCompress.compressAndGetFile(path, newPath,
        quality: quality);
    if (result == null) {
      return;
    } else {
      if (mounted) {
        print("Upload");
        // locator.get<UpdateUserProfilService>().uploadImage(
        //   result,
        //   user.id.toString(),
        //   context,
        //   () {
        //     initAvart();
        //     avatarIsLoading = false;
        //   },
        // );
      }
      setState(() {});
    }
  }

  nullavatar() {
    return Center(
      child: Stack(
        children: [
          avatarIsLoading
              ? const CircleAvatar(
                  radius: 64, child: CircularProgressIndicator())
              : InkWell(
                  onTap: () => showModalBottomSheet(),
                  child: const CircleAvatar(
                      radius: 64,
                      child: HeroIcon(HeroIcons.userCircle, size: 150.0)),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () => showModalBottomSheet(),
              child: CircleAvatar(
                backgroundColor: Palette.primaryColor,
                radius: 20,
                child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: HeroIcon(HeroIcons.pencil, color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  builAvatar() {
    return InkWell(
      onTap: () => showPhoto(image: avatar),
      child: Center(
        child: Stack(
          children: [
            avatarIsLoading
                ? const CircleAvatar(
                    radius: 64, child: CircularProgressIndicator())
                : avatar.isEmpty
                    ? InkWell(
                        onTap: () => showModalBottomSheet(),
                        child: const CircleAvatar(
                            radius: 64,
                            child: HeroIcon(HeroIcons.userCircle, size: 150.0)),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        maxRadius: 60.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(avatar))),
                          ),
                        ),
                      ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () => showModalBottomSheet(),
                child: CircleAvatar(
                  backgroundColor: Palette.primaryColor,
                  radius: 20,
                  child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: HeroIcon(HeroIcons.pencil, color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showPhoto({required String image}) {
    Get.dialog(
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: Palette.primaryColor,
          title: Text(
            'Photo de profil'.tr,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                  showModalBottomSheet();
                },
                child: const Text(
                  "Modifier",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        body: InteractiveViewer(
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                        bottom: MediaQuery.of(context).size.height * 0.1,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.fill),
                      ),
                    ),
                placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(color: Colors.white)))),
      ),
    );
  }
}
