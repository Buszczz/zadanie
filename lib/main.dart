import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String city = "Warszawa"; // POD API
  String temperature = "7°C";
  String description = "Zachmurzenie umiarkowane";

  TextEditingController controller = TextEditingController();

  // Tu później będzie API
  void getWeather() {
    print("DANE Z API");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        children: [

          // TŁO
          Image.asset(
            "assets/images/night.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                const SizedBox(height: 50),

                // SEARCH BAR
                TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Wpisz miasto",
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          city = controller.text;
                        });
                        getWeather();
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // MIASTO
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),

                // TEMPERATURA
                Text(
                  temperature,
                  style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),

                Text(
                  description,
                  style: const TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 30),

                // LISTA DNI
                Expanded(
                  child: ListView(
                    children: [

                      weatherBox("Poniedziałek", "min. 5°", "max. 13°"),
                      weatherBox("Wtorek", "min. 3°", "max. 14°"),
                      weatherBox("Środa", "min. 6°", "max. 15°"),
                      weatherBox("Czwartek", "min. 8°", "max. 15°"),
                      weatherBox("Piątek", "min. 9°", "max. 17°"),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget weatherBox(String day, String min, String max) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [

          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),

          const Spacer(),

          Text(
            min,
            style: const TextStyle(color: Colors.white),
          ),

          const SizedBox(width: 15),

          Text(
            max,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
