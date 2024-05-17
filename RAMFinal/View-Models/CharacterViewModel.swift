import UIKit
import Alamofire
import PromiseKit

class CharacterViewModel: CharacterViewModelType {
    
    var comesFromCollection: Bool
    
    required init(fixedCharacter: Character?, comesFromCollection: Bool) {
        randCharater = fixedCharacter
        self.comesFromCollection = comesFromCollection
    }
    
        
    weak var output: CharacterViewControllerType?
    
    private var odcinek: Episode? {
        didSet{
            if self.check() {
                self.output?.disableSaveButton()
            }else{
                self.output?.enableSaveButton()
            }
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
    var id: Int {
        if let id = randCharater?.id {
            return id
        }else{
            return 123
        }
    }
    
    var gender: String {
        if let gender = randCharater?.gender {
            return gender
        } else {
            return "no gender "
        }
        
    }
    var species: String {
        if let species = randCharater?.species{
            return species
        } else {
            return "no species"
        }
    }
    var episodeCounter: Int{
        if let episodecount = randCharater?.episode.count{
            return episodecount
        } else {
            return 123
        }
    }
    var originLocationName: String{
        if let originlocation = randCharater?.origin.name{
            return originlocation
        } else {
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
            return "whatever"
        }
    }
    var firstEpisodeName: String{
        if let odcinkaimie = odcinek?.name{
            return odcinkaimie
        }else{
            return" "
        }
    }
    
    
    var dataManager = DataManager()
    
    var tableViewModel: CharactersTableViewModelType {
        return CharactersTableViewModel()
    }
    
    func didLoadView() {
        if randCharater == nil {
            drawData()
        }
    }

    
    func drawData() {
        self.output?.setLoading(isLoading: true)
        
        firstly {
            dataManager.getPage(1, type: Character.self)
        }.then { firstPage -> Promise<Page<Character>> in
            let randomPageNumber = Int.random(in: 1...firstPage.info.pages)
            return self.dataManager.getPage(randomPageNumber, type: Character.self)
        }.then { nextRandomPage -> Promise<Episode> in
            let randomCharacterNo = Int.random(in: 0..<nextRandomPage.results.count)
            let randomCharacter = nextRandomPage.results[randomCharacterNo]
            self.randCharater = randomCharacter
            return self.dataManager.getEpisode(episodeUrl: self.randCharater!.episode[0])
        }.ensure {
             self.output?.setLoading(isLoading: false)
        }.done { episode in
            return self.odcinek = episode
        }.catch { error in
             self.output?.showError(mesasge: error.localizedDescription)
        }
    }
    
    func check() -> Bool {
        do {
            let characters = try AppDelegate.shared.persistentContainer.viewContext.fetch(CDCharacter.fetchRequest()) as? [CDCharacter]
            guard let charactersUnwrapped = characters else { return false }
            let tab = charactersUnwrapped.filter{ $0.id == self.id }
            if tab.count >= 1 && charactersUnwrapped.count != 0 {
                print(tab.count)
                print(charactersUnwrapped.count)
                print("cokolwiek")
                return true
            } else {
                return false
            }
        } catch {
            self.output?.showError(mesasge: error.localizedDescription)
            return false
        }
    }
    
    func saveData(image: UIImage?) {
        guard let character = self.randCharater else { return }
        
        let characterToSave = CDCharacter(context: AppDelegate.persistentContainer.viewContext)
        characterToSave.id = Int16(character.id)
        characterToSave.name = self.name
        characterToSave.gender = self.gender
        characterToSave.species = self.species
        characterToSave.episodesCount = Int16(self.episodeCounter)
        characterToSave.originLocation = self.originLocationName
        characterToSave.status = self.status
        characterToSave.firstEpisode = self.firstEpisode
        
        if let data = image?.pngData() {
            characterToSave.characterImage = data
        }
        
        AppDelegate.shared.saveContext()
    }
}
