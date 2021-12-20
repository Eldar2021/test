import 'package:flutter/material.dart';
import 'package:test_app/model/test_model.dart';
import 'package:test_app/repository/test_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TestRepo repo = TestRepo();

  @override
  void initState() {
    super.initState();
    repo.fetchTests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test_key"),
      ),
      body: FutureBuilder<List<HydraMember>?>(
        future: repo.fetchTests(), // async work
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading....');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ItemWidget(list: snapshot.data ?? []);
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          repo.fetchTests();
        },
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    required this.list,
    Key? key,
  }) : super(key: key);

  final List<HydraMember> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final HydraMember item = list[index];
        return Card(
          child: ListTile(
            title: Text(item.name),
            subtitle: CategoryItem(list: item.categoriesItem),
          ),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final CategoriesItem item = list[index];
        return ListTile(
          title: Text(item.name),
          subtitle: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: item.categories.length,
            itemBuilder: (context, index) {
              Categories categories = item.categories[index];
              return Text("    ${categories.name}");
            },
          ),
        );
      },
    );
  }
}
