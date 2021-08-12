import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
    }
}

extension Episode: ApiModelProtocol{
    static var urlString: String{
        return "https://rickandmortyapi.com/api/episode"
    }
}

// Utils
extension Episode {
    var numberOfCharacters: Int {
        characters.count
    }
}

