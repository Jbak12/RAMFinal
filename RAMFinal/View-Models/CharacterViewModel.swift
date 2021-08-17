import UIKit
import Alamofire
import PromiseKit

class CharacterViewModel: CharacterViewModelType {   
    weak var output: CharacterViewControllerType?
    
    private var odcinek: Episode? {
        didSet{
            self.output?.reloadView()
        }
    }
    
    private var randCharater : Character? {
        didSet {
            self.output?.reloadView()
        }
    }
    
    
    var name: String?{
        return randCharater?.name
    }

    var imageUrl: URL? {
        if let urlString = randCharater?.image {
            return URL(string: urlString)
        }
        return nil
    }
    
    var gender: String {
        if let gender = randCharater?.gender{
            return gender
        }else{
            return "no gender "
        }
        
    }
    var species: String {
        if let species = randCharater?.species{
            return species
        }else{
            return "no species"
        }
    }
    var episodeCounter: Int{
        if let episodecount = randCharater?.episode.count{
            return episodecount
        }else{
            return 1234
        }
    }
    var originLocationName: String{
        if let originlocation = randCharater?.origin.name{
            return originlocation
        }else{
            return "ebebebe"
        }
    }
    var status : String{
        if let status = randCharater?.status{
            return status.rawValue
        }else{
           return "dfgsgdffsdgd"
        }
    }
    
    var firstEpisode: String{
        if let numerOdcinka = odcinek?.episode{
            return numerOdcinka
        }else{
            return "jezu nie wiem co rovic"
        }
    }
    var firstEpisodeName: String{
        if let odcinkaimie = odcinek?.name{
            return odcinkaimie
        }else{
            return"AAAAAAAA"
        }
    }
    
    
    var dataManager = DataManager()
    
//    private func fetchData() {
//        dataManager.getPage(1, type: Character.self){ page in
//            let randomPageNo = Int.random(in: 1...page.info.pages)
//            self.dataManager.getPage(randomPageNo, type: Character.self) { randomPage in
//                let randomCharacterNo = Int.random(in: 1..<randomPage.results.count)
//                let randomCharacter = randomPage.results[randomCharacterNo]
//                self.ziomal = randomCharacter
//            }
//        }
//    }
//    private func fetchEpisodeName(episodeUrl: String) {
//        dataManager.getEpisode(episodeUrl: episodeUrl) { retEpisode in
//            self.odcinek = retEpisode
//        }
//    }
    //unc fetchzioal
    
    func drawData() {
        self.output?.setLoading(isLoading: true)
        
        firstly {
            dataManager.getPage(1, type: Character.self)
        }.then { firstPage -> Promise<Page<Character>> in
            let randomPageNumber = Int.random(in: 1...firstPage.info.pages)
            print(randomPageNumber)
            return self.dataManager.getPage(randomPageNumber, type: Character.self)
        }.then { nextRandomPage -> Promise<Episode> in
            let randomCharacterNo = Int.random(in: 0..<nextRandomPage.results.count)
            let randomCharacter = nextRandomPage.results[randomCharacterNo]
            self.randCharater = randomCharacter
            print(randomCharacterNo)
            return self.dataManager.getEpisode(episodeUrl: self.randCharater!.episode[0])
        }.ensure {
             self.output?.setLoading(isLoading: false)
        }.done { episode in
            return self.odcinek = episode
        }.catch { error in
             self.output?.showError(mesasge: error.localizedDescription)
        }
    }
    
    func saveData(image: UIImage?) {
        if let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let CharacterToSave = CDCharacter(context: myContext)
            CharacterToSave.name = self.name
            CharacterToSave.gender = self.gender
            CharacterToSave.species = self.species
            CharacterToSave.episodesCount = Int16(self.episodeCounter)
            CharacterToSave.originLocation = self.originLocationName
            CharacterToSave.status = self.status
            CharacterToSave.firstEpisode = self.firstEpisode
            if let data = image?.pngData() {
                CharacterToSave.characterImage = data
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            if let CDCharacters =  try? myContext.fetch(CDCharacter.fetchRequest()) as? [CDCharacter]{
                print(CDCharacters.count)
            }
        }
        
    }
        
        
//
//        fetchData()
//        fetchEpisodeName(episodeUrl: self.ziomal?.episode[0] ?? "https://rickandmortyapi.com/api/episode/1")
//    }
}
