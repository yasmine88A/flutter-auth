import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color.fromARGB(255, 110, 39, 176), const Color.fromARGB(255, 164, 81, 195)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
          
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                 
                  Text(
                    "Shruti Anwar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("shruti.anwar@example.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),)
                ],
              ),
              ),
            ListTile(
              leading: Icon(Icons.home,
              color: const Color.fromARGB(255, 39, 139, 176),
              ),
              title: Text("Covid tracker"),
              onTap: () {
                Navigator.pop(context);
              }),
              Divider(
                height: 12,
                color: Colors.purple,
              ),
            ListTile(
              leading: Icon(Icons.chat,
              color: const Color.fromARGB(255, 39, 139, 176),
              ),
              title: Text("Chat"),
              onTap: () {
                Navigator.pop(context);
              }
            ),
            Divider(
                height: 12,
                color: Colors.purple,
              ),
            ListTile(
              leading: Icon(Icons.account_circle,
              color: const Color.fromARGB(255, 39, 139, 176),
              ),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              }
            ),
            Divider(
                height: 12,
                color: Colors.purple,
              ),
            ListTile(
              leading: Icon(Icons.settings,
              color: const Color.fromARGB(255, 39, 139, 176),
              ),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              }
            ),
            Divider(
                height: 12,
                color: Colors.purple,
              ),
            ListTile(
              leading: Icon(Icons.logout,
              color: const Color.fromARGB(255, 39, 139, 176),
              ),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              }
            ),
            Divider(
                height: 12,
                color: Colors.purple,
              ),
          ],),),

           
            
        
        
     
      body: Center(
        child: Text(
          "Welcome to the Home Page!",
          style: TextStyle(
            color: Colors.purple,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}