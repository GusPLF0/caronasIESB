import 'package:caronapp/const.dart';
import 'package:caronapp/models/carmodel.dart';
import 'package:caronapp/models/savedcarmodels.dart';
import 'package:caronapp/widgets/carmodeltile.dart';
import 'package:flutter/material.dart';
import '../widgets/customsecondarybutton.dart';

class EscolherVeiculo extends StatefulWidget {
  const EscolherVeiculo({super.key});

  @override
  _EscolherVeiculo createState() => _EscolherVeiculo();
}

class _EscolherVeiculo extends State<EscolherVeiculo> {
  SavedCarModels savedCarModels = SavedCarModels();

  void deleteCar(CarModel car) {}

  int _selectedIndex = 1;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<CarModel> cars = savedCarModels.savedCarModels;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 32.0),
                child: Text(
                  'Oferecer Carona',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5757),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 24.0),
              child: Text(
                'Escolha o veículo desejado',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 16.0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFf7f5f5),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Adicionar novo',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return CarModelTile(
                    carModel: car,
                    onPressed: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
