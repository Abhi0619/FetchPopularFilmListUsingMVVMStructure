

import Foundation
struct Json4Swift_Base : Codable {
	var page : Int = 0
    var results : [Results] = []
    var total_pages : Int = 0
    var total_results : Int = 0

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case results = "results"
		case total_pages = "total_pages"
		case total_results = "total_results"
	}

    init(data : [String:Any])  {
        if let page = data["page"] as? Int {
            self.page = page
        }
        if let results = data["results"] as? [[String:Any]] {
            for value in results{
                if let i = value as? [String:Any] {
                    self.results.append(Results(result: i))
                }
            }
        }
        if let page = data["total_pages"] as? Int {
            self.total_pages = page
        }
        if let page = data["total_results"] as? Int {
            self.total_results = page
        }
	}

}
