import UIKit
import Alamofire
class CharacterViewModel: CharacterViewViewModelType {
    
    weak var output: CharacterViewControllerType?
    
    private var Odcinek: Episode?{
        didSet{
            self.output?.reloadView()
        }
    }
    
    private var ziomal : Character? {
        didSet {
            self.output?.reloadView()
        }
    }
    
    
    var name: String?{
        return ziomal?.name
    }

    var imageUrl: URL? {
        if let urlString = ziomal?.image {
            return URL(string: urlString)
        }
        return nil
    }
    
    var gender: String {
        if let gender = ziomal?.gender{
            return gender
        }else{
            return "no gender "
        }
        
    }
    var species: String {
        if let species = ziomal?.species{
            return species
        }else{
            return "no species"
        }
    }
    var episodeCounter: Int{
        if let episodecount = ziomal?.episode.count{
            return episodecount
        }else{
            return 2137
        }
    }
    var originLocationName: String{
        if let originlocation = ziomal?.origin.name{
            return originlocation
        }else{
            return "ebebebe"
        }
    }
    var status : String{
        if let status = ziomal?.status{
            return status.rawValue
        }else{
           return "dfgsgdffsdgd"
        }
    }
    
    var firstEpisode: String{
        if let numerOdcinka = Odcinek?.episode{
            return numerOdcinka
        }else{
            return "jezu nie wiem co rovic"
        }
    }
    var firstEpisodeName: String{
        if let odcinkaimie = Odcinek?.name{
            return odcinkaimie
        }else{
            return"AAAAAAAA"
        }
    }
    
    
    var dataManager = DataManager()
    
    private func fetchData() {
        dataManager.getPage(1, type: Character.self){ page in
            let randomPageNo = Int.random(in: 1...page.info.pages)
            self.dataManager.getPage(randomPageNo, type: Character.self) { randomPage in
                let randomCharacterNo = Int.random(in: 1..<randomPage.results.count)
                let randomCharacter = randomPage.results[randomCharacterNo]
                self.ziomal = randomCharacter
            }
        }
    }
    private func fetchEpisodeName(episodeUrl: String){
        AF.request(episodeUrl).response(queue: .main){ response in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                return
            case .success(let data):
                if let data = data {
                    do {
                        let odcinek = try JSONDecoder().decode(Episode.self, from: data)
                        self.Odcinek = odcinek
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            
        }
    }
    //unc fetchzioal
    func outputIsReadyForData() {
        fetchData()
        self.output?.reloadView()
    }
}
