import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: Status?
    let species: String
    let type: String
    let gender: String
    let origin: LocationShort
    let location: LocationShort
    let image: String?
    let episode: [String]
    let url: String
    let created: String

    struct LocationShort: Codable {
        let name: String
        let url: String
    }

    enum Status: String, Codable {
        case dead = "Dead"
        case alive = "Alive"
        case unknown = "unknown"
    }

    enum Species: String, Codable {
        case alien = "Alien"
        case human = "Human"
    }
}

extension Character: ApiModelProtocol {
    static var urlString: String {
        return "https://rickandmortyapi.com/api/character"
    }
}

