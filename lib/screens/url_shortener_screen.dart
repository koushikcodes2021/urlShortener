import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:urlshortner/screens/url_shortener_state.dart';

class UrlShortenerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UrlShortenerState>(context, listen: true);

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Text(
                "URL Shortener",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Shorten your URLs quickly",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                controller: state.urlController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  filled: true,
                  fillColor: Colors.grey[400],
                  hintText: "Paste the link",
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Builder(

                builder:(context) => GestureDetector(
                  child: Text(state.shortUrlMessage),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: state.shortUrlMessage))
                        .whenComplete(() => Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Link has been copied"))));
                  },
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('GET LINK'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: Colors.black45, width: 5),
                  ),
                  onPressed: () {
                    state.handleGetLinkButton();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
