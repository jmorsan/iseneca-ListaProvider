import 'package:flutter/material.dart';
import 'package:iseneca/models/models.dart';
class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({
    Key? key, required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child:    Text(
                  user.nombreCompleto,
                  style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700 ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20),
                child: const Icon(Icons.people,color: Colors.black,),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Text(user.instituto,style: const TextStyle(color: Colors.blue),),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Text(user.mail,style: TextStyle(color: Colors.blue),),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                    color: Colors.blue,
                    border: Border(
                    right: BorderSide(
                      color:Colors.white,
                      width: 1.0 
                    )
                  )
                ),
                    height:50,
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