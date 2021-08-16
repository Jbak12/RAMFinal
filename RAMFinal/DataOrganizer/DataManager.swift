import Alamofire
import PromiseKit

class DataManager{
    //var ziomal = Character?
    func getPage<T: Codable & ApiModelProtocol>(_ pageNumber: Int, type: T.Type) -> Promise<Page<T>> {
        return Promise<Page<T>>() { seal in
            let url = type.urlString + "?page=\(pageNumber)"
            
            print("Request start: " + url)
            AF.request(url).response(queue: .main) { response in
                switch response.result {
                case .failure(let error):
                    seal.reject(error)
                case .success(let data):
                    if let data = data {
                        do {
                            let page = try JSONDecoder().decode(Page<T>.self, from: data)
                            seal.fulfill(page)
                        } catch {
                            seal.reject(error)
                        }
                    }
                }
            }
        }
    }
    
    func getEpisode(episodeUrl: String) -> Promise<Episode> {
        return Promise<Episode>() { seal in
            AF.request(episodeUrl).response(queue: .main){ response in
                switch response.result {
                case .failure(let error):
                    seal.reject(error)
                case .success(let data):
                    if let data = data {
                        do {
                            let odcinek = try JSONDecoder().decode(Episode.self, from: data)
                            seal.fulfill(odcinek)
                        } catch {
                            seal.reject(error)
                        }
                    }
                }
            }
        }
    }
}


