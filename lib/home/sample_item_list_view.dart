import 'package:flutter/material.dart';
// import 'my_flutter_app_icons.dart';

// import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 0, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*"), 
      SampleItem("Pad Thai", "Asian", 2, "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*")
      ],
  });

  static const routeName = '/';
  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                  arguments: item,
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      item.imageURL,
                      fit: BoxFit.cover,
                      height: 150,),
                    ListTile(
                    title: Text(item.title),
                    subtitle: Text(item.cuisine),
                    ),
                  ] ,
            ),
            
          ),
          );
        },
      ),
    );
  }


  
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          switch (item.progress) {
            case 0:
              String imageURL = 'assets/images/progress0.png';
              break;
            case 1:
              String imageURL = 'assets/images/progress1.png'; 
              break;
            case 2: 
              String imageURL = 'assets/images/progress2.png';
              break;
          }

          /*return ListTile(
            title: Text('${item.title}'),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            }
          );*/

          return Card(
            child: Column(
              children: [
                Image.network(item.imageURL),
                ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.cuisine),
                ),
              ],
            ),
        );

        },
      ),
    );
  }*/
}
