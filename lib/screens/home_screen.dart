import 'package:azkar_app/screens/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  String _content = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'مسبحة الأذكار',
          style: GoogleFonts.arefRuqaa(),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          PopupMenuButton<String>(onSelected: (String value) {
            if (_content != value) {
              setState(() {
                _content = value;
                _counter = 0;
              });
            }
          },
              //offset: , //(عشان اغير مكانها وأنزلها شوي)
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'أستغفر الله',
                    child: Text(
                      'أستغفر الله',
                      style: GoogleFonts.arefRuqaa(),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    value: 'الحمد لله',
                    child: Text(
                      'الحمد لله',
                      style: GoogleFonts.arefRuqaa(),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    value: 'سبحان الله',
                    child: Text(
                      'سبحان الله',
                      style: GoogleFonts.arefRuqaa(),
                    ),
                  ),
                ];
              }),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/info_screen',
                arguments: {'message': 'Info Screen'},
              );
            },
            icon: const Icon(Icons.info),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FaqsScreen(message: 'FAQs Screen'),
                ),
              );
            },
            icon: const Icon(Icons.question_answer),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7D9D9C),
              Color(0xFF576F72),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(35),
                  color: Color(0xFFE4DCCF),
                  image: DecorationImage(
                    image: AssetImage('images/azkar.jpg'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 6, // (درجة تشتت اللون)
                      offset: Offset(0, 6), // (صادي ، سيني)
                    ),
                    // BoxShadow(
                    //   color: Colors.pink.withOpacity(0.5),
                    //   blurRadius: 6,
                    //   offset: Offset(0,-6),
                    // ),
                  ]),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 6,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 60,
                    alignment: Alignment.center,
                    color: const Color(0xFFE4DCCF),
                    child: Text(
                      _counter.toString(),
                      style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ++_counter;
                        });
                        // print('Counter: $_counter');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFFCF8E8),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'تسبيح',
                        style: GoogleFonts.arefRuqaa(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => _counter = 0);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF94B49F),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'إعادة',
                        style: GoogleFonts.amiri(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _counter += 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
