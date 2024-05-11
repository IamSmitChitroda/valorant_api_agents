import 'package:valorant_api_agents/headers.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   void method() {
  //     Future.delayed(
  //       const Duration(milliseconds: 10),
  //       () {},
  //     );
  //   }
  //
  //   super.initState();
  // }

  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AgentsController mutable = Provider.of<AgentsController>(context);
    AgentsController unmutable =
        Provider.of<AgentsController>(context, listen: false);
    SizeController mutable2 = Provider.of<SizeController>(context);
    SizeController unmutable2 =
        Provider.of<SizeController>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
      ),
      home: Scaffold(
        body: Center(
          child: mutable.allData.isNotEmpty
              ? Stack(
                  children: [
                    PageView.builder(
                      itemCount: mutable.allData.length,
                      itemBuilder: (context, index) => Stack(
                        children: [
                          // BG
                          // AnimatedContainer(
                          //   curve: Curves.bounceInOut,
                          //   duration: const Duration(milliseconds: 1000),
                          //   decoration: BoxDecoration(
                          //     gradient: LinearGradient(
                          //       colors: mutable.getColors(index: index),
                          //       begin: Alignment.topLeft,
                          //       end: Alignment.bottomRight,
                          //     ),
                          //   ),
                          // ),
                          // Image
                          SizedBox(
                            height: size.height,
                            width: size.width,
                            child: Container(
                              height: size.height * 0.5,
                              width: size.width * 0.5,
                              alignment: Alignment.center,
                              // width: 1000,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: mutable.getColors(index: index),
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      mutable.allData[index]['fullPortrait']),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    mutable.allData[index]['displayName'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 350,
                                  ),
                                  Text(
                                    mutable.allData[index]['developerName'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 1.1),
                      child: Container(
                        height: size.height * 0.18,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(200),
                            topRight: Radius.circular(200),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0, 0.85),
                      child: CircleAvatar(
                        radius: size.width * 0.15,
                        backgroundColor: Colors.red,
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
