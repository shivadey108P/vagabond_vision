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
        location: 'Umm Suqeim 3-Dubai',
        rating: 5.0,
        reviews: 28901,
        intro:
            'The Burj Al Arab is a symbol of luxury and extravagance, often referred to as the worlds only "7-star" hotel. Located in Dubai, it stands as an iconic sail-shaped structure on its own man-made island, offering breathtaking views of the Arabian Gulf. Known for its opulent interiors, personalized service, and array of luxurious amenities, the Burj Al Arab provides an unmatched experience for discerning travelers seeking the epitome of luxury hospitality.',
        latitude: 25.1412,
        longitude: 55.1852,
        serviceCategory: ['Hotels'],
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Restaurants',
        imageUrl:
            'https://media.cntraveler.com/photos/5492efb2860c74c1162cb41a/master/pass/plaza-athenee-restaurant-paris.jpg',
        name: 'Alain Ducasse',
        location: 'Paris, France',
        rating: 5.0,
        reviews: 29000,
        imageUrl2:
            'https://www.luxeat.com/wp-content/uploads/2020/12/6a00df351eb58e8834011570a45ad6970b.jpg',
        imageUrl3:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0ZLZBSAUZQbpYEumHxhEIKKBOefElRk5YQefDvTthsQ&s',
        intro:
            'Alain Ducasse is a renowned French chef and restaurateur with an illustrious career spanning decades. He is celebrated for his innovative culinary techniques, dedication to high-quality ingredients, and commitment to showcasing the diversity of French cuisine. Ducasse has earned numerous accolades, including multiple Michelin stars across his restaurants worldwide. He is known for his culinary empire, which includes acclaimed restaurants in cities like Paris, London, New York, and Tokyo, each offering a unique dining experience reflecting his culinary vision and expertise.',
        serviceLocation: [],
        latitude: 48.8664,
        longitude: 2.3042,
      ),
      Place(
        serviceCategory: ['Theater'],
        serviceImage: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwX22zjMT0GWfH1qHmocTDcoO7Kq2D00W-ltexku-RRw&s'
        ],
        serviceName: ['Sphere Shows'],
        servicePrice: ['15000'],
        servicePriceTime: ['day/night'],
        serviceRating: [4.8],
        serviceReviews: [5903],
        category: 'Theater',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Sphere-exosphere-on-Jan-26-2024.jpg/1200px-Sphere-exosphere-on-Jan-26-2024.jpg',
        name: 'Sphere',
        location: 'Las Vegas,US',
        rating: 4.6,
        reviews: 12000,
        imageUrl2:
            'https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iEnJsg9krryg/v2/-1x-1.jpg',
        imageUrl3:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgCCioPrcWa4Pe0ey0mXODvFvw2x9MKDJrckVAHKz_UQ&s',
        intro:
            '"Spher" is a state-of-the-art entertainment venue located in Las Vegas. Its a revolutionary concept that combines cutting-edge technology with live performances, creating immersive experiences for visitors. The venue features a spherical design with advanced audiovisual capabilities, allowing for stunning visual displays and interactive performances.',
        serviceLocation: ['Las Vegas , US'],
        latitude: 36.1716,
        longitude: 115.1391,
      ),
      Place(
        serviceCategory: ['Aquarium', 'Site'],
        serviceImage: [
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/5e/e3/7d/20190430-163110-largejpg.jpg?w=1200&h=-1&s=1',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrFkCGAZobTD3XzCSNTJNcC4nrn_QmYCYC3tuBGeWfsA&s'
        ],
        serviceName: ['Aquarium', 'Ice House'],
        servicePrice: ['250', '450'],
        servicePriceTime: ['day', 'day'],
        serviceRating: [4.5, 4.6],
        serviceReviews: [750, 923],
        category: 'Beaches',
        imageUrl:
            'https://files.prokerala.com/news/photos/imgs/800w/people-throng-marina-beach-in-chennai-on-tuesday-1511697.jpg',
        name: 'Marina Beach',
        location: 'Chennai,India',
        rating: 4.3,
        reviews: 1000,
        imageUrl2:
            'https://upload.wikimedia.org/wikipedia/commons/e/e4/Sunrise_at_Chennai_Marina_beach.jpg',
        imageUrl3:
            'https://chennaitourism.travel/images/places-to-visit/headers/marina-beach-chennai-tourism-entry-fee-timings-holidays-reviews-header.jpg',
        intro:
            'Chennai Marina Beach is a famous urban beach situated along the Bay of Bengal in Chennai, India. Stretching over 13 kilometers, it is one of the longest urban beaches in the world.',
        serviceLocation: ['Marina , Chennai', 'Marina , Chennai'],
        latitude: 13.0500,
        longitude: 80.2824,
      ),
      Place(
        serviceCategory: ['Rowing', 'Club'],
        serviceImage: [
          'https://cdn.getyourguide.com/img/tour/8b8f8cd1def980b9c156678ce5ddf5b5bbe2e8c448098b456d306c0ed42dad93.jpg/98.jpg',
          'https://cdn.getyourguide.com/img/tour/0d4f8f5cd373063cf54b8673bd621a916d71c7ffa57cb3a27517560dbbfb2eb4.jpg/145.jpg'
        ],
        serviceName: ['Kayaking', 'Night Club'],
        servicePrice: ['2500', '1500'],
        servicePriceTime: ['day', 'night'],
        serviceRating: [4.3, 4.9],
        serviceReviews: [249, 5900],
        category: 'Beaches',
        imageUrl:
            'https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D',
        name: 'Goa Beach',
        location: 'Goa , India',
        rating: 4.8,
        reviews: 12000,
        imageUrl2:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsH6-Y-4G9JJF_iKc7e7tv54Drk_cv3L8Y-wxtHtqpWQ&s',
        imageUrl3:
            'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/08/16/Pictures/_dbca9ffa-a138-11e8-9345-8d51f8ed9678.jpg',
        intro:
            'Goa, located on the western coast of India, is renowned for its pristine beaches that attract tourists from around the world. These beaches offer a diverse range of experiences, from vibrant party scenes to tranquil retreats.',
        serviceLocation: ['Goa , India', 'Goa , India'],
        latitude: 15.5412,
        longitude: 73.7577,
      ),
      Place(
        serviceCategory: ['Mountains'],
        serviceImage: [
          'https://cdn.unenvironment.org/s3fs-public/inline-images/1.jpg?VersionId=null'
        ],
        serviceName: ['Climbing'],
        servicePrice: ['2900'],
        servicePriceTime: ['day'],
        serviceRating: [4.7],
        serviceReviews: [92],
        category: 'Mountains',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Mount_Everest_as_seen_from_Drukair2_PLW_edit.jpg/1200px-Mount_Everest_as_seen_from_Drukair2_PLW_edit.jpg',
        name: 'Mount Everest',
        location: 'Himalayas,India',
        rating: 4.8,
        reviews: 12000,
        imageUrl2:
            'https://images.news18.com/ibnlive/uploads/2023/05/international-mount-everest-day-2023-16851806443x2.jpg?impolicy=website&width=640&height=480',
        imageUrl3:
            'https://media.tacdn.com/media/attractions-splice-spp-674x446/10/5c/8f/5d.jpg',
        intro:
            'Mount Everest, standing at 8,848.86 meters (29,031.7 feet) above sea level, is the highest peak on Earth and a symbol of human endeavor and exploration. Located in the Himalayas on the border between Nepal and China, Everest has captivated adventurers and mountaineers for centuries.',
        serviceLocation: ['Himalayas,India'],
        latitude: 27.9881,
        longitude: 86.9250,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Forest',
        imageUrl:
            'https://www.beautifulworld.com/wp-content/uploads/2016/10/amazon-rainforest.jpg',
        name: 'The Amazon Rainforest',
        location: 'South America',
        rating: 4.4,
        reviews: 900,
        imageUrl2:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLb1J9L_8F2ECUSM62i5Vd4-eouTbqGnknRuKbfLqWWQ&s',
        imageUrl3:
            'https://cdn.britannica.com/31/130031-050-469B9571/stream-Amazon-Rainforest-Ecuador.jpg',
        intro:
            'The Amazon Rainforest is the largest tropical rainforest in the world, covering approximately 5.5 million square kilometers (2.1 million square miles) across nine South American countries, including Brazil, Peru, and Colombia.',
        serviceLocation: [],
        latitude: 27.9881,
        longitude: 86.9250,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Forest',
        imageUrl:
            'https://qph.cf2.quoracdn.net/main-qimg-c87f361f8aa76bb9a88dd6bd2ef26635-lq',
        name: 'Northeastern coastal',
        location: 'India',
        rating: 3.9,
        reviews: 600,
        imageUrl2:
            'https://cdn.britannica.com/31/130031-050-469B9571/stream-Amazon-Rainforest-Ecuador.jpg',
        imageUrl3:
            'https://upload.wikimedia.org/wikipedia/commons/6/65/Posts_Brook_from_Norvin_Green_State_Forest_Lower_Trail.jpg',
        intro:
            'The Northeast Region of the United States is home to diverse forests that play a significant role in the regions ecology, economy, and culture. Stretching from Maine to Maryland, these forests encompass a variety of ecosystems, including temperate hardwood forests, boreal forests, and mixed coniferous-deciduous forests.',
        serviceLocation: [],
        latitude: 25.5736,
        longitude: 93.2473,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Mountains',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9VE_BeFz4aWCzotKSWg6vC8BoefclSqydFkBdsu-Z2w&s',
        name: 'Kangchenjunga',
        location: 'India',
        rating: 4.5,
        reviews: 800,
        imageUrl2:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKI9Id6Wfu0OYcZNyt-MRadPG0oBS2ioMi4mnr_NtVEA&s',
        imageUrl3:
            'https://www.dutcheverest.nl/wp-content/uploads/2019/10/Kangchenjunga-3-1024x574.jpg',
        intro:
            'Kangchenjunga, standing at 8,586 meters (28,169 feet) above sea level, is the third highest mountain in the world. Located in the eastern Himalayas, on the border between Nepal and the Indian state of Sikkim, Kangchenjunga is renowned for its stunning beauty and challenging climbing routes.',
        serviceLocation: [],
        latitude: 27.7025,
        longitude: 88.1475,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Theater',
        imageUrl:
            'https://assets.architecturaldigest.in/photos/641c19015dd72df91f3512d3/master/w_1600%2Cc_limit/Credits%2C%2520Justin%2520Nisly.jpg',
        name: 'Maratha Mandir',
        location: 'India',
        rating: 4.5,
        reviews: 8000,
        imageUrl2:
            'https://img.onmanorama.com/content/dam/mm/en/entertainment/entertainment-news/images/2018/10/25/ddlj-at-maratha-mandir.jpg.transform/schema-4x3/image.jpg',
        imageUrl3:
            'https://live.staticflickr.com/1233/1174941508_6b4c67698c_b.jpg',
        intro:
            'Maratha Mandir is a historic cinema hall located in Mumbai, India. It is renowned for its iconic screening of the Bollywood film "Dilwale Dulhania Le Jayenge" (DDLJ), which has been playing continuously at the theater since its release in 1995.',
        serviceLocation: [],
        latitude: 18.9711,
        longitude: 72.8221,
      ),
      Place(
        serviceCategory: [],
        serviceImage: [],
        serviceName: [],
        servicePrice: [],
        servicePriceTime: [],
        serviceRating: [],
        serviceReviews: [],
        category: 'Restaurants',
        imageUrl:
            'https://resize.indiatvnews.com/en/resize/newbucket/1080_-/2023/04/most-expensive-resturent-1680961710.jpg',
        name: 'Taj Falaknuma Palace',
        location: 'Hyderabad, India',
        rating: 4.7,
        reviews: 81230,
        imageUrl2:
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/17181467.jpg?k=73b25a9cb3b5e18877cf578c8d146a1ba4ff213a6bf3801f4480a0337bac1b1f&o=&hp=1',
        imageUrl3:
            'https://assets.vogue.in/photos/6560bf9b4ff871a6c82114c6/master/w_1600%2Cc_limit/Koishii%2520at%2520The%2520Penthouse%2C%2520Level%252037%2C%2520The%2520St.%2520Regis%2C%2520Mumbai%2520(2)%2520(2).jpg',
        intro:
            'Taj Falaknuma Palace is a luxurious heritage hotel located in Hyderabad, India. Originally built in 1894, the palace was once the residence of the Nizam of Hyderabad, considered one of the richest men in the world at the time.',
        serviceLocation: [],
        latitude: 17.3315,
        longitude: 78.4675,
      ),
    ],
  };
}
