//
//  FetchPopularFilm.swift
//  PopularFilmApplication
//
//  Created by IPS-153 on 06/10/22.
//

import Foundation
import UIKit
import Alamofire
class FetchPopularFilm {
    var arrDate: [Results] = []
    static var shared = FetchPopularFilm()
    var completionHandler: (()->Void)?
    func getPopularFilmData(movieType:String,completionHanler: @escaping ((Json4Swift_Base)->Void)) {
        AF.request("\(Utilies.shared.baseUrl)\(movieType)?api_key=\(Utilies.shared.apiKey)").response { (response) in
            if let data = response.data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                    
                    let jsondata = Json4Swift_Base(data: json)
                    completionHanler(jsondata)
                }catch {
                    print("error")
                }
            }
        }
    }
}
