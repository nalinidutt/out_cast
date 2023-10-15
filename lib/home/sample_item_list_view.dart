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
    SampleItem("Pad Thai", "Asian", 2, "https://www.recipetineats.com/wp-content/uploads/2020/01/Chicken-Pad-Thai_9-SQ.jpg"),
    SampleItem("Spaghetti Carbonara", "Italian", 1, "https://static01.nyt.com/images/2021/02/14/dining/carbonara-horizontal/carbonara-horizontal-threeByTwoMediumAt2X-v2.jpg"),
    SampleItem("Tandoori Chicken", "Indian", 0, "https://www.cubesnjuliennes.com/wp-content/uploads/2022/12/Tandoori-Chicken-Recipe.jpg"),
    SampleItem("Sushi", "Japanese", 2, "https://hips.hearstapps.com/hmg-prod/images/spicy-crab-rolls4-1654808938.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*"),
    SampleItem("Tacos", "Mexican", 1, "https://www.foodandwine.com/thmb/SPdstaqV80YcCbzzqtHXjxx4Isg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/birria-tacos-FT-RECIPE0420-1-b209e88cc1c04b72849634ff15214290.jpg"),
    SampleItem("Beef Stew", "American", 0, "https://hips.hearstapps.com/hmg-prod/images/beef-stew-horizontal-1539197161.jpg?crop=1xw:0.9997999709048588xh;center,top&resize=1200:*"),
    SampleItem("Goulash", "Hungarian", 1, "https://hips.hearstapps.com/hmg-prod/images/goulash-recipe-1637354807.jpg?crop=1xw:0.8434864104967198xh;center,top&resize=1200:*"),
    SampleItem("Dim Sum", "Chinese", 2, "https://popmenucloud.com/cdn-cgi/image/width%3D1200%2Cheight%3D1200%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/qsdncbfx/dbcd686d-ac24-481c-8ac5-cd8baab51cbb.jpg"),
    SampleItem("Pav Bhaji", "Indian", 0, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNjXPjUKOuhCZjtJs79tXML-V7TUMj9yD5Ww&usqp=CAU"),
  ],
  });

  static const routeName = '/';
  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                // Implement your search logic here
                // You can filter the items based on the search text
                // and update the UI accordingly.
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                        ),
                        Image.network(
                          item.imageURL,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                        ListTile(
                          title: Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(item.cuisine),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
