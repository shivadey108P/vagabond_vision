class Place {
  final String imageUrl;
  final String imageUrl2;
  final String imageUrl3;
  final String name; // Name of the place
  final String location; // Location information (City, State, Country)
  final double rating; // Rating of the place (e.g., out of 5)
  final int reviews; // Number of reviews
  final String intro;
  // Constructor to create instances of the Place class
  Place({
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.intro,
  });
}

class Places {
  // Static map containing predefined place data categorized by type
  static final Map<String, List<Place>> placeData = {
    'All': [
      Place(
          imageUrl:
              'https://img.freepik.com/free-photo/beautiful-volcano-landscape_23-2150787896.jpg',
          name: 'Fuji Mountain',
          location: 'Fuji Mountain, Japan',
          rating: 4.5,
          reviews: 45,
          imageUrl2:
              'https://www.agoda.com/wp-content/uploads/2021/03/Lake-Kawaguchi-Fujikawaguchiko-attractions-Japan.jpg',
          imageUrl3:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvFPrUA9q-DW96GA_Jv-NfGsK-mQ0qXxs5boZ94PUOSw&s',
          intro:
              "Fuji is the tallest peak in Japan, the result of volcanic activity that began approximately 100,000 years ago. Today, Mt. Fuji and the surrounding area are a popular recreational destination for hiking, camping and relaxation."),
      Place(
        imageUrl:
            'https://img.freepik.com/free-photo/mesmerizing-shot-famous-historic-taj-mahal-agra-india_181624-16028.jpg',
        name: 'Taj Mahal',
        location: 'Agra, UP, India',
        rating: 4.3,
        reviews: 87,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
      Place(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Charminar_Hyderabad_1.jpg/544px-Charminar_Hyderabad_1.jpg',
        imageUrl2: '',
        imageUrl3: '',
        name: 'Charminar',
        location: 'Hyderabad, Telangana, India',
        rating: 3.9,
        reviews: 50,
        intro: '',
      ),
      Place(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/MindSpace_campus_in_Hyderabad%2C_India.jpg/800px-MindSpace_campus_in_Hyderabad%2C_India.jpg',
        name: 'Mindspace IT Park',
        location: 'Hyderabad, Telangana, India',
        rating: 4.2,
        reviews: 30,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
      Place(
        imageUrl:
            'https://savorjapan.com/gg/content_image/t0093_030_20180420032213.jpg',
        name: 'Fuji Tempura Idaten',
        location: 'Yamanashi, Japan',
        rating: 4.2,
        reviews: 30,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
      Place(
        imageUrl:
            'https://www.agoda.com/wp-content/uploads/2021/03/Ubuya-best-Fujikawaguchiko-hotels-where-to-stay-ryokans-onsen-resorts.jpg',
        name: 'Ubuya Resort',
        location: 'Yamanashi, Japan',
        rating: 4.2,
        reviews: 15,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
      // Additional places for 'All'...
    ],
    'Site': [
      Place(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/MindSpace_campus_in_Hyderabad%2C_India.jpg/800px-MindSpace_campus_in_Hyderabad%2C_India.jpg',
        name: 'Mindspace IT Park',
        location: 'Hyderabad, Telangana, India',
        rating: 4.2,
        reviews: 30,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
      // Additional places for 'Site'...
    ],
    'Hotels': [
      Place(
        imageUrl:
            'https://www.agoda.com/wp-content/uploads/2021/03/Ubuya-best-Fujikawaguchiko-hotels-where-to-stay-ryokans-onsen-resorts.jpg',
        name: 'Ubuya Resort',
        location: 'Yamanashi, Japan',
        rating: 4.2,
        reviews: 15,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
    ],
    'Historic Places': [
      Place(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Charminar_Hyderabad_1.jpg/544px-Charminar_Hyderabad_1.jpg',
        name: 'Charminar',
        location: 'Hyderabad, Telangana, India',
        rating: 3.9,
        reviews: 50,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
      Place(
        imageUrl:
            'https://img.freepik.com/free-photo/mesmerizing-shot-famous-historic-taj-mahal-agra-india_181624-16028.jpg',
        name: 'Taj Mahal',
        location: 'Agra, UP, India',
        rating: 4.3,
        reviews: 87,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
      ),
    ],
  };
}
