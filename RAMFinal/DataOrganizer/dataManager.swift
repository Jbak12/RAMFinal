
import Alamofire

class DataManager{
    //var ziomal = Character?
    func getPage<T: Codable & ApiModelProtocol>(_ page: Int, type: T.Type, completion: @escaping (Page<T>) -> Void) {
        let url = type.urlString + "?page=\(page)"
        
        print("Request start: " + url)
        AF.request(url).response(queue: .main) { response in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                return
            case .success(let data):
                if let data = data {
                    do {
                        let page = try JSONDecoder().decode(Page<T>.self, from: data)
                        completion(page)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        return
    }
}


