import 'package:iseneca/themes/app_theme.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: const [
          BackgroundDashboard(),
          Dashboard(),
        ]));
  }
}

class BackgroundDashboard extends StatelessWidget {
  const BackgroundDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 8],
            colors: [Color(0xff005298), Color(0xff01315a)],
          ),
        ),
        child: const Image(
          image: AssetImage('assets/iseneca .png'),
          width: double.infinity,
          height: 150,
        ),
      ),
      Container(
        color: Colors.white,
      ),
    ]);
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const SizedBox(height: 125),
          FloatingCard(),
          CuadriculaBotones()
        ],
      ),
    );
  }
}

class CuadriculaBotones extends StatelessWidget {
  const CuadriculaBotones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
          ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,color: Colors.blue,),
                          Text("Alumnado del centro",style: TextStyle(color: Colors.blue),),
                        ],
                      ) ,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,color: Colors.blue,),
                          Text("Alumnado del centro",style: TextStyle(color: Colors.blue),),
                        ],
                      ) ,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,color: Colors.blue,),
                          Text("Alumnado del centro",style: TextStyle(color: Colors.blue),),
                        ],
                      ) ,
                    ),
                  ),
                  
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,color: Colors.blue,),
                          Text("Alumnado del centro",style: TextStyle(color: Colors.blue),),
                        ],
                      ) ,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,color: Colors.blue,),
                          Text("Alumnado del centro",style: TextStyle(color: Colors.blue),),
                        ],
                      ) ,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.alarm,color: Colors.blue,),
                          Text("Alumnado del centro",style: TextStyle(color: Colors.blue),),
                        ],
                      ) ,
                    ),
                  ),
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}

class FloatingCard extends StatelessWidget {
  const FloatingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  "Joaquin Moreno Sanchez",
                  style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700 ),
                ),
                margin: EdgeInsets.only(top: 10, left: 10),
              ),
              Container(
                child: Icon(Icons.people,color: Colors.black,),
                margin: EdgeInsets.only(top: 10, left: 20),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("IES Requero",style: TextStyle(color: Colors.blue),),
                margin: EdgeInsets.only(top: 10, left: 10),
              ),
              Container(
                child: Text("Perfil Dirección",style: TextStyle(color: Colors.blue),),
                margin: EdgeInsets.only(top: 10, left: 10),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height:50,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.alarm),
                        Text("Avisos"),
                      ],
                    ),
                  ),
                ),
              ),
              
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height:50,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.alarm),
                        Text("Bandeja de firmas"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
