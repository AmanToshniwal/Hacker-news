//
//  NetworkManager.swift
//  HACKER News
//
//  Created by Aman Toshniwal on 07/01/22.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    
    func fetchData(){
        
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                if let e = error{
                    print(e.localizedDescription)
                }
                else{
                    
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                           let results =  try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
            
        }
        
        
    }
    
}
