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
        
        NavigationView {
            
            List(obs.datas){i in
                
                Card(name: i.name, address: i.address, weburl: i.webUrl, rating: i.rating)
                
            }.navigationBarTitle("Near By Restaurants")
        }
    }
}

class observer : ObservableObject{
    
    @Published var datas = [datatype]()
    
    
    init() {
        
        var url_search = ""
        switch globalID {
        case 1:
            url_search = "ice%20cream"
        case 2:
            url_search = "chicken%20nuggets"
        case 3:
            url_search = "chicken%20tenders"
        case 4: //omlete. let's search breakfast
            url_search = "breakfast"
        case 5:
            url_search = "macaroni%20and%20Cheese"
        case 6:
            url_search = "fried%20rice"

        case 9:
            url_search = "sushi"
        case 14:
            url_search = "pizza"
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
