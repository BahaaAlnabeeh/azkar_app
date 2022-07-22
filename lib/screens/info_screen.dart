import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);

  String _message = 'No Message';

  @override
  Widget build(BuildContext context) {
    ModalRoute? modalRoute = ModalRoute.of(context);
    if(modalRoute != null && modalRoute.settings.arguments != null){
      if(modalRoute.settings.arguments is Map<String, dynamic>){
        Map<String, dynamic> map = modalRoute.settings.arguments as Map<String, dynamic>;
        if(map.containsKey('message')){
          _message = map['message'];
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('عن التطبيق'),
        centerTitle: true,
        automaticallyImplyLeading: true,
        //(عشان يحطلط زر رجوع للصفحة اللي قبل بشكل اوتوماتيكي وهي افتراضيا ترو)
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Text(
          _message,
          style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
