// Remplacer la page d'accueil par ceci

// TODO 1 : Modifier la cellule _ListProductsContent pour qu'elle ressemble à https://devinci-online.brightspace.com/d2l/le/lessons/44502/topics/167610

// TODO 2 : Modifier l'autre bloc pour ajouter des documents

// Evenements
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductsListEvent {}

class ListProductsEvent extends ProductsListEvent {}

abstract class ProductsListState {
  final List<ProductListItem> history;

  ProductsListState(this.history);

  ProductsListState.empty() : this.history = List.empty();
}

// Etats / States
class ProductsListResultState extends ProductsListState {
  ProductsListResultState(List<ProductListItem> history) : super(history);

  ProductsListResultState.empty() : super.empty();
}

class ProductListItem {
  final String barcode;
  final String name;
  final String brand;
  final String thumbnail;
  final String nutriscore;

  ProductListItem.fromAPI(Map<dynamic, dynamic> api)
      : barcode = api['Barcode'],
        name = api['Name'],
        brand = api['Brand'],
        thumbnail = api['Thumbnail'],
        nutriscore = api['Nutriscore'];
}

// Bloc
class ProductsHistoryBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsHistoryBloc() : super(ProductsListResultState.empty());

  void listHistory() {
    add(ListProductsEvent());
  }

  @override
  Stream<ProductsListResultState> mapEventToState(
      ProductsListEvent event) async* {
    if (event is ListProductsEvent) {
      Client client = Client();

      client
          .setEndpoint(
              'https://appwrite.formation-flutter.fr/v1') // Your Appwrite Endpoint
          .setProject('6058693c4d6df') // Your project ID
          .setSelfSigned();

      try {
        var createSession = await Account(client)
            .createSession(email: 'email@example.com', password: 'password');

        await client.init();

        Database database = Database(client);

        var response = await database.listDocuments(
          collectionId: '605c934e47274',
        );

        List<ProductListItem> history = (response.data['documents'] as List)
            .map((dynamic el) => ProductListItem.fromAPI(el))
            .toList(growable: false);

        yield ProductsListResultState(history);
      } catch (err) {
        print(err);
      }
    }
  }
}

// Vue
class ListProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsHistoryBloc(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
              builder: (BuildContext context, ProductsListState state) {
                if (state.history.isEmpty) {
                  // TODO A remplacer par la vue vide
                  return Center(child: Text("Vide"));
                } else {
                  return _ListProductsContent();
                }

                return Text(state.history.length.toString());
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                BlocProvider.of<ProductsHistoryBloc>(context).listHistory();
              },
            ),
          );
        },
      ),
    );
  }
}

class _ListProductsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
          builder: (BuildContext context, ProductsListState state) {
        return ListView.builder(
          itemCount: state.history.length,
          itemBuilder: (BuildContext context, int position) {
            var item = state.history[position];

            // TODO Modifier la vue
            // https://devinci-online.brightspace.com/d2l/le/lessons/44502/topics/167610
            return Container(
              padding: const EdgeInsets.all(42.0),
              child: Text(
                '$position : ${item.barcode}',
              ),
            );
          },
        );
      }),
    );
  }
}

// Créer un nouvelle entrée
/*response = await database.createDocument(
          collectionId: '605c934e47274',
          data: {
            'Barcode': '123465',
            'Name': 'Nom',
            'Brand': 'Marque',
            'Thumbnail': 'http://'
          },
          read: ['*'],
          write: ['*'],
        );*/
