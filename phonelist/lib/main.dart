import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Person{
  final String name;
  final String number;

  Person ({required this.name, required this.number});
}

class MyApp extends StatelessWidget {

  final List<Person> personList = [
    Person(
      name: 'Harry Potter',
      number: '0123456789'
    ),
    Person(
      name: 'Ron Weasley',
      number: '9876543210'
    ),
    Person(
      name: 'Hermione Granger',
      number: '1112223334',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange),
      ),
      debugShowCheckedModeBanner: false,
      home: PhoneList(personList: personList),
    );
  }
}

class PhoneList extends StatefulWidget {
  final List<Person> personList;

  const PhoneList({required this.personList});

  @override
  State<PhoneList> createState() => _PhoneListState();
}

class _PhoneListState extends State<PhoneList> {
  void _handlePersonAdded(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone List'),
        elevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.person_add_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPersonPage(
                      personList: widget.personList,
                      onPersonAdded: _handlePersonAdded,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.personList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(
                widget.personList[index].name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.phone,
                  size: 18),
                  Text(
                    widget.personList[index].number,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonPage(person: widget.personList[index]),
                    fullscreenDialog: true,
                  ),
                );
              },
            );
          }
        ),
      ),
    );
  }
}

class AddPersonPage extends StatefulWidget{
  final List<Person> personList;
  final Function() onPersonAdded;


  AddPersonPage ({required this.personList, required this.onPersonAdded});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Add A Person to your List'),
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.close_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFEAEEF5),
                prefixIcon: Icon(Icons.person_rounded),
                hintText: 'Name',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                )
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFEAEEF5),
                prefixIcon: Icon(Icons.phone),
                hintText: 'Number',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                )
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 160,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  widget.personList.add(Person(name: nameController.text, number: numberController.text));
                  widget.onPersonAdded();
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonPage extends StatelessWidget{
  final Person person;

  const PersonPage({required this.person});

  String _getInitials(String name) {
    final nameParts = name.split(" ");
    if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    } else if (nameParts.length > 1) {
      return nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase();
    } else {
      return "";
    }
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: Colors.deepOrange[900],
              foregroundColor: Colors.white,
              radius: 50,
              child: Text(
                _getInitials(person.name),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height:10),
            Container(
              child: Text(
                person.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height:50),
            InkWell(
              onTap: () {
                print('ni');
              },
              splashColor: Colors.deepOrange[400],
              child: Container(
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.phone_callback_rounded),
                    ),
                    SizedBox(width: 10),
                    Text(
                      person.number,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

