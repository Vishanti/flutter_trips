import 'package:flutter/material.dart';
import 'package:flutter_trips/User/bloc/bloc_user.dart';
import 'package:flutter_trips/Widgets/button_green.dart';
import 'package:flutter_trips/Widgets/gradient_back.dart';
import 'package:flutter_trips/platzi_trips_cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SiginScreen extends StatefulWidget {
  const SiginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  late double screenWidht;
  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    //Obtenemos el tamaño exacto de la pantalla del movil
    screenWidht = MediaQuery.of(context).size.width;
    return _handleCurrentSession();
  }

  //Metodo para establecer la pantalla de inicio
  //en base a si está o no autenticado con google
  Widget _handleCurrentSession() {
    return StreamBuilder(
        //Solicitamos conocer el estatus de la sesion de Firebase
        stream: userBloc!.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snapshot Contiene nuestro objeto User
          if (!snapshot.hasData || snapshot.hasError) {
            return sigInGoogleUI();
          } else {
            //Si hay datos de Usuario autenticado pasa a la pantalla principal de la app de viajes
            return const PlatziTripsCupertino();
          }
        });
  }

  Widget sigInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome \n This is you Travel App",
                  style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {
                    userBloc!.signOut();
                    userBloc!.signIn().then((value) => print(value));
                  }, //El codigo se termina hasta antes del .then, pero esto se hace para depuracion en caso de falla
                  height: 50.0,
                  width: 300.0,
                  border: 40)
            ],
          )
        ],
      ),
    );
  }
}
