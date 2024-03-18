import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical Check-Up',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 104, 215)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Medical Check-Up Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Kelas untuk merepresentasikan paket medis
class MedicalPackage {
  final String name;
  final String description;
  final int price;

  MedicalPackage({
    required this.name,
    required this.description,
    required this.price,
  });
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController =
      TextEditingController(text: 'Cari Layanan Kesehatan');

  // Daftar paket medis
  final List<MedicalPackage> medicalPackages = [
    MedicalPackage(
      name: 'Paket A',
      description: 'Skrinning Jantung',
      price: 100000,
    ),
    MedicalPackage(
      name: 'Paket B',
      description: 'Skrinning THT',
      price: 150000,
    ),
    MedicalPackage(
        name: 'Paket C', description: 'Ibu dan Anak', price: 1000000),
    MedicalPackage(
        name: 'Paket D', description: 'Skrinning Umum', price: 990000),

    // Tambahkan paket medis lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          iconSize: 26,
          alignment: Alignment.topLeft,
        ),
        backgroundColor: const Color.fromARGB(255, 65, 100, 170),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medical Check-Up',
                // textAlign: TextAlign.start,
                // style: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   wordSpacing: 2,
                //   fontSize: 25,
                // ),
                //style: GoogleFonts.nunito(TextStyle(fontWeight: FontWeight.bold, wordSpacing: 2, fontSize: 25)),
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                  fontSize: 25,
                )),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 206, 231, 253),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Cari Layanan Kesehatan',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: medicalPackages.length,
                  itemBuilder: (context, index) {
                    final package = medicalPackages[index];
                    return Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              package.name,
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23)),
                              // style: const TextStyle(
                              //   fontWeight: FontWeight.bold,
                              //   fontSize: 23,
                              // ),
                            ),
                            const Divider(),
                            Text(
                              package.description,
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              )),
                              // style: const TextStyle(
                              //     fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Rp ${package.price}',
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                    // style: const TextStyle(
                                    //   fontWeight: FontWeight.bold,
                                    //   fontSize: 18,
                                    // ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                ElevatedButton(
                                  onPressed: () {
                                    // Implementasi fungsi untuk tombol "Detail"
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 206, 231, 253)),
                                  child: Text(
                                    'Detail',
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                    )),
                                    // style: TextStyle(
                                    //   color: Colors.black,
                                    //   fontStyle: FontStyle.italic,
                                    // ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
