import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_card.dart';
import 'local data/database.dart';
import 'provider/home_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<Category>>(
          stream:
          Provider.of<HomeProvider>(context, listen: false).getCategories(),
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData && (snapshot.data?.isNotEmpty ?? false)) {
              return ListView.separated(
                shrinkWrap: false,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    bottom: kBottomNavigationBarHeight + 26, top: 16),
                itemBuilder: (_, index) => CategoryCard(
                    title: snapshot.data?[index].title ?? '',
                    des: snapshot.data?[index].description ?? ''),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 8,
                ),
                itemCount: snapshot.data?.length ?? 0,
              );
            } else {
              return Center(
                child: Text(
                  "No Category",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<HomeProvider>(context, listen: false).addNewCategory(),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}