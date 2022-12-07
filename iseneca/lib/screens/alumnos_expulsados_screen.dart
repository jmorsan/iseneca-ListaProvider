import 'package:iseneca/models/models.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/themes/app_theme.dart';
import 'package:iseneca/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';


class AlumnosExpulsadosScreen extends StatelessWidget {
  const AlumnosExpulsadosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children:  [
          const Background(),
          AlumnosExpulsados(user:user),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 35,
        selectedItemColor: const Color.fromRGBO(0, 82, 150, 1.000),
        unselectedItemColor: const Color.fromRGBO(164,164,164, 1),
        selectedFontSize: 12,
        unselectedFontSize: 11,
        onTap: (value) {
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Agenda',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Comunicaciones',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
        ],

      ),

    );
  }
}



class AlumnosExpulsados extends StatelessWidget {
  final User user;
  const AlumnosExpulsados({super.key, required this.user});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children:  [
          const SizedBox(height: 125),
          ProfileCard(user:user),
          Expanded(child: ListViewAlumnosExpulsados(user:user)),
        ],
      ),
    );
  }
}

class ListViewAlumnosExpulsados extends StatelessWidget {
  final User user;
  const ListViewAlumnosExpulsados({super.key, required this.user});


  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsersProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: usersProvider.expulsadosList.length,
          itemBuilder: (context, index) => UserExpulsadosItem(expulsado:usersProvider.expulsadosList[index]),
          
        ),
      ),
    );
  }
}

class UserExpulsadosItem extends StatelessWidget {
  final Expulsados expulsado;
  const UserExpulsadosItem({super.key, required this.expulsado});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.face_retouching_off,color: Colors.black,),
      title:Text(expulsado.alumno,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700),) ,
      subtitle: Text('Fecha Inicio: ${expulsado.fechaInicio} \nFecha Fin: ${expulsado.fechaFin}',style: const TextStyle(color: Colors.black,)),
    );
  }
}