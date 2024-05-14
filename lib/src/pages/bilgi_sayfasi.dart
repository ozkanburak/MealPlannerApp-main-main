import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BilgiSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Geri dönüş ikonu beyaz renkte
          onPressed: () {
            Navigator.of(context).pop(); // Geri dönüş işlemi
          },
        ),
        title: Text('Categorie',style: TextStyle(color: Colors.white)), // AppBar başlığı
        backgroundColor: Colors.deepOrangeAccent, // AppBar arka plan rengi
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Uygulama Bilgileri", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            InkWell(
              onTap: () => _launchURL('https://example.com/gizlilik-politikasi'),
              child: Text("Gizlilik Politikası", style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => _launchURL('https://example.com/gizlilik-politikasi'),
              child: Text("Term of Use", style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => _launchURL('https://example.com/gizlilik-politikasi'),
              child: Text("App Store", style: TextStyle(color: Colors.blue)),
            ),
            Spacer(), // Diğer içeriklerle alttaki metin arasında boşluk yaratır
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Text("Geliştirici", style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}