import 'package:caronapp/const.dart';
import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:caronapp/services/viagem_service.dart';
import 'package:caronapp/store/address_store.dart';
import 'package:caronapp/store/car_model.dart';
import 'package:caronapp/store/status_viagem.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../widgets/bottonnav.dart';
import '../widgets/custombutton.dart';
import '../widgets/customsearchfield.dart';
import '../widgets/customtimepicker.dart';
import '../widgets/kmformfield.dart';

class OferecerCarona extends StatefulWidget {
  OferecerCarona({Key? key}) : super(key: key);

  @override
  _OferecerCaronaState createState() => _OferecerCaronaState();
}

class _OferecerCaronaState extends State<OferecerCarona> {
  TimeOfDay? _selectedTime;
  int _km = 0;
  final _form = GlobalKey<FormState>();
  Car? selectedCar;

  void _submitForm(BuildContext context) {
    if (!_form.currentState!.validate()) {
      return;
    }

    ViagemService viagemService = ViagemService();
    AddressStore addressStore = AddressStore();

    addressStore.setApelido("Apelido");
    addressStore.setNumero("Numero");
    addressStore.setRua("Rua");

    viagemService.saveTrip(
        data: "Hoje",
        horario: "Agora",
        partida: addressStore,
        chegada: addressStore,
        carro: selectedCar,
        status: StatusViagem.emCurso);
    Navigator.pushReplacementNamed(context, '/aguardandoinicio');
  }

  @override
  Widget build(BuildContext context) {
    // Obter o argumento passado da terceira tela
    final arguments = ModalRoute.of(context)!.settings.arguments;

    // Verificar se o argumento é do tipo Car
    if (arguments != null && arguments is Car) {
      selectedCar = arguments;
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 32.0),
                    child: Text(
                      'Oferecer Carona',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                        color: redIdColor,
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text('Carro em uso',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                //botao - adicione um carro
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 24, 0, 0),
                  child: SizedBox(
                    height: 60,
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/escolherveiculo"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            selectedCar != null
                                ? selectedCar!.marca.toString()
                                : 'Adicione um carro',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                              child: Icon(
                                Icons.add,
                                size: 24,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                //partida
                CustomSearchField(
                  labelText: 'Local de partida',
                  keyboardType: TextInputType.text,
                  backgroundColor: Colors.white,
                  onSubmitted: (value) {},
                ),
                CustomSearchField(
                  labelText: 'Destino final',
                  keyboardType: TextInputType.text,
                  backgroundColor: Colors.white,
                  onSubmitted: (value) {},
                ),
                CustomTimePicker(
                  labelText: 'Horário de saída',
                  initialValue: _selectedTime,
                  onSaved: (time) {
                    _selectedTime = time;
                  },
                  validator: (time) {
                    if (time == null) {
                      return 'É necessário selecionar um horário';
                    }
                    return null;
                  },
                  context: context,
                  backgroundColor: Colors.white,
                  keyboardType: TextInputType.text,
                ),
                KmFormField(
                  context: context,
                  labelText: 'Enter a number',
                  keyboardType: TextInputType.number,
                  backgroundColor: Colors.grey[200]!,
                  onSubmitted: (value) {},
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 40, top: 7),
                    child: CustomButton(
                      text: 'VemJunto',
                      onPressed: () => _submitForm(context),
                    ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(selectedIndex: 1),
    );
  }
}
