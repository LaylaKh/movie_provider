import 'package:flutter/material.dart';
import 'package:movie_provider/data/const/const.dart';
import 'package:movie_provider/data/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final vm = context.watch<MovieProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(),
              ElevatedButton(
                onPressed: () {
                  context.read<MovieProvider>().getMovie(controller.text);
                },
                child: const Icon(Icons.search),
              ),
              const SizedBox(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.data?.search?.length ?? 0,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('${vm.data?.search?[index].title}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Image.network(vm.data?.search?[index].poster ?? Const.errorImage,
                          height: 400,
                          width: double.infinity,
                         ),
                         const SizedBox(height: 25),
                         Text('${vm.data?.search?[index].year}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
