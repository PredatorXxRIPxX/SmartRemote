import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartcontroller/controllers/controller.dart';
import 'package:smartcontroller/components/cardinfo.dart';
import '../controllers/controller.dart';

class Terrain extends StatefulWidget {
  const Terrain({super.key});

  @override
  State<Terrain> createState() => _TerrainState();
}



class _TerrainState extends State<Terrain> {

  @override
  void initState() {
    listinigData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            title: const Text(
              "Terrain",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          )),
      body: Stack(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      Cardinfo(
                          titleCard: "cps1",
                          valueCard: cps.toString(),
                          iconCard: const Icon(Icons.place_outlined
                        )
                      ),
                      Cardinfo(
                          titleCard: "cps2",
                          valueCard: cps.toString(),
                          iconCard: const Icon(Icons.place_outlined
                        )
                      ),
                      Cardinfo(
                          titleCard: "cps3",
                          valueCard: cps.toString(),
                          iconCard: const Icon(Icons.place_outlined
                        )
                      ),
                      Cardinfo(
                          titleCard: "cps4",
                          valueCard: cps.toString(),
                          iconCard: const Icon(Icons.place_outlined
                        )
                      ),
                      Cardinfo(
                          titleCard: "cps5",
                          valueCard: cps.toString(),
                          iconCard: const Icon(Icons.place_outlined
                        )
                      ),
                      Cardinfo(
                          titleCard: "cps6",
                          valueCard: cps.toString(),
                          iconCard: const Icon(Icons.place_outlined
                        )
                      ),
                      Cardinfo(
                          titleCard: "cps7",
                          valueCard: cps.toString(),
                          iconCard: const Icon(Icons.place_outlined
                        )
                      ),
                      Cardinfo(
                          titleCard: "water Level",
                          valueCard: capteur_water.toString(),
                          iconCard: const Icon(Icons.water
                        )
                      ),
                      Cardinfo(titleCard: "pompe3", valueCard: pompe3.toString(), iconCard: const  Icon(Icons.energy_savings_leaf_outlined)),
                      Cardinfo(titleCard: "pompe4", valueCard: pompe5.toString(), iconCard: const  Icon(Icons.energy_savings_leaf_outlined)),
                      Cardinfo(titleCard: "pompe5", valueCard: pompe5.toString(), iconCard: const Icon(Icons.energy_savings_leaf_outlined)),

                    ],
          )
        )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/terrain');
          } else {
            Navigator.pushReplacementNamed(context, '/');
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Serre',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              color: Colors.deepPurple,
            ),
            label: 'Terrain',
          ),
        ],
      ),
    );
  }
}
