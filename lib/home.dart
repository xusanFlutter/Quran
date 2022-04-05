import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:listen/ProductDataModel.dart';
import 'package:listen/details.dart';
import 'package:listen/tasbeh.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/logo.png'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const Tasbeh(),
                ),
              );
            },
            icon: const Icon(Icons.watch),
          ),
          const SizedBox(width: 20),
        ],
        backgroundColor: Colors.green,
        title: const Text(
          'Quron Eshiting',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ProductDataModel>;
            return ListView.builder(
              // ignore: unnecessary_null_comparison
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Details(
                          model: items[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: 150,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            '${items[index].nomor} - sura',
                            style: const TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${items[index].ayat}  oyat',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${items[index].name}  ',
                            style: const TextStyle(
                              fontSize: 27,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${items[index].asma}',
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 40),
                              const Text(
                                'Nozil qilingan joyi: ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '${items[index].type}'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(width: 40),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                // return Card(
                //   elevation: 5,
                //   margin:
                //       const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                //   child: Container(
                //     padding: const EdgeInsets.all(8),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         // Container(
                //         //   width: 50,
                //         //   height: 50,
                //         //   child: Image(
                //         //     image: NetworkImage(items[index].imageURL.toString()),
                //         //     fit: BoxFit.fill,
                //         //   ),
                //         // ),
                //         Expanded(
                //           child: Container(
                //             padding: const EdgeInsets.only(bottom: 8),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Padding(
                //                   padding:
                //                       const EdgeInsets.only(left: 8, right: 8),
                //                   child: Text(
                //                     items[index].asma.toString(),
                //                     style: const TextStyle(
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                 ),
                //                 // Padding(
                //                 //   padding: EdgeInsets.only(left: 8, right: 8),
                //                 //   child: Text(items[index].price.toString()),
                //                 // ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString('assets/list.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}
