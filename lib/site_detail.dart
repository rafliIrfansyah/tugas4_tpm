import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'site_data.dart';


class SiteDetail extends StatefulWidget {
  final SiteData data;
  const SiteDetail({super.key, required this.data});
  @override
  SiteDetailState createState() => SiteDetailState();
}

class SiteDetailState extends State<SiteDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Site Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              widget.data.image,
              width: 200.0,
            ),
          ),
          SizedBox(height: 16,),
          Text(widget.data.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(widget.data.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14,
              ),
            ), 
          ),
          SizedBox(height: 16,),
          Text(widget.data.pageUrl,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: (){
              launchURL(widget.data.pageUrl);
            }, 
            icon: Icon(Icons.travel_explore),
            color: Colors.teal,
          ),
        ],
      )
    );
  }
}

Future <void> launchURL(String url) async{
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
}