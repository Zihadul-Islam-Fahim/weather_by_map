import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../state_holders/launch_url_controller.dart';
import '../utility/utillities.dart';

PopupMenuButton<dynamic> developerInfoPopup() {
  return PopupMenuButton(
    position: PopupMenuPosition.under,
    icon: const Icon(
      Icons.error_outline,
      color: Colors.black,
      size: 25,
    ),
    itemBuilder: (context) {
      return [
        PopupMenuItem(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/web.png', width: Get.height * 0.09),
                    const Text(
                      "Unique Feature",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Text(
                Utility().appDescription,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  overflow: TextOverflow.clip,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Developer Info',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins'),
                ),
              ),
              const Row(
                children: [
                  Text(
                    'Developed By: ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Zihadul Islam Fahim ',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse(
                            "https://www.facebook.com/FahimXihad?mibextid=ZbWKwL"),
                      );
                    },
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue.shade900,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (!await launchUrl(LaunchUrlController().mailLaunch)) {
                        throw Exception(
                            'Could not launch ${LaunchUrlController().mailLaunch}');
                      }
                    },
                    icon: Icon(
                      Icons.mail_outline,
                      color: Colors.redAccent.shade700,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      if (!await launchUrl(LaunchUrlController().phoneLaunch)) {
                        throw Exception(
                            'Could not launch ${LaunchUrlController().phoneLaunch}');
                      }
                    },
                    icon: const Icon(
                      Icons.call,
                      size: 40,
                      color: Colors.teal,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await launchUrl(
                        Uri.parse('https://wa.me/qr/6GVMNFB52YWYL1'),
                      );
                    },
                    child: Image.asset(
                      'assets/whatsapp.jpg',
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];
    },
  );
}
