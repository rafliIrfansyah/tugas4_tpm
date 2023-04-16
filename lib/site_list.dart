import 'package:flutter/material.dart';
import 'site_data.dart';
import 'site_detail.dart';
import 'favorite.dart';

List<Website> favoritesSite = [];

class Website {
  final String name;
  final String pageUrl;
  final String image;
  final String description;
  Website({required this.name, required this.pageUrl, required this.image, required this.description});
}

class SiteList extends StatefulWidget {
  const SiteList({super.key});
  @override
  SiteListState createState() => SiteListState();
}

class SiteListState extends State<SiteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Sites'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Favorite(favorites: favoritesSite),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height) * 1.68, 
        ),
        itemCount: listSite.length,
        itemBuilder: (context, index){
          final SiteData data = listSite[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => SiteDetail(data: data),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      data.image,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                  ),
                 IconButton(
                  icon: favoritesSite.any((website) => website.pageUrl == data.pageUrl)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    setState(() {
                      if (favoritesSite.any((website) => website.pageUrl == data.pageUrl)) {
                        favoritesSite.removeWhere((website) => website.pageUrl == data.pageUrl);
                      } else {
                        favoritesSite.add(Website(name: data.name, pageUrl: data.pageUrl, image: data.image, description: data.description));
                      }
                    });
                  },
                ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}