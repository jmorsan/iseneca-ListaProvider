import 'package:iseneca/models/models.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/themes/app_theme.dart';
import 'package:iseneca/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';


class AlumnosConvivenciaScreen extends StatelessWidget {
  const AlumnosConvivenciaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children:  [
          const Background(),
          AlumnosConvivencia(user:user),
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

class AlumnosConvivencia extends StatelessWidget {

  final User user;
  const AlumnosConvivencia({super.key, required this.user});

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
          Expanded(child: ListViewAlumnosConvivencia(user:user)),
        ],
      ),
    );
  }
}
class ListViewAlumnosConvivencia extends StatelessWidget {

  final User user;
  const ListViewAlumnosConvivencia({super.key, required this.user});

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
          itemCount: usersProvider.convicenciaList.length,
          itemBuilder: (context, index) => UserConvivenciaItem(convivencia:usersProvider.convicenciaList[index]),
          
        ),
      ),
    );
  }
}

class UserConvivenciaItem extends StatelessWidget {

  final Convivencia convivencia;
  const UserConvivenciaItem({super.key, required this.convivencia});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.hiking,color: Color(0xff005298),),
      title:Text(convivencia.alumno,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w700),) ,
      subtitle: Text('Fecha Inicio: ${convivencia.fechaInicio} \nFecha Fin: ${convivencia.fechaFin}',style: const TextStyle(color: Colors.black,)),
    );
  }
}