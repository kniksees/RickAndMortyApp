//
//  Model.swift
//  RM1
//
//  Created by Дмитрий Ерофеев on 20.08.2023.
//

import Foundation
import UIKit

class InfoAndData {
    
    static var heroes = [Person]()
    static var imagesData = [Data]()
    static var countOfPersons: Int = 0
    static var personInfo = [PersonInfo]()
    static var planetInfo = [Planet]()
    static var episodes = [Episode]()
    static var url = String()
    static var image = UIImage()
    static var sections = ["", "Info", "Origin", "Episodes"]
    
    static func episodeNumberFormater(episode: String) -> String {
        let arr = Array(episode)
        return "Episode: \(Int(String(arr[4...5]))!), Season: \(Int(String(arr[1...2]))!)"
    }
}


