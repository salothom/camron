//
//  places.swift
//  boredinchicago
//
//  Created by Sarah Thompson on 9/5/20.
//  Copyright © 2020 SarahThompson. All rights reserved.
//


import Foundation
import MapKit
import Contacts

enum CatType {
    case art
    case park
    case musuem
}

class Places: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var price: String?
    var catigory: String
    var links: String

//    var type: CatType
//    var lattitude: CLLocationDegrees
//    var longtitude: CLLocationDegrees

   init(
      title: String,
      subtitle: String,
      catigory: String,
      price: String,
      coordinate: CLLocationCoordinate2D,
      links: String

//      type: CatType
    ) {

      self.price = price
      self.subtitle = subtitle

      self.catigory = catigory
      self.title = title
      self.coordinate = coordinate
      self.links = links
    
      super.init()
  
    }
    var markerTintColor: UIColor  {
       switch catigory {
              case "park":
                return .green
              case "art":
                return .black
              case "musuem":
                 return .blue
              case "etc":
                 return .purple
              default:
                 return .yellow
       }
     }
    
}
class PlaceAnnotations: NSObject {
let placesA: [Places]
 
override init(){
//let placesA: [Places]

    placesA = [Places(title:"Wabash Arts Corridor" , subtitle:"Numerous artistic street murals located in Printers Row/South Loop", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.873451, longitude: -87.625648), links:"https://www.youtube.com/watch?v=vT2z2UfWss8"),
               Places(title:"Vivian Maier Mural" , subtitle:"Awesome mural of the late Chicago street photographer, Vivian Maier", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.910387, longitude: -87.669738), links:"https://www.tiktok.com/@bored_in_chicago/video/6854968518627036422"),
               Places(title:"The Radience of Being" , subtitle:"Two-floor mural in a lesser known alcove of the Chicago Riverwalk", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.88531, longitude: -87.62213), links:"https://www.tiktok.com/@bored_in_chicago/video/6852774519669624069"),
               Places(title:"Robin Williams Mural" , subtitle:"Great mural of the late Robin Williams and one of his characters (Genie)", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.918532, longitude: -87.689816), links:"https://www.tiktok.com/@bored_in_chicago/video/6849479720048889093"),
               Places(title:"La Ronda Parakata" , subtitle:"Hidden wooden Stonehenge-like structure tucked away along the south Lakefront trail", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.939942, longitude: -87.638408), links:"https://www.tiktok.com/@bored_in_chicago/video/6842374162762272006"),
Places(title:"Secret Mermaid" , subtitle:"Carving of a mermaid on a limestone rock with an interesting (and illegal) origin story", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.823176, longitude: -87.599394), links:"https://www.tiktok.com/@bored_in_chicago/video/6841645641521761541"),
Places(title:"Alley of Street Art" , subtitle:"Small alley filled with a ton of interesting street art", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.89104, longitude: -87.644963), links:"https://www.tiktok.com/@bored_in_chicago/video/6838556704456674565"),
Places(title:"Chicago Gallery (Hubbard Street Murals)" , subtitle:"Restored, old set of street art with a few new additions", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.889877, longitude: -87.65343), links:"https://www.tiktok.com/@bored_in_chicago/video/6837808908275354886"),
Places(title:"Michelle Obama mural" , subtitle:"Mural of Michelle Obama wearing traditional Korean garb", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.889408, longitude: -87.643614), links:"https://www.tiktok.com/@bored_in_chicago/video/6832668575577165061"),
Places(title:"Shit Fountain" , subtitle:"A fine piece of art featuring poop and water", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.899724, longitude: -87.674454), links:"https://www.tiktok.com/@bored_in_chicago/video/6829762136198204677"),
Places(title:"Honey Bear Wall" , subtitle:"Street art featuring 4 honey bears, each representing a different element of Chicago culture", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.896099, longitude: -87.649793), links:"https://www.tiktok.com/@bored_in_chicago/video/6825301254378425605"),
Places(title:"Michael Jordan and Walter Payton Mural" , subtitle:"Awesome mural of two of Chicago's (and the world's) greatest athletes", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.859905, longitude: -87.640794), links:"https://www.tiktok.com/@bored_in_chicago/video/6821535186400840965"),
Places(title:"Nevermore Art Exhibit" , subtitle:"Trippy interactive art museum featuring the character FlyBoy", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.859633, longitude: -87.650616), links:"https://www.tiktok.com/@bored_in_chicago/video/6794120446083075333"),
Places(title:"Chicago River Mural" , subtitle:"Huge mural map of the Chicago river and where you are relative to it", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.877853, longitude: -87.637173), links:"https://www.tiktok.com/@bored_in_chicago/video/6786985548851531014"),
Places(title:"Untitled (Picasso)" , subtitle:"How cool is it that Chicago just has a massive Picasso art piece in the middle of a plaza?", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.883818, longitude: -87.630208), links:"https://www.tiktok.com/@bored_in_chicago/video/6781526898422926598"),
Places(title:"Lucent" , subtitle:"Massive sculpture with the same amount of lights as visible stars in the Northern Hemisphere", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.898804, longitude: -87.623027), links:"https://www.tiktok.com/@bored_in_chicago/video/6777841709209505030"),
Places(title:"Four Seasons (Chagall)" , subtitle:"How cool is it that Chicago just has a massive Chagall art piece on the side of a plaza?", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.881632, longitude: -87.630101), links:"https://www.tiktok.com/@bored_in_chicago/video/6773261211485097221"),
Places(title:"Gentlemen Statues" , subtitle:"Interesting piece of public art located right along the river", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.888446, longitude: -87.627493), links:"https://www.youtube.com/watch?v=SHp-RqCgyMs"),
Places(title:"Monument with Standing Beast" , subtitle:"That weird piece of public art that resembles 'Snoopy in a blender'", catigory: "Art",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.885165, longitude: -87.631726), links:"https://www.youtube.com/watch?v=zrSpxiM_QqQ"),
Places(title:"Bunny Slope" , subtitle:"Apres ski bar where you can rent out a private hottub for you and your friends", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.89225, longitude: -87.627503), links:"https://www.tiktok.com/@bored_in_chicago/video/6776632629996391685"),
Places(title:"First Draft" , subtitle:"A great, no frills bar with great beer selection in Printers Row", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.873519, longitude: -87.63032), links:"https://www.youtube.com/watch?v=du5gEwL8ngA"),
Places(title:"Infield's" , subtitle:"A bar located underground in the Chicago Pedway", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.883712, longitude: -87.627047), links:"https://www.youtube.com/watch?v=F6O16kRxyLI"),
Places(title:"Simone's" , subtitle:"A sustainabiltiy-focused bar that reuses trash as decorations", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.858202, longitude: -87.651097), links:"https://www.youtube.com/watch?v=5MYVa0dJ6Yw"),
Places(title:"Berkshire Room" , subtitle:"A bar that features the 'dealers choice', where bartenders will custom-craft you a cocktail based on short questionnaire", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.89225, longitude: -87.627503), links:"https://www.youtube.com/watch?v=z8Ye2bCpJDM"),
Places(title:"Snickers" , subtitle:"One of the weirdest and most mysterious bars of Chicago", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.890744, longitude: -87.628362), links:"https://www.youtube.com/watch?v=2k9bELvKlLI"),
Places(title:"Rossi's" , subtitle:"A fantastic dive bar where you serve yourself drinks from the fridge", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.889727, longitude: -87.628198), links:"https://www.youtube.com/watch?v=zZ6ggxxwD0M"),
Places(title:"The Smith" , subtitle:"River North bar that features a Malort cocktail", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.889421, longitude: -87.631363), links:"https://www.youtube.com/watch?v=0O3aWxz8S18"),
Places(title:"Ceres" , subtitle:"Bar that features extremely stiff, cheap drinks at the bottom of the Board of Trade building. By far my favorite bar in the city", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.877743, longitude: -87.632277), links:"https://www.youtube.com/watch?v=4h-QL-jXZmM"),
Places(title:"Whiskey Business" , subtitle:"Cool rooftop bar that hosts fun events like movie nights and electric light shows", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.906844, longitude: -87.671456), links:"https://www.tiktok.com/@bored_in_chicago/video/6842739927847832837"),
Places(title:"Deuces" , subtitle:"Wrigleyville bar with an outdoor pool area and frequent pop-up events", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.94599, longitude: -87.655312), links:"https://www.tiktok.com/@bored_in_chicago/video/6799380913730948358"),
Places(title:"Maria's Packaged Goods" , subtitle:"There is a speakeasy bar hidden in the back of what looks like a standard liquor store", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.838204, longitude: -87.6511), links:"https://www.tiktok.com/@bored_in_chicago/video/6781063079707856133"),
Places(title:"Headquarters Beercade" , subtitle:"Bar where you can play tons of old arcade games as you drink", catigory: "Bar",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.844883, longitude: -87.624032), links:"https://www.tiktok.com/@bored_in_chicago/video/6780436420059237638"),
Places(title:"Ava's Italian Ice" , subtitle:"The World's Healthiest Italian Ice!", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.914485, longitude: -87.687559), links:"https://www.youtube.com/watch?v=xz42MB2sWU0"),
Places(title:"Redhot Ranch" , subtitle:"The Best Cheap Burger in Chicago", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:42.081825, longitude: -70.643868), links:"https://www.youtube.com/watch?v=3qMOv8V3wok"),
Places(title:"Pittsfield Café" , subtitle:"A hidden gem of a restaurant, where you can sit 'outdoors' in the lobby of a historic building", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.882955, longitude: -87.625722), links:"https://www.youtube.com/watch?v=pkpFEjPjyc4"),
Places(title:"Big Star" , subtitle:"Margarita and taco spot. Their margaritas will KO you (try them spicy!)", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.90931, longitude: -87.677199), links:"https://www.tiktok.com/@bored_in_chicago/video/6853174354658823430"),
Places(title:"La Vaca" , subtitle:"Frozen margarita spot in Pilsen, with a really cool mango tequila shot", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.858287, longitude: -87.655775), links:"https://www.tiktok.com/@bored_in_chicago/video/6853173511901547782"),
Places(title:"Flo & Santos" , subtitle:"Awesome South Loop restaurant featuring tavern style pizza and pierogi", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.865393, longitude: -87.626239), links:"https://www.tiktok.com/@bored_in_chicago/video/6852430325482523909"),
Places(title:"Podhalanka" , subtitle:"The last remaining Polish restaurant in the historic Polish Triangle of Chicago", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.903109, longitude: -87.667039), links:"https://www.tiktok.com/@bored_in_chicago/video/6848589894843944198"),
Places(title:"Chicago Q" , subtitle:"Bougie BBQ spot that gives very healthy portions of food", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.903611, longitude: -87.630403), links:"https://www.tiktok.com/@bored_in_chicago/video/6847274834951539973"),
Places(title:"River Roast" , subtitle:"Restaurant along the Chicago river that offers great food and great views", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.887953, longitude: -87.63188), links:"https://www.tiktok.com/@bored_in_chicago/video/6845265818532482309"),
Places(title:"Blommers Chocolate" , subtitle:"The reason why everything in River West/West Loop smells like chocolate", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.892289, longitude: -87.637271), links:"https://www.tiktok.com/@bored_in_chicago/video/6838191151099481349"),
Places(title:"Miko's Italian Ice" , subtitle:"Fantastic italian ice in Logan Square", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.889408, longitude: -87.643614), links:"https://www.tiktok.com/@bored_in_chicago/video/6835953595070844166"),
Places(title:"Enso Sushi" , subtitle:"Awesome sushi spot with a great staff in Wicker Park", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.910838, longitude: -87.67732), links:"https://www.tiktok.com/@bored_in_chicago/video/6831642282886761733"),
Places(title:"Rainforest Café" , subtitle:"The greatest hidden gem in Chicago - get ready for a culinary Safari!", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.89267, longitude: -87.630766), links:"https://www.tiktok.com/@bored_in_chicago/video/6828674089817754885"),
Places(title:"Global Menu McDonalds" , subtitle:"A McDonalds where you can try featured items from other countries", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.884153, longitude: -87.653316), links:"https://www.tiktok.com/@bored_in_chicago/video/6800116633735154949"),
Places(title:"TimeOut Market" , subtitle:"A great food hall featuring some of the best restaraurants of Chicago", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.886909, longitude: -87.650398), links:"https://www.tiktok.com/@bored_in_chicago/video/6799761081377000710"),
Places(title:"Tanta" , subtitle:"Fantastic Peruvian restaurant", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.891862, longitude: -87.632055), links:"https://www.tiktok.com/@bored_in_chicago/video/6798485713689021701"),
Places(title:"TBaar" , subtitle:"Great bubble tea and thai rolled ice cream spot in Chinatown", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.851882, longitude: -87.632291), links:"https://www.tiktok.com/@bored_in_chicago/video/6797235322724896005"),
Places(title:"San Soo Gab San" , subtitle:"Korean BBQ restaurant where you cook the food yourself and eat tons of Banchan", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.977332, longitude: -87.688904), links:"https://www.tiktok.com/@bored_in_chicago/video/6795266160905489669"),
Places(title:"Starbucks Roastery" , subtitle:"The world's largest Starbucks with both coffee and cocktails", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.89391, longitude: -87.624379), links:"https://www.tiktok.com/@bored_in_chicago/video/6794484920807886085"),
Places(title:"Galit" , subtitle:"Fantastic Middle Eastern restaurant in Lincoln Park", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.92633, longitude: -87.64952), links:"https://www.tiktok.com/@bored_in_chicago/video/6787533987511422213"),
Places(title:"Berghoff" , subtitle:"Possibly the oldest restaurant in Chicago, with great German cuisine and beer", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.879267, longitude: -87.628411), links:"https://www.tiktok.com/@bored_in_chicago/video/6786263270694079749"),
Places(title:"etta" , subtitle:"Fantastic restaurant serving wood-fired food in Wicker Park", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.91074, longitude: -87.674293), links:"https://www.tiktok.com/@bored_in_chicago/video/6784756865118080262"),
Places(title:"Carnitas Uruapan" , subtitle:"Fantastic, inexpensive carnitas spot in Pilsen", catigory: "Food",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.85749, longitude: -87.669696), links:"https://www.tiktok.com/@bored_in_chicago/video/6780052824224042245"),
Places(title:"City Mini Golf" , subtitle:"Charming mini golf spot where the holes feature minaturized Chicago landmarks", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.883142, longitude: -87.618635), links:"https://www.tiktok.com/@bored_in_chicago/video/6846449056902892805"),
Places(title:"Noel State Bank Walgreens" , subtitle:"This Walgreens is built in a former bank and has a vitamin vault!", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.910857, longitude: -87.677772), links:"https://www.youtube.com/watch?v=AHgrNFxIJDQ"),
Places(title:"Sullivan Center Target" , subtitle:"This Target is in a former fancy department store and kept many of its original features", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.882388, longitude: -87.627004), links:"https://www.youtube.com/watch?v=-WbLE4ux5-Y"),
Places(title:"Palmer House Hotel" , subtitle:"Historic hotel lobby/bar and the birthplace of the brownie", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.880329, longitude: -87.627065), links:"https://www.youtube.com/watch?v=BMuksy7B5C4"),
Places(title:"Sky Chapel" , subtitle:"The highest chapel in the world, located in the Chicago Temple", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.88286, longitude: -87.630605), links:"https://www.youtube.com/watch?v=AJy9htJJuLc"),
Places(title:"Monadnock Building" , subtitle:"Once the largest office building in the world, it now features stores/offices that could have only existed when the building was built (end of 19th century)", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.877949, longitude: -87.629563), links:"https://www.youtube.com/watch?v=IHMKdOhvYR8"),
Places(title:"Winter Garden" , subtitle:"A great, quiet study spot at the top of the Harold Washington Library", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.876323, longitude: -87.628401), links:"https://www.youtube.com/watch?v=6PlABXc09kk"),
Places(title:"Wooden Block Alley" , subtitle:"The only remaining alley in Chicago that is made of wooden blocks", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.906844, longitude: -87.63194), links:"https://www.tiktok.com/@bored_in_chicago/video/6855373000066338053"),
Places(title:"Vista Tower" , subtitle:"A new addition to the Chicago skyline, this is the tallest building ever designed by a woman and features a fascinating blow-through", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.887234, longitude: -87.618637), links:"https://www.tiktok.com/@bored_in_chicago/video/6854659960610082054"),
Places(title:"Original Playboy Mansion" , subtitle:"Pretty self-explanatory - this used to be the Playboy Mansion. NOTE: this is someone's actual house so no entry", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.90703, longitude: -87.629163), links:"https://www.tiktok.com/@bored_in_chicago/video/6843863853424528646"),
Places(title:"Bronzeville Walk of Fame" , subtitle:"Plaques line the street showcasing the greats of Bronzeville", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.810262, longitude: -87.616201), links:"https://www.tiktok.com/@bored_in_chicago/video/6838608809607400710"),
Places(title:"25000th 7-11" , subtitle:"This is an ordinary 7-11, but it also happened to be #25000", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.875562, longitude: -87.631447), links:"https://www.tiktok.com/@bored_in_chicago/video/6836487780818832645"),
Places(title:"Rookery" , subtitle:"Downtown building with a really cool (and Insta-worthy) lobby", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.879084, longitude: -87.631803), links:"https://www.tiktok.com/@bored_in_chicago/video/6836317549337103621"),
Places(title:"Home Bank and Trust CVS" , subtitle:"Fancy CVS that was built in and still showcases a historic Chicago bank", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.90372, longitude: -87.667571), links:"https://www.tiktok.com/@bored_in_chicago/video/6831230867701042438"),
Places(title:"Route 66 Sign" , subtitle:"The official starting spot of Route 66, designated with a sign", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.879705, longitude: -87.624305), links:"https://www.tiktok.com/@bored_in_chicago/video/6825699888068578566"),
Places(title:"Harold Washington Library" , subtitle:"Massive library with tons to do inside", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.876323, longitude: -87.628401), links:"https://www.tiktok.com/@bored_in_chicago/video/6806308437685734662"),
Places(title:"Old Watertower" , subtitle:"A super old building with always-changing interesting exhibits inside", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.8974, longitude: -87.62558), links:"https://www.tiktok.com/@bored_in_chicago/video/6803461829344382213"),
Places(title:"Couch Place Alley" , subtitle:"An alley where 600 people died in a 1903 fire", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.885348, longitude: -87.628436), links:"https://www.tiktok.com/@bored_in_chicago/video/6802312295960595718"),
Places(title:"Joliet Iron and Steel Works" , subtitle:"Explore the remains of what was once the 2nd largest steel mill in the US", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.536387, longitude: -88.080242), links:"https://www.tiktok.com/@bored_in_chicago/video/6801210907729939717"),
Places(title:"Chicago Poetry Foundation" , subtitle:"Quiet, relaxing spot filled with a massive collection of poetry", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.895415, longitude: -87.630588), links:"https://www.tiktok.com/@bored_in_chicago/video/6798117135219510533"),
Places(title:"Lincoln Park Zoo" , subtitle:"One of the last remaining free zoos in the US", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.918322, longitude: -87.636116), links:"https://www.tiktok.com/@bored_in_chicago/video/6797752197741432070"),
Places(title:"Lincoln Park Conservatory" , subtitle:"Free nature conservatory filled with colorful plantlife", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.924709, longitude: -87.634829), links:"https://www.tiktok.com/@bored_in_chicago/video/6797581991538691334"),
Places(title:"Medinah Temple Bloomingdales" , subtitle:"Fancy Bloomingdales in a colorful Islamic-looking building", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.892896, longitude: -87.627147), links:"https://www.tiktok.com/@bored_in_chicago/video/6797159712795266310"),
Places(title:"Logan Monument" , subtitle:"Famous Chicago memorial featuring the general John Logan", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.872577, longitude: -87.623967), links:"https://www.tiktok.com/@bored_in_chicago/video/6797012575818222853"),
Places(title:"Grant Skatepark" , subtitle:"Skatepark built at the site of (and with pieces of) the historic Grand Central Station", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.868057, longitude: -87.623028), links:"https://www.tiktok.com/@bored_in_chicago/video/6796770793884847365"),
Places(title:"Wrigley Building Walgreens" , subtitle:"Fancy Walgreens that incorporates design elements of the Wrigley building", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.889873, longitude: -87.624816), links:"https://www.tiktok.com/@bored_in_chicago/video/6796272484061678853"),
Places(title:"Michigan Avenue Apple Store" , subtitle:"Fancy Apple Store featuring product demos, study areas, and river views", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.889552, longitude: -87.62303), links:"https://www.tiktok.com/@bored_in_chicago/video/6796021125127097606"),
Places(title:"Chicago Cultural Center" , subtitle:"Free spot for cool art/music exhibits, concerts, and a massive Tiffany dome", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.883858, longitude: -87.624967), links:"https://www.tiktok.com/@bored_in_chicago/video/6790463111787826438"),
Places(title:"Fourth Presbyterian Church" , subtitle:"Cool church that is worth going inside", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.898814, longitude: -87.624708), links:"https://www.tiktok.com/@bored_in_chicago/video/6785993647230831877"),
Places(title:"Central Standard Building" , subtitle:"Site where the US timezones were established, with an awesome interior as well", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.90771, longitude: -87.632969), links:"https://www.tiktok.com/@bored_in_chicago/video/6785493397349158149"),
Places(title:"National Museum of Mexican Art" , subtitle:"Free museum showcasing Mexican, Latino, and Chicano art", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.856034, longitude: -87.672143), links:"https://www.tiktok.com/@bored_in_chicago/video/6785153520711503109"),
Places(title:"Marshall Field and Company" , subtitle:"Now housing a Macys, this historic building was the flagship store Marshall Field's and has a Tiffany mosaic", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.883712, longitude: -87.627047), links:"https://www.tiktok.com/@bored_in_chicago/video/6782152027079298309"),
Places(title:"Chicago Vietnam Memorial" , subtitle:"Cool, small, peaceful memorial along the river where you can relax and/or eat lunch", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.894971, longitude: -87.784624), links:"https://www.tiktok.com/@bored_in_chicago/video/6779322675794808069"),
Places(title:"St Peter's Church" , subtitle:"Fascinating church featuring a massive sculpture of Jesus on the cross", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.882348, longitude: -87.631459), links:"https://www.tiktok.com/@bored_in_chicago/video/6778191478763048197"),
Places(title:"Gethsemane Garden Center" , subtitle:"Great weekend morning store to see and/or buy some beautiful plants", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.986629, longitude: -87.669161), links:"https://www.tiktok.com/@bored_in_chicago/video/6771119547685588230"),
Places(title:"Rosehill Cemetery" , subtitle:"Huge public cemetery filled with the graves of many Chicagoans", catigory: "Landmark/Activity",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.986807, longitude: -87.675327), links:"https://www.tiktok.com/@bored_in_chicago/video/6770658626295172357"),
Places(title:"Andersonville" , subtitle:"Awesome, historically Swedish neighborhood", catigory: "Neighborhood",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.88531, longitude: -87.62213), links:"https://www.youtube.com/watch?v=lPLYrg63P8g"),
Places(title:"Pilsen" , subtitle:"Awesome, historically Mexican (and Czech) neighborhood", catigory: "Neighborhood",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.88531, longitude: -87.62213), links:"https://www.youtube.com/watch?v=T5rXrUoW5LU"),
Places(title:"Chinatown" , subtitle:"Awesome, historically Chinese neighborhood", catigory: "Neighborhood",price: "all",coordinate: CLLocationCoordinate2D(latitude:36.392135, longitude: -79.773094), links:"https://www.tiktok.com/@bored_in_chicago/video/6780813744671919366"),
Places(title:"Southbank Park" , subtitle:"An awesome riverwalk in the South Loop", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.874607, longitude: -87.635243), links:"https://www.youtube.com/watch?v=ENGBe3GLjf8"),
Places(title:"South Lakefront Trail" , subtitle:"The South Lakefront Trail is underappreciated and has many great gems (and views)", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.873091, longitude: -87.618926), links:"https://www.youtube.com/watch?v=u9I2pfKw0sI"),
Places(title:"Ping Tom Park" , subtitle:"A beautiful park in Chinatown that is great to explore", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.858392, longitude: -87.632711), links:"https://www.youtube.com/watch?v=wyziW00neyE"),
Places(title:"Millennium Park" , subtitle:"Huge park that features more than just the Bean", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.88531, longitude: -87.62213), links:"https://www.youtube.com/watch?v=wH1c35E8OVU"),
Places(title:"The 606" , subtitle:"Converted train line that is now an elevated trail for walking, running, and biking", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.915349, longitude: -87.72024), links:"https://www.tiktok.com/@bored_in_chicago/video/6851364811880615173"),
Places(title:"Chicago Firefighter/Paramedics Memorial" , subtitle:"Lesser known park dedicated to Chicago firefighters and paramedics", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.844883, longitude: -87.624032), links:"https://www.tiktok.com/@bored_in_chicago/video/6850806041001626886"),
Places(title:"West Ridge Nature Preserve" , subtitle:"Cool nature preserve, right along a busy road (Western), that is silent and peaceful inside", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.986662, longitude: -87.689548), links:"https://www.tiktok.com/@bored_in_chicago/video/6849857137737239813"),
Places(title:"Palmisano Park" , subtitle:"Park featuring a fishing/quarry pond, walking trails, a small waterfall, and great views of the skyline", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.844362, longitude: -87.646431), links:"https://www.tiktok.com/@bored_in_chicago/video/6847542436915432710"),
Places(title:"Chicago Pedway" , subtitle:"A series of underground walkways with restaurants, stores, and occassional art exhibits", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.884732, longitude: -87.624125), links:"https://www.tiktok.com/@bored_in_chicago/video/6800485969251355909"),
Places(title:"Oz Park" , subtitle:"Public park centered on the Wizard of Oz, with statues, slippers, and a yellow brick path", catigory: "Park",price: "all",coordinate: CLLocationCoordinate2D(latitude:41.918766, longitude: -87.64672), links:"https://www.tiktok.com/@bored_in_chicago/video/6792771291708509446")

]
    
    }}
