import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'site_data.dart';
import 'site_list.dart';

class Favorite extends StatelessWidget {
  final List<Website> favorites;

  Favorite({required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height) * 1.68, 
        ),
        itemCount: favorites.length,
        itemBuilder: (context, index){
          final SiteData data = listSite[index];
          return InkWell(
            onTap: (){
              _launchUrl(favorites[index].pageUrl);
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      favorites[index].image,
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launch(_url.toString())) {
      throw 'Could not launch $_url';
    }
  }
}