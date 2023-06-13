import 'package:caronapp/screens/aguardandoinicio.dart';
import 'package:caronapp/screens/atividades.dart';
import 'package:caronapp/screens/cadastrousuario.dart';
import 'package:caronapp/screens/cadastroveiculo.dart';
import 'package:caronapp/screens/contatosuporte.dart';
import 'package:caronapp/screens/destino.dart';
import 'package:caronapp/screens/detalhescarona.dart';
import 'package:caronapp/screens/escolherveiculo.dart';
import 'package:caronapp/screens/esquecisenha.dart';
import 'package:caronapp/screens/faq.dart';
import 'package:caronapp/screens/fimcarona.dart';
import 'package:caronapp/screens/detalhesdaviagem.dart';
import 'package:caronapp/screens/historicodecaronas.dart';
import 'package:caronapp/screens/login.dart';
import 'package:caronapp/screens/teste.dart';
import 'package:caronapp/screens/oferecercarona.dart';
import 'package:caronapp/screens/perfilusuario.dart';
import 'package:caronapp/screens/pedircarona.dart';
import 'package:caronapp/screens/termoscondicoes.dart';
import 'package:caronapp/store/address_store.dart';
import 'package:caronapp/store/car_store.dart';
import 'package:caronapp/store/user_store.dart';
import 'package:caronapp/store/viagem_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => UserStore(),
        ),
        Provider(
          create: (context) => AddressStore(),
        ),
        Provider(
          create: (context) => CarStore(),
        ),
        Provider(
          create: (context) => ViagemStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VemJunto',
        theme: ThemeData(
          fontFamily: 'Satochi',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/teste': (context) => Teste(),
          '/esquecisenha': (context) => EsqueciSenha(),
          '/cadastrousuario': (context) => CadastroUsuario(),
          '/termosecondicoes': (context) => TermosCondicoes(),
          '/pedircarona': (context) => PedirCarona(),
          '/destino': (context) =>
              Destino(destinoController: TextEditingController()),
          '/detalhescarona': (context) => DetalhesCarona(),
          '/aguardandoinicio': (context) => AguardandoInicio(),
          '/fimcarona': (context) => FimCarona(),
          '/oferecercarona': (context) => OferecerCarona(),
          '/escolherveiculo': (context) => EscolherVeiculo(),
          '/cadastroveiculo': (context) => CadastroVeiculo(),
          '/atividades': (context) => Atividades(),
          '/perfilusuario': (context) => PerfilUsuario(),
          '/contatosuporte': (context) => ContatoSuporte(),
          '/faq': (context) => Faq(),
          '/historicocaronas': (context) => HistoricoDeCaronas(),
          '/detalhesviagem': (context) => DetalhesDaViagem(),
        },
      ),
    );
  }
}
