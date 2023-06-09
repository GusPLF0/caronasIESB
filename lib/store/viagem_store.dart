import 'package:caronapp/store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'address_store.dart';
import 'car_model.dart';

part 'viagem_store.g.dart';

class ViagemStore = _ViagemStoreBase with _$ViagemStore;

abstract class _ViagemStoreBase with Store {
  //data
  @observable
  String data = '';

  //horario
  @observable
  String horario = '';

  @action
  void setData(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    data = dateFormat.format(dateTime);
  }

  @action
  void setHorario(DateTime dateTime) {
    DateFormat timeFormat = DateFormat.Hm();
    horario = timeFormat.format(dateTime);
  }

  //partida
  @observable
  AddressStore partida = AddressStore();

  //chegada
  @observable
  AddressStore chegada = AddressStore();

  @action
  void setPartida(String apelido, String rua, String numero) {
    partida.setApelido(apelido);
    partida.setRua(rua);
    partida.setNumero(numero);
  }

  @action
  void setChegada(String apelido, String rua, String numero) {
    chegada.setApelido(apelido);
    chegada.setRua(rua);
    chegada.setNumero(numero);
  }

  //motorista
  @observable
  UserStore motorista = UserStore();

  @action
  void setMotorista(String nome) {
    motorista.setNome(nome);
  }

  //carro
  @observable
  Car? carro;

  @action
  void setCarro(Car carroSelecionado) {
    carro = carroSelecionado;
  }

  //passageiros
  @observable
  ObservableList<UserStore> passageiros = ObservableList<UserStore>();

  @action
  void addPassageiro(UserStore passageiro) {
    if (passageiros.length < 4) {
      passageiros.add(passageiro);
    }
  }

  @action
  void removePassageiro(UserStore passageiro) {
    passageiros.remove(passageiro);
  }
}
