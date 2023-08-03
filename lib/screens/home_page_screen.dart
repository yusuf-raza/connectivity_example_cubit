import 'package:connectivity_app_cubit/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connectivity app using Cubit"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.gainedState) {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  backgroundColor: Colors.green,
                  content: const Text("Connected"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      child: const Text(
                        'Agree',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]));

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet connected"),
                backgroundColor: Colors.green,
              ));
            } else {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  backgroundColor: Colors.red,
                  content: const Text("Connected"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentMaterialBanner();
                      },
                      child: const Text(
                        'Agree',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet disconnected"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state == InternetState.gainedState) {
              return const Text("Connected");
            } else if (state == InternetState.lostState) {
              return const Text("Disconnected");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
