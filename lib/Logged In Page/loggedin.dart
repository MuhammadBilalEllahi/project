import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          // Builder(
          //   builder: (context) => IconButton(
          //     icon: const Icon(Icons.filter),
          //     onPressed: () => Scaffold.of(context).openEndDrawer(),
          //     tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          //   ),
          // ),
        ],
        // automaticallyImplyLeading: false,
        title: const Text(""),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Hi ${user.email!}"),
            ),
            // TextButton(onPressed: (){
            //    FirebaseAuth.instance.signOut();
            //    print(FirebaseAuth.instance.currentUser);

            // }, child: const Text("Sign out")),
            MaterialButton(onPressed: () async{
            await  FirebaseAuth.instance.signOut();
            print(FirebaseAuth.instance.currentUser);

            },
             color: Colors.grey.shade200,
             child: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.abc))
            ],
          ),
        ),
      ),
      // endDrawer:  Drawer(
      //   shape: ,
      // ),
    );
  }
}
