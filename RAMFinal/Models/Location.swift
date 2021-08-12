import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

extension Location: ApiModelProtocol {
    static var urlString: String {
        return "https://rickandmortyapi.com/api/location"
    }
}

