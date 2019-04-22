//
//  ViewController.swift
//  JsonPractice
//
//  Created by Suraj Prasad on 12/03/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit
public struct RootClass: Decodable{
    
    public var results : [Result]!

}
public struct Result: Decodable {
    
    public var abstractField : String!
    
 //   public var multimedia : [Multimedia]!

    public var title : String!
   
}
//public struct Multimedia : Decodable {
//
//
//    public var format : String!
//    public var height : Int!
//    public var subtype : String!
//    public var type : String!
//    public var url : String!
//    public var width : Int!
//
//}
//

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let urlString = "https://api.nytimes.com/svc/topstories/v2/sports.json?api-key=ef81e01863cd4083b327f1a9ff6a9317"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode(RootClass.self, from: data)
                
                print(courses.results)
                
            }catch let JsonErr {
                print(JsonErr)
            }
        }.resume()
    }
    


    
}

