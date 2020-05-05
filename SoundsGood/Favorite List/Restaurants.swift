/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Display list of restaurants based on food name
*/

import SwiftUI
//import SDWebImageSwiftUI
import WebKit


struct Restaurants: View {
    
    var foodName: String
    
    @ObservedObject var obs = observer()
    
    var body: some View {
        List(obs.datas) { i in
            Card(name: i.name, address: i.address, weburl: i.webUrl, rating: i.rating)
        }.navigationBarTitle("Near By Restaurants")
    }
}

class observer : ObservableObject{
    
    @Published var datas = [datatype]()
    
    init() {
        
        var url_search = ""
        switch globalID {
        case 1:
             url_search = "Ice%20Cream"
        case 2:
             url_search = "Chicken%20Nuggets"
        case 3:
             url_search = "Chicken%20Tenders"
        case 4:
             url_search = "Breakfast"
        case 5:
             url_search = "Macaroni%20and%20Cheese"
        case 6:
             url_search = "Fried%20Rice"
        case 7:
             url_search = "Egg%20Rolls"
        case 8:
             url_search = "Dumplings"
        case 9:
             url_search = "Sushi"
        case 10:
             url_search = "Empanadas"
        case 11:
             url_search = "Tacos"
        case 12:
             url_search = "Mexican"
        case 13:
             url_search = "Nachos"
        case 14:
             url_search = "Pizza"
        case 15:
             url_search = "Burgers"
        case 16:
             url_search = "Sandwich"
        case 17:
             url_search = "Grilled%20Cheese"
        case 18:
             url_search = "Peanut%20Butter%20and%20Jelly%20Sandwich"
        case 19:
             url_search = "Bagel"
        case 20:
             url_search = "Pancakes"
        case 21:
             url_search = "Waffles"
        case 22:
             url_search = "French%20Toast"
        case 23:
             url_search = "grocery"
        case 24:
             url_search = "Oatmeal"
        case 25:
             url_search = "Potato%20Chips"
        case 26:
             url_search = "Tortilla%20Chips"
        case 27:
             url_search = "Popcorn"
        case 28:
             url_search = "Pretzels%20(baked)"
        case 29:
             url_search = "Pretzels"
        case 30:
             url_search = "Crackers"
        case 31:
             url_search = "bakery"
        case 32:
             url_search = "bakery"
        case 33:
             url_search = "bakery"
        case 34:
             url_search = "Doughnut"
        case 35:
             url_search = "sweet"
        case 36:
             url_search = "Burgers"
        case 37:
             url_search = "Muffins"
        case 38:
             url_search = "Cheese%20Cake"
        case 39:
             url_search = "Enchiladas"
        case 40:
             url_search = "Steak"
        case 41:
             url_search = "Fried%20Chicken"
        case 42:
             url_search = "Grilled%20Chicken"
        case 43:
             url_search = "Ribs"
        case 44:
             url_search = "Hot%20Dog"
        case 45:
             url_search = "Lasagna"
        case 46:
             url_search = "Pudding"
        case 47:
             url_search = "Onion%20Rings"
        case 48:
             url_search = "Tamales"
        case 49:
             url_search = "Fajitas"
        case 50:
             url_search = "Taquitos"
        case 51:
             url_search = "Pasta"
        case 52:
             url_search = "Gelato"
        case 53:
             url_search = "Chow%20Mein"
        case 54:
             url_search = "Kung%20Pao%20Chicken"
        case 55:
             url_search = "chinese"
        case 56:
             url_search = "Wontons"
        case 57:
             url_search = "Egg%20Soup"
        case 58:
             url_search = "Beef%20and%20Broccoli"
        case 59:
             url_search = "Ramen"
        case 60:
             url_search = "Turkish"
        case 61:
             url_search = "Stuffed%20Grape%20Leaves"
        case 62:
             url_search = "Gyro"
        case 63:
             url_search = "Meatballs"
        case 64:
             url_search = "Oysters"
        case 65:
             url_search = "Shrimp%20Cocktail"
        case 66:
             url_search = "French"
        case 67:
             url_search = "Ratatouille"
        case 68:
             url_search = "Croissant"
        case 69:
             url_search = "Macarons"
        case 70:
             url_search = "Creme%20Brulee"
        case 71:
             url_search = "Thai"
        case 72:
             url_search = "Paella"
        case 73:
             url_search = "Samosas"
        case 74:
             url_search = "Naan"
        case 75:
             url_search = "Chicken"
        case 76:
             url_search = "Hummus"
        case 77:
             url_search = "Salad"
        case 78:
             url_search = "veggie"
        case 79:
             url_search = "String%20Cheese"
        case 80:
             url_search = "Pizza"
        case 81:
             url_search = "Rice%20Krispies"
        case 82:
             url_search = "Corn%20Nuts"
        case 83:
             url_search = "Gummy%20Bears"
        case 84:
             url_search = "Gummy%20Worms"
        case 85:
             url_search = "Licorice"
        case 86:
             url_search = "Chocolate"
        case 87:
             url_search = "grocery"
        case 88:
             url_search = "candy"
        case 89:
             url_search = "grocery"
        case 90:
             url_search = "Sour%20Patch%20Kids"
        case 91:
             url_search = "grocery"
        case 92:
             url_search = "grocery"
        case 93:
             url_search = "grocery"
        case 94:
             url_search = "Cinnamon%20Rolls"
        case 95:
             url_search = "sweets"
        case 96:
             url_search = "pastries"
        case 97:
             url_search = "pastries"
        case 98:
             url_search = "pastries"
        case 99:
             url_search = "Pie"
        case 100:
             url_search = "Pie"
        case 101:
             url_search = "Pie"
        case 102:
             url_search = "Bakery"
        case 103:
             url_search = "Fruit%20Tart"
        case 104:
             url_search = "Pie"
        case 105:
             url_search = "Chicken%20Noodle%20Soup"
        case 106:
             url_search = "Tomato%20Soup"
        case 107:
             url_search = "Clam%20Chowder"
        case 108:
             url_search = "Tortilla%20Soup"
        case 109:
             url_search = "Kabob"
        default:
            url_search = "pizza"
        }
        
        let url1 = "https://developers.zomato.com/api/v2.1/search?q=\(url_search)&lat=34.237923&lon=-118.530197&sort=real_distance"
        let api = "cb00df69e246563307019d9e0878d184"
        
        let url = URL(string: url1)
        var request = URLRequest(url: url!)
    
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(api, forHTTPHeaderField: "user-key")
        request.httpMethod = "GET"
        
        let sess = URLSession(configuration: .default)
        sess.dataTask(with: request) { (data, _, _) in
            
            do{
                
                let fetch = try JSONDecoder().decode(Type.self, from: data!)
                print(fetch)
                
                for i in fetch.restaurants{
                    
                    DispatchQueue.main.async {
                        
                        self.datas.append(datatype(id: i.restaurant.id, name: i.restaurant.name, rating: i.restaurant.user_rating.rating_obj.title.text, address: i.restaurant.location.address, webUrl: i.restaurant.url))
                    }
                }
            }
            catch{
                
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

struct datatype : Identifiable {
    
    var id : String
    var name : String
    var rating : String
    var address : String
    var webUrl : String
}

struct Type : Decodable {
    var restaurants : [Type1]
}

struct Type1 : Decodable{
    var restaurant : Type2
}


struct Type2 : Decodable {
    
    var id : String
    var name : String
    var url : String
    var location : Type7
    var user_rating : Type3
}

struct Type3 : Decodable {
    var rating_obj : Type4
}
struct Type4 : Decodable {
    var title : Type5
}
struct Type5 : Decodable {
    var text : String
}
struct Type7 : Decodable {
    var address : String
}

struct Card : View {
    
    var name = ""
    var address = ""
    var weburl = ""
    var rating = ""
    
    var body : some View{

        NavigationLink(destination: register(url: weburl, name: name)) {
            
            HStack{
                
                VStack(alignment: .leading) {
                    
                    Text(name).fontWeight(.heavy)
                    HStack {
                    Text(rating)
                    Image(systemName: "star.fill").foregroundColor(.black).font(.system(size: 15))
                    }
                    Text(address)
                }.padding(.vertical, 10)
            }
        }
    }
}

struct register : View {
    
    var url = ""
    var name = ""
    
    var body : some View{
        
        WebView(url: url).navigationBarTitle(name)
    }
}

struct WebView : UIViewRepresentable {
    
    var url = ""
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        
        let web = WKWebView()
        web.load(URLRequest(url: URL(string: url)!))
        return web
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}
