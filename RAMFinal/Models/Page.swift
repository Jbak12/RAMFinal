import Foundation

struct Page<T: Codable>: Codable {
    var info: Info
    var results: [T]
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
    }
}
