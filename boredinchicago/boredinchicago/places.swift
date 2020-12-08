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
    var category: String
    var links: String
    var linkpic: String

//    var type: CatType
//    var lattitude: CLLocationDegrees
//    var longtitude: CLLocationDegrees

   init(
      title: String,
      subtitle: String,
      category: String,
      coordinate: CLLocationCoordinate2D,
      links: String,
      linkpic: String
    

//      type: CatType
    ) {

      self.subtitle = subtitle

      self.category = category
      self.title = title
      self.coordinate = coordinate
      self.links = links
      self.linkpic = linkpic
      super.init()
  
    }
    var markerTintColor: UIColor  {
       switch category {
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

    placesA = [
    
    Places(title:"Monument to the Great Migration",subtitle:"Statue celebrating the thousands of African Americans that migrated north to Chicago",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8465, longitude:-87.618408), links:"https://www.boredinchicago.com/chicago-places/monument-to-the-great-migration", linkpic: "bored"),
    Places(title:"Shit Fountain",subtitle:"A fine piece of art featuring poop and water",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8997072, longitude:-87.6744527), links:"https://www.boredinchicago.com/chicago-places/shit-fountain", linkpic: "bored"),
    Places(title:"Wabash Arts Corridor",subtitle:"Numerous artistic street murals located in Printers Row/South Loop",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8734507, longitude:-87.6256481), links:"https://www.boredinchicago.com/chicago-places/wabash-arts-corridor", linkpic: "bored"),
    Places(title:"Bronzeville Renaissance Mural",subtitle:"New mural that celebrates the past and future of Bronzeville",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.82506, longitude:-87.62324), links:"https://www.boredinchicago.com/chicago-places/bronzeville-renaissance-mural", linkpic: "bored"),
    Places(title:"Secret Mermaid",subtitle:"Carving of a mermaid on a limestone rock with an interesting (and illegal) origin story",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8231721, longitude:-87.59941718), links:"https://www.boredinchicago.com/chicago-places/secret-mermaid", linkpic: "bored"),
    Places(title:"Vivian Maier Mural",subtitle:"Awesome mural of the late Chicago street photographer, Vivian Maier",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.9103083, longitude:-87.6697272), links:"https://www.boredinchicago.com/chicago-places/vivian-maier-mural", linkpic: "bored"),
    Places(title:"Lucent",subtitle:"Massive sculpture with the same amount of lights as visible stars in the Northern Hemisphere",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8987942, longitude:-87.6229702), links:"https://www.boredinchicago.com/chicago-places/lucent", linkpic: "bored"),
    Places(title:"Chicago Gallery (Hubbard Street Murals)",subtitle:"Restored, old set of street art with a few new additions",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.89011143, longitude:-87.65407342), links:"https://www.boredinchicago.com/chicago-places/chicago-gallery-(hubbard-street-murals)", linkpic: "bored"),
    Places(title:"Greeting from Chicago Mural",subtitle:"The classic mural that you've probably seen on Instagram thousands of times",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.921188, longitude:-87.69442), links:"https://www.boredinchicago.com/chicago-places/greeting-from-chicago-mural", linkpic: "bored"),
    Places(title:"La Ronda Parakata",subtitle:"Hidden wooden Stonehenge-like structure tucked away along the south Lakefront trail",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.91349, longitude:-87.62586), links:"https://www.boredinchicago.com/chicago-places/la-ronda-parakata", linkpic: "bored"),
    Places(title:"The Radience of Being",subtitle:"Two-floor mural in a lesser known alcove of the Chicago Riverwalk",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.88531034, longitude:-87.62212952), links:"https://www.boredinchicago.com/chicago-places/the-radience-of-being", linkpic: "bored"),
    Places(title:"Robin Williams Mural",subtitle:"Great mural of the late Robin Williams and one of his characters (Genie)",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.91830331, longitude:-87.68964998), links:"https://www.boredinchicago.com/chicago-places/robin-williams-mural", linkpic: "bored"),
    Places(title:"Monument with Standing Beast",subtitle:"That weird piece of public art that resembles 'Snoopy in a blender'",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.885104, longitude:-87.6315294), links:"https://www.boredinchicago.com/chicago-places/monument-with-standing-beast", linkpic: "bored"),
    Places(title:"Untitled (Picasso)",subtitle:"How cool is it that Chicago just has a massive Picasso art piece in the middle of a plaza?",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8840894, longitude:-87.6301906), links:"https://www.boredinchicago.com/chicago-places/untitled-(picasso)", linkpic: "bored"),
    Places(title:"Nevermore Park",subtitle:"Trippy interactive art museum featuring the character FlyBoy",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8596334, longitude:-87.650616), links:"https://www.boredinchicago.com/chicago-places/nevermore-park", linkpic: "bored"),
    Places(title:"Quincy Jones Mural",subtitle:"Massive, highly detailed mural of the famous jazz musician",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.921188, longitude:-87.69442), links:"https://www.boredinchicago.com/chicago-places/quincy-jones-mural", linkpic: "bored"),
    Places(title:"Chicago River Mural",subtitle:"Huge mural map of the Chicago river and where you are relative to it",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8772526, longitude:-87.6370652), links:"https://www.boredinchicago.com/chicago-places/chicago-river-mural", linkpic: "bored"),
    Places(title:"Michael Jordan and Walter Payton Mural",subtitle:"Awesome mural of two of Chicago's (and the world's) greatest athletes",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8599412, longitude:-87.64085556), links:"https://www.boredinchicago.com/chicago-places/michael-jordan-and-walter-payton-mural", linkpic: "bored"),
    Places(title:"Four Seasons (Chagall)",subtitle:"How cool is it that Chicago just has a massive Chagall art piece on the side of a plaza?",category:"Art",coordinate: CLLocationCoordinate2D(latitude:41.8813516, longitude:-87.6301195), links:"https://www.boredinchicago.com/chicago-places/four-seasons-(chagall)", linkpic: "bored"),
    Places(title:"Headquarters Beercade",subtitle:"Bar where you can play tons of old arcade games as you drink",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.897189, longitude:-87.6351938), links:"https://www.boredinchicago.com/chicago-places/headquarters-beercade", linkpic: "bored"),
    Places(title:"Ceres",subtitle:"Bar that features extremely stiff, cheap drinks at the bottom of the Board of Trade building. By far my favorite bar in the city",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.8774924, longitude:-87.6322728), links:"https://www.boredinchicago.com/chicago-places/ceres", linkpic: "bored"),
    Places(title:"Bunny Slope",subtitle:"Apres ski bar where you can rent out a private hottub for you and your friends",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.8922498, longitude:-87.6275033), links:"https://www.boredinchicago.com/chicago-places/bunny-slope", linkpic: "bored"),
    Places(title:"Maria's Packaged Goods",subtitle:"There is a speakeasy bar hidden in the back of what looks like a standard liquor store",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.8381964, longitude:-87.6511928), links:"https://www.boredinchicago.com/chicago-places/maria's-packaged-goods", linkpic: "bored"),
    Places(title:"Offshore Rooftop Bar",subtitle:"The largest rooftop bar in the world, located at Navy Pier",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.891769, longitude:-87.601143), links:"https://www.boredinchicago.com/chicago-places/offshore-rooftop-bar", linkpic: "bored"),
    Places(title:"Berkshire Room",subtitle:"A bar that features the 'dealers choice', where bartenders will custom-craft you a cocktail based on short questionnaire",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.8922498, longitude:-87.6275033), links:"https://www.boredinchicago.com/chicago-places/berkshire-room", linkpic: "bored"),
    Places(title:"Simone's",subtitle:"A sustainabiltiy-focused bar that reuses trash as decorations",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.8582756, longitude:-87.6511025), links:"https://www.boredinchicago.com/chicago-places/simone's", linkpic: "bored"),
    Places(title:"Infield's",subtitle:"A bar located underground in the Chicago Pedway",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.8837119, longitude:-87.627047), links:"https://www.boredinchicago.com/chicago-places/infield's", linkpic: "bored"),
    Places(title:"Rossi's",subtitle:"A fantastic dive bar where you serve yourself drinks from the fridge",category:"Bar",coordinate: CLLocationCoordinate2D(latitude:41.8897128, longitude:-87.6281979), links:"https://www.boredinchicago.com/chicago-places/rossi's", linkpic: "bored"),
    Places(title:"TimeOut Market",subtitle:"A great food hall featuring some of the best restaraurants of Chicago",category:"Food",coordinate: CLLocationCoordinate2D(latitude:41.8868501, longitude:-87.65050532), links:"https://www.boredinchicago.com/chicago-places/timeout-market", linkpic: "bored"),
    Places(title:"Redhot Ranch",subtitle:"The Best Cheap Burger in Chicago",category:"Food",coordinate: CLLocationCoordinate2D(latitude:41.91723, longitude:-87.68924), links:"https://www.boredinchicago.com/chicago-places/redhot-ranch", linkpic: "bored"),
    Places(title:"Starbucks Roastery",subtitle:"The world's largest Starbucks with both coffee and cocktails",category:"Food",coordinate: CLLocationCoordinate2D(latitude:41.89274716, longitude:-87.62432807), links:"https://www.boredinchicago.com/chicago-places/starbucks-roastery", linkpic: "bored"),
    Places(title:"Podhalanka",subtitle:"The last remaining Polish restaurant in the historic Polish Triangle of Chicago",category:"Food",coordinate: CLLocationCoordinate2D(latitude:41.9031087, longitude:-87.6670393), links:"https://www.boredinchicago.com/chicago-places/podhalanka", linkpic: "bored"),
    Places(title:"Pittsfield Café",subtitle:"A hidden gem of a restaurant, where you can sit 'outdoors' in the lobby of a historic building",category:"Food",coordinate: CLLocationCoordinate2D(latitude:41.8828786, longitude:-87.629682), links:"https://www.boredinchicago.com/chicago-places/pittsfield-caf%C3%A9", linkpic: "bored"),
    Places(title:"Ava's Italian Ice",subtitle:"The World's Healthiest Italian Ice!",category:"Food",coordinate: CLLocationCoordinate2D(latitude:41.9144845, longitude:-87.6875585), links:"https://www.boredinchicago.com/chicago-places/ava's-italian-ice", linkpic: "bored"),
    Places(title:"Global Menu McDonalds",subtitle:"A McDonalds where you can try featured items from other countries",category:"Food",coordinate: CLLocationCoordinate2D(latitude:41.88421335, longitude:-87.65334444), links:"https://www.boredinchicago.com/chicago-places/global-menu-mcdonalds", linkpic: "bored"),
    Places(title:"Holy Name Cathedral",subtitle:"Beautiful church that is also one of the largest Roman Catholic dioceses in the USA",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.895969, longitude:-87.627022), links:"https://www.boredinchicago.com/chicago-places/holy-name-cathedral", linkpic: "bored"),
    Places(title:"Walt Disney's Birthplace",subtitle:"The family home that Walt Disney (of Disney fame) was born",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.920528, longitude:-87.73304), links:"https://www.boredinchicago.com/chicago-places/walt-disney's-birthplace", linkpic: "bored"),
    Places(title:"Harold Washington Library",subtitle:"Massive library with tons to do inside",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8763134, longitude:-87.6282096), links:"https://www.boredinchicago.com/chicago-places/harold-washington-library", linkpic: "bored"),
    Places(title:"Central Standard Building",subtitle:"Site where the US timezones were established, with an awesome interior as well",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.87869346, longitude:-87.63218181), links:"https://www.boredinchicago.com/chicago-places/central-standard-building", linkpic: "bored"),
    Places(title:"Couch Place Alley",subtitle:"An alley where 600 people died in a 1903 fire",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8853481, longitude:-87.6284362), links:"https://www.boredinchicago.com/chicago-places/couch-place-alley", linkpic: "bored"),
    Places(title:"City Mini Golf",subtitle:"Charming mini golf spot where the holes feature minaturized Chicago landmarks",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8839082, longitude:-87.6190945), links:"https://www.boredinchicago.com/chicago-places/city-mini-golf", linkpic: "bored"),
    Places(title:"Chicago Poetry Foundation",subtitle:"Quiet, relaxing spot filled with a massive collection of poetry",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8954145, longitude:-87.6305881), links:"https://www.boredinchicago.com/chicago-places/chicago-poetry-foundation", linkpic: "bored"),
    Places(title:"Graceland Cemetery",subtitle:"Large historic cemetery where many famous Chicagoans have been buried",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.954788, longitude:-87.662277), links:"https://www.boredinchicago.com/chicago-places/graceland-cemetery", linkpic: "bored"),
    Places(title:"Wooden Block Alley",subtitle:"The only remaining alley in Chicago that is made of wooden blocks",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.90697242, longitude:-87.63204369), links:"https://www.boredinchicago.com/chicago-places/wooden-block-alley", linkpic: "bored"),
    Places(title:"National Museum of Mexican Art",subtitle:"Free museum showcasing Mexican, Latino, and Chicano art",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.85597446, longitude:-87.67234738), links:"https://www.boredinchicago.com/chicago-places/national-museum-of-mexican-art", linkpic: "bored"),
    Places(title:"Miller Lite Bush",subtitle:"A bush shaped to look like a bottle, complete with a Miller Lite wrapper wrapped around it",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.92458, longitude:-87.72776), links:"https://www.boredinchicago.com/chicago-places/miller-lite-bush", linkpic: "bored"),
    Places(title:"Palmer House Hotel",subtitle:"Historic hotel lobby/bar and the birthplace of the brownie",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8803312, longitude:-87.6269354), links:"https://www.boredinchicago.com/chicago-places/palmer-house-hotel", linkpic: "bored"),
    Places(title:"AIRE Ancient Baths",subtitle:"Luxurious bathhouse experience modeled after those in Ancient Europe",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.895, longitude:87.677078), links:"https://www.boredinchicago.com/chicago-places/aire-ancient-baths", linkpic: "bored"),
    Places(title:"Lincoln Park Conservatory",subtitle:"Free nature conservatory filled with colorful plantlife",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.924294, longitude:-87.6353297), links:"https://www.boredinchicago.com/chicago-places/lincoln-park-conservatory", linkpic: "bored"),
    Places(title:"St Peter's in the Loop",subtitle:"Fascinating church featuring a massive sculpture of Jesus on the cross",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8823482, longitude:-87.6314586), links:"https://www.boredinchicago.com/chicago-places/st-peter's-in-the-loop", linkpic: "bored"),
    Places(title:"Original Playboy Mansion",subtitle:"Pretty self-explanatory - this used to be the Playboy Mansion. NOTE: this is someone's actual house so no entry",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.9070301, longitude:-87.6291629), links:"https://www.boredinchicago.com/chicago-places/original-playboy-mansion", linkpic: "bored"),
    Places(title:"Rosehill Cemetery",subtitle:"Huge public cemetery filled with the graves of many Chicagoans",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.9868073, longitude:-87.6753267), links:"https://www.boredinchicago.com/chicago-places/rosehill-cemetery", linkpic: "bored"),
    Places(title:"Route 66 Sign",subtitle:"The official starting spot of Route 66, designated with a sign",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8796246, longitude:-87.62560076), links:"https://www.boredinchicago.com/chicago-places/route-66-sign", linkpic: "bored"),
    Places(title:"Rookery",subtitle:"Downtown building with a really cool (and Insta-worthy) lobby",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.87914398, longitude:-87.63219426), links:"https://www.boredinchicago.com/chicago-places/rookery", linkpic: "bored"),
    Places(title:"Old Watertower",subtitle:"A super old building with always-changing interesting exhibits inside",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.89749284, longitude:-87.62393101), links:"https://www.boredinchicago.com/chicago-places/old-watertower", linkpic: "bored"),
    Places(title:"Stan Mansion",subtitle:"Building that once housed the Knights Templar and Masonic Lodge",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.92511, longitude:-87.70813), links:"https://www.boredinchicago.com/chicago-places/stan-mansion", linkpic: "bored"),
    Places(title:"Bronzeville Walk of Fame",subtitle:"Plaques line the street showcasing the greats of Bronzeville",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.81025229, longitude:-87.61626148), links:"https://www.boredinchicago.com/chicago-places/bronzeville-walk-of-fame", linkpic: "bored"),
    Places(title:"Logan Monument",subtitle:"Famous Chicago memorial featuring the general John Logan",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8993873, longitude:-87.6240282), links:"https://www.boredinchicago.com/chicago-places/logan-monument", linkpic: "bored"),
    Places(title:"Yellow Brick Road",subtitle:"An area where the sidwalk turns gold to recognize the former house of the Wizard of Oz' author",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.911678, longitude:-87.701431), links:"https://www.boredinchicago.com/chicago-places/yellow-brick-road", linkpic: "bored"),
    Places(title:"Elks Memorial",subtitle:"A free war memorial filled with great art and architecture",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.932541, longitude:-87.639542), links:"https://www.boredinchicago.com/chicago-places/elks-memorial", linkpic: "bored"),
    Places(title:"Beyond the Vines",subtitle:"Memorial dedicated to hardcore Cubs fans in the Bohemian Cemetery",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.977001, longitude:-87.727951), links:"https://www.boredinchicago.com/chicago-places/beyond-the-vines", linkpic: "bored"),
    Places(title:"Bohemian National Cemetery",subtitle:"Large, gorgeous cemetery filled with statues, war memorials, and a Cubs fan memorial",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.977001, longitude:-87.727951), links:"https://www.boredinchicago.com/chicago-places/bohemian-national-cemetery", linkpic: "bored"),
    Places(title:"Leaning Tower of Niles",subtitle:"A slightly smaller version of the famous Pisa statue… but in Niles",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:42.013241, longitude:-87.783958), links:"https://www.boredinchicago.com/chicago-places/leaning-tower-of-niles", linkpic: "bored"),
    Places(title:"Clarke House",subtitle:"The oldest remaining house in Chicago",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.857101, longitude:-87.621872), links:"https://www.boredinchicago.com/chicago-places/clarke-house", linkpic: "bored"),
    Places(title:"Swedish American Museum",subtitle:"Great museum focusing specifically on Swedish Americans",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.976601, longitude:-87.66806), links:"https://www.boredinchicago.com/chicago-places/swedish-american-museum", linkpic: "bored"),
    Places(title:"Winter Garden",subtitle:"A great, quiet study spot at the top of the Harold Washington Library",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8763134, longitude:-87.6282096), links:"https://www.boredinchicago.com/chicago-places/winter-garden", linkpic: "bored"),
    Places(title:"Joliet Iron and Steel Works",subtitle:"Explore the remains of what was once the 2nd largest steel mill in the US",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.53621043, longitude:-88.08139611), links:"https://www.boredinchicago.com/chicago-places/joliet-iron-and-steel-works", linkpic: "bored"),
    Places(title:"Sky Chapel",subtitle:"The highest chapel in the world, located in the Chicago Temple",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8828473, longitude:-87.6306097), links:"https://www.boredinchicago.com/chicago-places/sky-chapel", linkpic: "bored"),
    Places(title:"Chicago Cultural Center",subtitle:"Free spot for cool art/music exhibits, concerts, and a massive Tiffany dome",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8838579, longitude:-87.624967), links:"https://www.boredinchicago.com/chicago-places/chicago-cultural-center", linkpic: "bored"),
    Places(title:"Chicago Municipal Tuberculosis Sanitarium",subtitle:"The former site of the largest municipal sanitorum in the USA",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.995361, longitude:-87.728912), links:"https://www.boredinchicago.com/chicago-places/chicago-municipal-tuberculosis-sanitarium", linkpic: "bored"),
    Places(title:"Chicago Vietnam Memorial",subtitle:"Cool, small, peaceful memorial along the river where you can relax and/or eat lunch",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.88531034, longitude:-87.62212952), links:"https://www.boredinchicago.com/chicago-places/chicago-vietnam-memorial", linkpic: "bored"),
    Places(title:"Victory Monument",subtitle:"Sculpture that honors an African American unit that served in World War I",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.831009, longitude:-87.617439), links:"https://www.boredinchicago.com/chicago-places/victory-monument", linkpic: "bored"),
    Places(title:"Monadnock Building",subtitle:"Once the largest office building in the world, it now features stores/offices that could have only existed when the building was built (end of 19th century)",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.877949, longitude:-87.6295626), links:"https://www.boredinchicago.com/chicago-places/monadnock-building", linkpic: "bored"),
    Places(title:"Fourth Presbyterian Church",subtitle:"Cool church that is worth going inside",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8985781, longitude:-87.6249535), links:"https://www.boredinchicago.com/chicago-places/fourth-presbyterian-church", linkpic: "bored"),
    Places(title:"Palmisano Park",subtitle:"Park featuring a fishing/quarry pond, walking trails, a small waterfall, and great views of the skyline",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.84439, longitude:-87.64657), links:"https://www.boredinchicago.com/chicago-places/palmisano-park", linkpic: "bored"),
    Places(title:"Southbank Park",subtitle:"An awesome riverwalk in the South Loop",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.874451, longitude:-87.635094), links:"https://www.boredinchicago.com/chicago-places/southbank-park", linkpic: "bored"),
    Places(title:"Botany Pond",subtitle:"Uber green and uber naturey pond on the University of Chicago campus",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.79142, longitude:-87.59892), links:"https://www.boredinchicago.com/chicago-places/botany-pond", linkpic: "bored"),
    Places(title:"West Ridge Nature Preserve",subtitle:"Cool nature preserve, right along a busy road (Western), that is silent and peaceful inside",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.98709, longitude:-87.68939), links:"https://www.boredinchicago.com/chicago-places/west-ridge-nature-preserve", linkpic: "bored"),
    Places(title:"Chicago Pedway",subtitle:"A series of underground walkways with restaurants, stores, and occassional art exhibits",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.8846746, longitude:-87.6241163), links:"https://www.boredinchicago.com/chicago-places/chicago-pedway", linkpic: "bored"),
    Places(title:"Oz Park",subtitle:"Public park centered on the Wizard of Oz, with statues, slippers, and a yellow brick path",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.9187662, longitude:-87.6467293), links:"https://www.boredinchicago.com/chicago-places/oz-park", linkpic: "bored"),
    Places(title:"The 606",subtitle:"Converted train line that is now an elevated trail for walking, running, and biking",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.91536173, longitude:-87.72030064), links:"https://www.boredinchicago.com/chicago-places/the-606", linkpic: "bored"),
    Places(title:"North Park Village Nature Center",subtitle:"Nature preserve that uniquely features four different natural environments.",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.995361, longitude:-87.728912), links:"https://www.boredinchicago.com/chicago-places/north-park-village-nature-center", linkpic: "bored"),
    Places(title:"Chicago Firefighter/Paramedics Memorial",subtitle:"Lesser known park dedicated to Chicago firefighters and paramedics",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.84463169, longitude:-87.62417165), links:"https://www.boredinchicago.com/chicago-places/chicago-firefighter%2Fparamedics-memorial", linkpic: "bored"),
    Places(title:"Ping Tom Park",subtitle:"A beautiful park in Chinatown that is great to explore",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.858719, longitude:-87.632134), links:"https://www.boredinchicago.com/chicago-places/ping-tom-park", linkpic: "bored"),
    Places(title:"Alfred Caldwell Lily Pool",subtitle:"Hidden pond just off of Lake Shore Drive and near the Lincoln Park Zoo",category:"Park",coordinate: CLLocationCoordinate2D(latitude:41.925789, longitude:-87.63398), links:"https://www.boredinchicago.com/chicago-places/alfred-caldwell-lily-pool", linkpic: "bored"),
    Places(title:"Busse Forest Elk Pasture",subtitle:"A pasture that houses a herd of Elks in (wait for it) Elk Grove",category:"Park",coordinate: CLLocationCoordinate2D(latitude:42.031502, longitude:-87.985207), links:"https://www.boredinchicago.com/chicago-places/busse-forest-elk-pasture", linkpic: "bored"),
    Places(title:"Home Bank and Trust CVS",subtitle:"Fancy CVS that was built in and still showcases a historic Chicago bank",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.9037197, longitude:-87.6675713), links:"https://www.boredinchicago.com/chicago-places/home-bank-and-trust-cvs", linkpic: "bored"),
    Places(title:"Noel State Bank Walgreens",subtitle:"This Walgreens is built in a former bank and has a vitamin vault!",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.9108509, longitude:-87.6777701), links:"https://www.boredinchicago.com/chicago-places/noel-state-bank-walgreens", linkpic: "bored"),
    Places(title:"Wrigley Building Walgreens",subtitle:"Fancy Walgreens that incorporates design elements of the Wrigley building",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8898732, longitude:-87.6248164), links:"https://www.boredinchicago.com/chicago-places/wrigley-building-walgreens", linkpic: "bored"),
    Places(title:"Marshall Field and Company",subtitle:"Now housing a Macys, this historic building was the flagship store Marshall Field's and has a Tiffany mosaic",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8837119, longitude:-87.627047), links:"https://www.boredinchicago.com/chicago-places/marshall-field-and-company", linkpic: "bored"),
    Places(title:"Sullivan Center Target",subtitle:"This Target is in a former fancy department store and kept many of its original features",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8818812, longitude:-87.6274565), links:"https://www.boredinchicago.com/chicago-places/sullivan-center-target", linkpic: "bored"),
    Places(title:"Medinah Temple Bloomingdales",subtitle:"Fancy Bloomingdales in a colorful Islamic-looking building",category:"Landmark/Activity",coordinate: CLLocationCoordinate2D(latitude:41.8928956, longitude:-87.6271473), links:"https://www.boredinchicago.com/chicago-places/medinah-temple-bloomingdales", linkpic: "bored"),
    
    ]
    
    }}
