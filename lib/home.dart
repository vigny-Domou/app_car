import 'package:card/feature/class_car.dart';
import 'package:card/widgets/car.dart';
import 'package:card/widgets/divider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();

  double kilometres = 0;
  bool moteurElectrique = true;
  int places = 2;
  String message = "";
  Car? carSelected;
 
  final Map<String, bool> options = {
    
  "GPS": false,
  "Caméra de recul": false,
  "Clim par zone": false,
  "Régulateur de vitesse": false,
  "Toit ouvrant": false,
  'Siège chauffant': false,
  "Roue de secours": false,
  "Jantes alu": false
};


 void validate() {
  carSelected = cars.firstWhere(
    (car) => car.isElectric == moteurElectrique && car.places == places,
    orElse: () => cars.first,
  );
    if (kilometres > 15000 && moteurElectrique) {
      message =
          "Vous devriez penser à un moteur thermique comme ${carSelected!.name} compte tenu du nombre de kilomètres";
    } else 
    if (kilometres < 5000 && !moteurElectrique) {
      message =
          "Vous faites peu de kilomètres, pensez à regarder les voitures électriques comme ${carSelected!.name} ";
    } else {
      message = "Voici la voiture faite pour vous de marque ${carSelected!.name} ";
    }

    carSelected = cars.firstWhere(
      (car) => car.isElectric == moteurElectrique && car.places == places,
      orElse: () => cars.first,
    );

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 227, 235, 241),
        title: Text("Configuration de voitures", style: TextStyle(fontSize: 18),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(3),
            child: ElevatedButton(
              onPressed: validate,
              child: const Text("Je valide", style: TextStyle(color: Color.fromARGB(255, 80, 109, 133)),),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (carSelected != null) buildResultCard(message, nameController, carSelected!) ,


            const SizedBox(height: 20),
             Text("Entrez votre prénom"),
            TextField(controller: nameController),

            const SizedBox(height: 20),
                  Text("Nombre de kilomètres annuel: ${kilometres.toInt()}"),
                  Slider(
                    value: kilometres,
                    min: 0,
                    max: 50000,
                    divisions: 100,
                    onChanged: (value) {
                      setState(() => kilometres = value);
                    },
                  ),
                  divider(), 

                 SwitchListTile(
                title: const Text("Moteur électrique"),
                value: moteurElectrique,
                onChanged: (value) {
                  setState(() => moteurElectrique = value);
                },
              ),
              divider(),
              Padding(
                padding: EdgeInsets.all(10),
                 child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nombre de places: $places"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [2, 4, 5, 7].map((value) {
                      return Radio<int>(
                        value: value,
                        groupValue: places,
                        onChanged: (val) {
                          setState(() => places = val!);
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            
                ),
                divider(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                "Options du véhicule",
                //style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            ...options.keys.map((key) {
              return CheckboxListTile(
                title: Text(key),
                value: options[key],
                onChanged: (value) {
                  setState(() => options[key] = value!);
                },
              );
            }).toList(),
              
                  ]
        ),
      ),
    );
  }
}


