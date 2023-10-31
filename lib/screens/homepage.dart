import 'package:fire_base_app/core/providers/services_provider.dart';
import 'package:fire_base_app/screens/auth/loginpage.dart';
import 'package:fire_base_app/screens/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final services = Provider.of<ServicesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Signed in as ${services.user?.email}'),
        actions: [
          IconButton(
            splashRadius: 26,
            icon: const Icon(Icons.logout),
            onPressed: () {
              services.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Space(),
            Expanded(
              child: FutureBuilder(
                future: services.getDocId(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.builder(
                    itemCount: services.docIds.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.grey[400],
                          contentPadding: const EdgeInsets.all(10),
                          title:
                              services.getUserDetails(services.docIds[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
