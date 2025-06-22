import 'package:flutter/material.dart';
import 'package:get_api_example/models/get_model.dart';
import 'package:get_api_example/services/get_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommandsModel> commandsModel = [];
  getComments() {
    GetApiServices().getCommentsModel().then(
      (value) => {
        setState(() {
          commandsModel = value!;
        }),
      },
    );
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get API")),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: commandsModel.length,
        itemBuilder: (context, index) {
          final apiData = commandsModel[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.blue[100],
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Row(
                children: [
                  const SizedBox(width: 3,),
                  CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    child: Text(
                      apiData.id.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    width:MediaQuery.of(context).size.width/1.175,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 1,
                        apiData.name.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        apiData.email.toString(),
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        apiData.body.toString(),
                      ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
