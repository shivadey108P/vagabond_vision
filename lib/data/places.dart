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
        serviceImage: [
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/42/e8/71/laad-bazaar.jpg?w=600&h=-1&s=1'
        ],
        serviceName: ['Laal Bazaar'],
        servicePrice: ['3,846'],
        servicePriceTime: ['day'],
        serviceRating: [4.2],
        serviceReviews: [1800],
        serviceLocation: ['Laad Bazaar Road, Hyderabad'],
        category: 'Historic Places',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/Charminar_Hyderabad_1.jpg/544px-Charminar_Hyderabad_1.jpg',
        imageUrl2:
            'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/01/42/e8/71/laad-bazaar.jpg?w=600&h=-1&s=1',
        imageUrl3:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStCsn-OncoBnJ4vqB4rnTQHbTP-b6b66Ntfg&usqp=CAU',
        name: 'Charminar',
        location: 'Hyderabad, Telangana, India',
        rating: 3.9,
        reviews: 50,
        intro:
            "Charminar is a historic monument in Hyderabad, India, built in 1591 by Quli Qutb Shah. Recognized for its distinctive four minarets, it's a landmark of Islamic architecture and a symbol of Hyderabad's rich history and cultural heritage",
        latitude: 17.3616,
        longitude: 78.4747,
        serviceCategory: ['Bazaar'],
      ),

      Place(
        serviceCategory: ['Playground', 'Food Court'],
        serviceImage: [
          'https://www.gwsportsapp.in/media/ground-images/gallery/MC44OTY2OTcwMCAxNDgxMDk5MzE3.jpeg',
          'https://b.zmtcdn.com/data/pictures/0/95510/9a63cdb8ffe653a4618fff4c0780b7e5.jpg'
        ],
        serviceName: ['Sports Arena', 'Mindspace Food Court'],
        servicePrice: ['800', '200'],
        servicePriceTime: [' day', 'two people'],
        serviceRating: [3.8, 3.9],
        serviceReviews: [493, 293],
        category: 'Site',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/MindSpace_campus_in_Hyderabad%2C_India.jpg/800px-MindSpace_campus_in_Hyderabad%2C_India.jpg',
        name: 'Mindspace IT Park',
        location: 'Hyd,Telangana,India',
        rating: 4.2,
        reviews: 30,
        imageUrl2:
            'https://www.gwsportsapp.in/media/ground-images/gallery/MC44OTY2OTcwMCAxNDgxMDk5MzE3.jpeg',
        imageUrl3:
            'https://b.zmtcdn.com/data/pictures/0/95510/9a63cdb8ffe653a4618fff4c0780b7e5.jpg',
        intro:
            "Mindspace IT Park in Hyderabad is a major technology hub, housing a mix of global tech giants and startups. Spread over 110 acres, it features modern infrastructure, business-friendly amenities, and sustainable design, making it a prime location for IT and software industries.",
        serviceLocation: ['Hyd,Telangana,India', 'Hyd,Telangana,India'],
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

      Place(
        serviceImage: [
          'https://assets-global.website-files.com/5b56319971ac8c7475a9d877/5f711753f3dbe9de67044794_elephant-beach-shoreline-.jpg',
          'https://assets-global.website-files.com/5b56319971ac8c7475a9d877/5f7117ac8dc40eeb268e19cf_elephant-beach-banana-ride-.jpg'
        ],
        serviceName: ['Elephant Beach', 'water booths'],
        servicePrice: ['1000', '2500'],
        servicePriceTime: ['day', 'day'],
        serviceRating: [4.8, 4.6],
        serviceReviews: [1000, 2500],
        category: 'Beaches',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/6/63/Havelock%2C_Andaman_%26_Nicobar_Islands.JPG',
        name: 'Havelock island',
        location: 'Andaman and Nicobar, India',
        rating: 4.2,
        reviews: 3000,
        imageUrl2:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5SH0cZZDY3wr0g-QX1yfxerAD-n6B00-mIhJR8gPNUQ&s',
        imageUrl3:
            'https://cdn.experienceandamans.com/images/havelock-island-package.jpg',
        intro:
            'Havelock Island is one of the islands of the Andaman and Nicobar archipelago located in the Indian Ocean. It is an island with the area close to 36 square miles and the same amount of miles of amazing coastline, with great beaches and beautiful nature.',
        serviceLocation: ['Havelock Island, India', 'Havelock Island, India'],
        latitude: 11.960000,
        longitude: 93.000000,
        serviceCategory: ['Beaches', 'Beaches'],
      ),
      Place(
        serviceImage: [
          'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/room-imgs/201603171229319815-1039759-ed23839c4fc511ea84d20242ac110003.jpg?&output-quality=75&downsize=520:350&crop=520:350;56,0&output-format=jpg',
          'https://www.canalbayhouseboats.com/images/houseboat.jpg'
        ],
        serviceName: ['Eco Boat House', 'Canal Bay Houseboats'],
        servicePrice: ['5169', '5500'],
        servicePriceTime: ['day/night', 'day/night'],
        serviceRating: [4.8, 4.9],
        serviceReviews: [7000, 10500],
        category: 'Site',
        imageUrl:
            'https://cdn.getyourguide.com/img/tour/50b656475c1c0.jpeg/97.jpg',
        name: 'Alappuzha',
        location: 'Cochin, Kerala, India',
        rating: 4.9,
        reviews: 8000,
        imageUrl2:
            'https://upload.wikimedia.org/wikipedia/commons/e/e4/Alappuzha_Boat_Beauty_W.jpg',
        imageUrl3:
            'https://deih43ym53wif.cloudfront.net/alleppey-kerala-india-shutterstock_1154918653_25793b1171.jpeg',
        intro:
            'Alappuzha (or Alleppey) is a city on the Laccadive Sea in the southern Indian state of Kerala. It is best known for houseboat cruises along the rustic Kerala backwaters, a network of tranquil canals and lagoons. Alappuzha Beach is the site of the 19th-century Alappuzha Lighthouse. The city Mullakkal Temple features a traditional design.',
        serviceLocation: ['Cochin, Kerala, India', 'Cochin, Kerala, India'],
        latitude: 9.48,
        longitude: 76.32,
        serviceCategory: ['Beaches', 'Beaches'],
      ),
      Place(
        serviceImage: [
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/118372125.jpg?k=89b6f784e9f5ea4560257a059c6efab3c405a533aae68e3d62d19ea4a46470f8&o=&hp=1'
        ],
        serviceName: ['Guest Rooms'],
        servicePrice: ['15890'],
        servicePriceTime: ['day/night'],
        serviceRating: [5.0],
        serviceReviews: [13000],
        category: 'Hotels',
        imageUrl:
            'https://lh3.googleusercontent.com/p/AF1QipNA4VHkS1aYz88k92tBK9ryW_WwREqR2cDs-3RO=w287-h192-n-k-rw-no-v1',
        name: 'Taj Palace',
        location: 'New Delhi, India',
        rating: 5.0,
        reviews: 29000,
        imageUrl2:
            'https://lh3.googleusercontent.com/p/AF1QipNgFHd66NFC5qUQZNWfMEDRRfso8kSLSXXy2aMD=w287-h192-n-k-rw-no-v1',
        imageUrl3:
            'https://lh3.googleusercontent.com/p/AF1QipM3vkn01avcANEK3NHhqfQFLmBxfF0gsRakhJV0=w287-h192-n-k-rw-no-v1',
        intro:
            'The Taj Hotel in New Delhi epitomizes luxury with its impeccable service and elegant design, catering to both business and leisure travelers. Situated in a prime location, it offers luxurious accommodations, diverse dining options, and world-class amenities, making it a landmark destination in the heart of the bustling capital city.',
        serviceLocation: ['New Delhi, India'],
        latitude: 28.5951,
        longitude: 77.1709,
        serviceCategory: ['Hotels'],
      ),
      Place(
        serviceImage: [
          'https://media.architecturaldigest.com/photos/56eae20138cde43e159fc53c/16:9/w_2580,c_limit/most-expensive-suite-burj-al-arab-07.jpg'
        ],
        serviceName: ['Luxury Rooms'],
        servicePrice: ['106,846'],
        servicePriceTime: ['day/night'],
        serviceRating: [4.9],
        serviceReviews: [18000],
        serviceLocation: ['Burj Al Arab, Dubai  '],
        category: 'Hotels',
        imageUrl:
            'https://cdn.britannica.com/68/250068-050-B0AD857A/Burj-Al-Arab-luxury-hotel-Dubai.jpg',
        imageUrl2:
            'https://www.visitdubai.com/-/media/gathercontent/poi/b/burj-al-arab/fallback-image/burj-al-arab-1-dtcm.jpg',
        imageUrl3:
            'https://focus.hidubai.com/content/images/size/w1000/2022/11/BurjAlArab-Cover.jpg',
        name: 'Burj Al Arab',
        location: 'Umm Suqeim 3 - Dubai',
        rating: 5.0,
        reviews: 28901,
        intro:
            'The Burj Al Arab is a symbol of luxury and extravagance, often referred to as the worlds only "7-star" hotel. Located in Dubai, it stands as an iconic sail-shaped structure on its own man-made island, offering breathtaking views of the Arabian Gulf. Known for its opulent interiors, personalized service, and array of luxurious amenities, the Burj Al Arab provides an unmatched experience for discerning travelers seeking the epitome of luxury hospitality.',
        latitude: 25.1412,
        longitude: 55.1852,
        serviceCategory: ['Hotels'],
      ),
    ],
  };
}
