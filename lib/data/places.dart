class Place {
  final String imageUrl;
  final String imageUrl2;
  final String imageUrl3;
  final String name; // Name of the place
  final String location; // Location information (City, State, Country)
  final double rating; // Rating of the place (e.g., out of 5)
  final int reviews; // Number of reviews
  final String intro;
  final String category;
  final List<String> serviceImage;
  final List<String> serviceCategory;
  final List<String> serviceName;
  final List<double> serviceRating;
  final List<int> serviceReviews;
  final List<String> servicePrice;
  final List<String> servicePriceTime;
  final List<String> serviceLocation;
  final double latitude;
  final double longitude;
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
    required this.category,
    required this.serviceImage,
    required this.serviceName,
    required this.servicePrice,
    required this.servicePriceTime,
    required this.serviceRating,
    required this.serviceReviews,
    required this.serviceLocation,
    required this.latitude,
    required this.longitude,
    required this.serviceCategory,
  });
}

class Places {
  // Static map containing predefined place data categorized by type
  static final Map<String, List<Place>> placeData = {
    'All': [
      Place(
        serviceCategory: [],
        category: 'Mountains',
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
            "Fuji is the tallest peak in Japan, the result of volcanic activity that began approximately 100,000 years ago. Today, Mt. Fuji and the surrounding area are a popular recreational destination for hiking, camping and relaxation.",
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        serviceLocation: [],
        latitude: 78.3,
        longitude: 14.0,
      ),
      Place(
        serviceCategory: ['Shopping Mall', 'Historic Places'],
        latitude: 27.1751,
        longitude: 78.0421,
        serviceImage: [
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/d1/04/6b/taj-gallery.jpg?w=1000&h=-1&s=1',
          'https://live.staticflickr.com/5185/5665918062_d730a034bd_b.jpg'
        ],
        serviceName: ['Taj Gallery', 'Entry Gate'],
        servicePrice: ['2500', '1100'],
        servicePriceTime: ['day/night', 'entry-fee'],
        serviceRating: [4.5, 4.6],
        serviceReviews: [13, 1000],
        serviceLocation: ['Agra, UP, India', 'Agra, UP, India'],
        category: 'Historic Places',
        imageUrl:
            'https://img.freepik.com/free-photo/mesmerizing-shot-famous-historic-taj-mahal-agra-india_181624-16028.jpg',
        name: 'Taj Mahal',
        location: 'Agra, UP, India',
        rating: 4.3,
        reviews: 87,
        imageUrl2:
            'https://images.pexels.com/photos/1583339/pexels-photo-1583339.jpeg',
        imageUrl3:
            'https://images.pexels.com/photos/2413613/pexels-photo-2413613.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        intro:
            'The Taj Mahal, located in Agra, India, is a stunning white marble mausoleum built in the 17th century by Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal. Renowned for its intricate architecture and iconic domes, it\'s a UNESCO World Heritage Site and a symbol of enduring love.',
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Historic Places',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Charminar_Hyderabad_1.jpg/544px-Charminar_Hyderabad_1.jpg',
        imageUrl2: '',
        imageUrl3: '',
        name: 'Charminar',
        location: 'Hyderabad, Telangana, India',
        rating: 3.9,
        reviews: 50,
        intro: '',
        serviceLocation: [],
        latitude: 78.3,
        longitude: 14.0,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Site',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/MindSpace_campus_in_Hyderabad%2C_India.jpg/800px-MindSpace_campus_in_Hyderabad%2C_India.jpg',
        name: 'Mindspace IT Park',
        location: 'Hyd,Telangana,India',
        rating: 4.2,
        reviews: 30,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
        serviceLocation: [],
        latitude: 17.4425,
        longitude: 78.3816,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        serviceLocation: [],
        category: 'Restaurants',
        imageUrl:
            'https://savorjapan.com/gg/content_image/t0093_030_20180420032213.jpg',
        name: 'Fuji Tempura Idaten',
        location: 'Yamanashi, Japan',
        rating: 4.2,
        reviews: 30,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
        latitude: 78.3,
        longitude: 14.0,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        serviceLocation: [],
        category: 'Hotels',
        imageUrl:
            'https://www.agoda.com/wp-content/uploads/2021/03/Ubuya-best-Fujikawaguchiko-hotels-where-to-stay-ryokans-onsen-resorts.jpg',
        name: 'Ubuya Resort',
        location: 'Yamanashi, Japan',
        rating: 4.2,
        reviews: 15,
        imageUrl2: '',
        imageUrl3: '',
        intro: '',
        latitude: 78.3,
        longitude: 14.0,
      ),
      // Additional places for 'All'...
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        serviceLocation: [],
        category: 'Parks',
        imageUrl:
            'https://a.travel-assets.com/findyours-php/viewfinder/images/res40/75000/75502-Nehru-Zoological-Park.jpg',
        name: 'Nehru Zoological Park',
        location: ' Hyderabad, Telangana, India',
        rating: 4.2,
        reviews: 896,
        imageUrl2:
            'https://map.sahapedia.org/admin/assets/images/202205717382919Rhino_from_Nehru_Zoological_park_Hyderabad_4310.JPG',
        imageUrl3:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Indian_Lion_from_Nehru_Zoological_park_Hyderabad_4280.JPG/1280px-Indian_Lion_from_Nehru_Zoological_park_Hyderabad_4280.JPG',
        intro:
            'Nehru Zoological Park, located in Hyderabad, India, is a sprawling zoo established in 1959. It features a wide array of native and exotic animals, dedicated conservation programs, and educational exhibits, promoting wildlife protection and awareness among visitors.',
        latitude: 78.3,
        longitude: 14.0,
      ),
    ],
  };
}
