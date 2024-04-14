import 'package:flutter/material.dart';
import 'package:flutter_task/constants/colors.dart';
import 'package:flutter_task/models/to_do.dart';
import 'package:flutter_task/widgets/todo_item.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController newTask = TextEditingController();
  List<ToDo> lista = [
    ToDo(desciption: 'Lavar Ropa', status: true),
    ToDo(desciption: 'Lavar Platos', status: true),
    ToDo(desciption: 'Pasear Al perro'),
    ToDo(desciption: 'Limpiar computadora', status: true),
    ToDo(desciption: 'Lavar Baño'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: buildAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            searchBar(),
            Expanded(
              child: item(),
            ),
            Container(
              height: 80,
              child: TextField(
                onSubmitted: (value) => {
                  if (value.isNotEmpty){
                    lista.add(ToDo(desciption: value.toString()))
                  },
                  setState(() => {},),
                  newTask.clear()
                },
                  decoration: InputDecoration(
                    hintText: "Añadir",
                    suffixIcon: InkWell(
                      onTap: () => 
                      { 
                        print("Added")
                      }, 
                      child: Icon(Icons.add)
                    ),
                    ),
                ),
              color: jGreen,
            )
          ],
        ),
      ),
    );
  }

  ListView item() {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
              return TodoItem(todo: lista[index], status: lista[index].status);
          }
      );
  }

  Container searchBar() {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25) ,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 25,
                  minHeight: 25
                ),
                hintText: "buscar",
                border: InputBorder.none
              ),
            ),
          );
  }

  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 27,
                //AssetImage('assets/images/avatar2.jpg')
                backgroundImage: NetworkImage('https://i.pinimg.com/originals/fe/35/9a/fe359a02d751f3d045a493bbc5bf599c.jpg'),
              ),
              SizedBox(width: 20,),
              Text('HOLA MUNDO', 
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),                  
            ]),
            actions: [
              Icon(Icons.more_vert_rounded)
            ],
      );
  }
}