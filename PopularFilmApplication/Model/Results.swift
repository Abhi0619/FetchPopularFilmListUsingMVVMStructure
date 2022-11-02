

import Foundation
struct Results : Codable {
    var adult : Bool = false
    var backdrop_path : String = ""
    var genre_ids : [Int] = []
    var id : Int = 0
    var original_language : String = ""
    var original_title : String = ""
    var overview : String = ""
    var popularity : Double = 0.0
    var poster_path : String = ""
    var release_date : String = ""
    var title : String = ""
    var video : Bool = false
    var vote_average : Double = 0.0
    var vote_count : Int = 0

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdrop_path = "backdrop_path"
		case genre_ids = "genre_ids"
		case id = "id"
		case original_language = "original_language"
		case original_title = "original_title"
		case overview = "overview"
		case popularity = "popularity"
		case poster_path = "poster_path"
		case release_date = "release_date"
		case title = "title"
		case video = "video"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
	}

    init(result: [String:Any]) {
        if let adult = result["adult"] as? Bool {
            self.adult = adult
        }
        if let adult = result["backdrop_path"] as? String {
            self.backdrop_path = adult
        }
        if let adult = result["genre_ids"] as? [Int] {
            self.genre_ids = adult
        }
        if let adult = result["id"] as? Int {
            self.id = adult
        }
        if let adult = result["original_language"] as? String {
            self.original_language = adult
        }
        if let adult = result["original_title"] as? String {
            self.original_title = adult
        }
        if let adult = result["overview"] as? String {
            self.overview = adult
        }
        if let adult = result["popularity"] as? Double {
            self.popularity = adult
        }
        if let adult = result["poster_path"] as? String {
            self.poster_path = adult
        }
        if let adult = result["release_date"] as? String {
            self.release_date = adult
        }
        if let adult = result["title"] as? String {
            self.title = adult
        }
        if let adult = result["video"] as? Bool {
            self.video = adult
        }
        if let adult = result["vote_average"] as? Double {
            self.vote_average = adult
        }
        if let adult = result["vote_count"] as? Int {
            self.vote_count = adult
        }
	}

}
