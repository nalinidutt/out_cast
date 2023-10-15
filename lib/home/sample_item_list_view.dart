import 'package:flutter/material.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(
        "Pad Thai", 
        "Asian",
        2, 
        "https://hips.hearstapps.com/hmg-prod/images/pad-thai-index-6477629462a38.jpg?crop=0.6666666666666666xw:1xh;center,top&resize=1200:*", 
        "Pad Thai is a popular Thai stir-fried noodle dish known for its sweet, salty, and tangy flavors. It typically features rice noodles stir-fried with shrimp, tofu, or chicken, along with ingredients like eggs, bean sprouts, and chopped peanuts. The dish is often seasoned with a sauce made from tamarind, fish sauce, and sugar, creating a harmonious blend of flavors and textures.",
        "Gather all the ingredients you'll need, which typically include rice noodles, protein (like shrimp, chicken, or tofu), bean sprouts, green onions, garlic, eggs, crushed peanuts, and lime wedges. Soak the rice noodles in warm water until they soften.",
        "In a bowl, mix together the Pad Thai sauce. The sauce usually consists of tamarind paste, fish sauce, sugar, and sometimes a dash of soy sauce. Adjust the ingredients to taste, achieving a balance of sweet, sour, and savory flavors.",
        "In a wok or large skillet, heat oil over high heat. Add your choice of protein and cook until it's almost done. Push the protein to one side of the pan and add minced garlic to the other side. Stir-fry briefly until fragrant.",
        "Add the soaked and drained rice noodles to the pan with the partially cooked protein. Pour the prepared sauce over the noodles and toss everything together. Continue stir-frying until the noodles are well-coated with the sauce and everything is heated through.",
        "Toss in the chopped garlic, shallots, and bean sprouts. Cook for a couple of minutes until they soften slightly. Finally, serve your delicious Pad Thai hot, garnished with chopped peanuts and accompanied by lime wedges. If you like a little heat, you can also sprinkle some chili flakes on top. Enjoy your homemade Pad Thai!"
      ), 
      SampleItem(
        "Sushi", 
        "Asian", 
        2, 
        "https://hips.hearstapps.com/hmg-prod/images/spicy-crab-rolls4-1654808938.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=1200:*", 
        "Sushi is a traditional Japanese dish known for its simplicity and elegance. It typically consists of vinegared rice, fresh seafood, and vegetables, often wrapped in seaweed. Sushi is appreciated for its delicate flavors and artistic presentation, making it a popular and iconic culinary choice worldwide.",
        "Begin by preparing sushi rice: Rinse short-grain sushi rice under cold water until it runs clear, then cook it according to the package instructions. While it's still warm, season the rice with a mixture of rice vinegar, sugar, and salt, and let it cool.",
        "Gather all the necessary ingredients and tools: You'll need nori (seaweed sheets), fresh fish, vegetables, and your preferred fillings, a sushi rolling mat (makisu) covered with plastic wrap, a bowl of water for moistening your hands, and a sharp knife for slicing.",
        "Prepare your sushi fillings: Slice your chosen ingredients, like avocado, cucumber, cooked shrimp, and raw fish, into thin strips or pieces.",
        "Roll the sushi: Lay a sheet of nori on the sushi rolling mat, wet your hands, and grab a small handful of sushi rice. Spread the rice evenly over the nori, leaving a small border at the top. Add your selected fillings in the center, then lift the edge of the mat closest to you and start rolling the nori and rice over the fillings. Apply gentle pressure as you roll, use a bit of water to seal the edge of the nori, and finally, slice the sushi roll into bite-sized pieces.",
        "Serve and enjoy: Arrange the sushi on a plate alongside pickled ginger, wasabi, and soy sauce. Now you're ready to savor your homemade sushi!"
      ), 
      SampleItem("Carrot Cake", "Dessert", 2, "https://static01.nyt.com/images/2020/11/01/dining/Carrot-Cake-textless/Carrot-Cake-textless-threeByTwoMediumAt2X.jpg", "", "", "", "", "", ""), 
      SampleItem("Fettucine Alfredo", "Italian", 2, "https://www.modernhoney.com/wp-content/uploads/2018/08/Fettuccine-Alfredo-Recipe-1.jpg", "", "", "", "", "", ""), 
      SampleItem("Chicken and Waffles", "American", 2, "https://www.wellseasonedstudio.com/wp-content/uploads/2019/03/Chicken-and-waffles-18.jpg", "", "", "", "", "", ""), 
      SampleItem(
        "Butter Chicken", 
        "Indian", 
        2, 
        "https://www.cookingclassy.com/wp-content/uploads/2021/01/butter-chicken-4.jpg", 
        "Butter chicken is a popular Indian dish known for its creamy and flavorful tomato-based sauce. Tender pieces of marinated chicken are simmered in this rich sauce, which is often made with a mixture of butter, cream, and various spices, including garam masala. The dish is renowned for its luscious and mildly spicy taste, making it a beloved choice in Indian cuisine.",
        "Begin by cutting boneless chicken into bite-sized pieces and marinating it in a mixture of yogurt, ginger-garlic paste, chili powder, turmeric, and salt. Let it sit for at least 30 minutes to allow the flavors to infuse.",
        "Heat oil or ghee in a pan, then add the marinated chicken and cook it until it's no longer pink and has a slight browning. Remove the cooked chicken from the pan and set it aside.",
        "In the same pan, add more oil or ghee if needed. Sauté chopped onions until they become translucent. Then, add tomato puree, butter, cream, and a blend of spices like garam masala, cumin, and coriander. Cook the sauce until it thickens and you see the oil separating from it.",
        "Return the cooked chicken to the pan with the sauce. Simmer for a few minutes to allow the chicken to absorb the rich flavors of the sauce.",
        "Garnish the butter chicken with fresh cilantro, drizzle a bit of cream, and serve it with naan, rice, or roti. Enjoy your delicious homemade butter chicken!"
      ), 
      SampleItem("Lamb Gyro", "Mediterranian", 2, "https://hips.hearstapps.com/hmg-prod/images/gyro-sandwich1-1650490757.jpg?crop=0.683xw:1.00xh;0.167xw,0&resize=1200:*", "", "", "", "", "", ""), 
      SampleItem("Vegetable Soup", "American", 2, "https://www.eatingbirdfood.com/wp-content/uploads/2022/08/vegetable-soup-hero.jpg", "", "", "", "", "", ""), 
      SampleItem("Mac and Cheese", "American", 0, "https://pinchofyum.com/wp-content/uploads/Instant-Pot-Mac-and-Cheese-Square.jpg", "", "", "", "", "", ""), 
      SampleItem("Pan Seared Steak", "American", 2, "https://www.spendwithpennies.com/wp-content/uploads/2022/08/1200-Perfect-Ribeye-Steak-SpendWithPennies.jpg", "", "", "", "", "", "")
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
              onChanged: (value) {/*
                TextEditingController _searchController = TextEditingController();
                String query = _searchController.text;
                List<String> filteredItems = [];

                setState(() {
                filteredItems = items
                    .where((item) => item.toLowerCase().contains(query.toLowerCase()))
                    .toList();
                });*/
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 10.0
                    ),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SampleItemDetailsView(item: item),
                      ),
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
                        Hero(
                          tag: item.title, // Use the same tag as in the list view
                          child: Image.network(
                            item.imageURL,
                            fit: BoxFit.cover,
                            height: 150,
                          ),
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
}

