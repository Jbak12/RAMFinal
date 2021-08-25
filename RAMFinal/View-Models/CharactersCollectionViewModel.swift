//
//  CharactersCollectionViewModel.swift
//  RAMFinal
//
//  Created by admin on 24/08/2021.
//

import Foundation
import Alamofire

class CharactersCollectionViewModel: CharactersCollectionViewModelType {

    internal var characters: [Character] = []
    
    var output: CharactersCollectionOutputType?
    
    var isBusyFetchingData: Bool = false
    
    var numberOfItems: Int { characters.count }
    
    var dataManager = DataManager()
    
    var nextPage: Int? = 1
    
    func characterImageUrl(atIndex: Int) -> URL {
        return URL(string: "")!
    }
    
    func characterName(atIndex: Int) -> String {
        return characters[atIndex].name
    }
    
    func characterViewModel(atIndex: Int) -> CharacterViewModelType? {
        guard characters.count > atIndex else { return nil }
        return CharacterViewModel(fixedCharacter: characters[atIndex])
    }
    func viewIsLoaded() {
        loadMoreData()
    }
    
    func loadMoreData() {
        guard let nextPage = self.nextPage else {return}
        isBusyFetchingData = true
        dataManager.getPage(nextPage, type: Character.self)
            .ensure {
                self.isBusyFetchingData = false
            }.done { page in
            self.characters.append(contentsOf: page.results)
            self.output?.didLoadNextPage()
            
            if page.info.next != nil {
                self.nextPage = nextPage + 1
            } else {
                self.nextPage = nil
            }
        }
    }
}

//AF.request("https://rickandmortyapi.com/api/character?page=\(pageNo)").response(queue: .main) { response in
//    switch response.result {
//    case .failure(let error):
//        print(error.errorDescription!)
//    case .success(let data):
//        if let data = data {
//            do {
//                let page = try JSONDecoder().decode(Page<Character>.self, from: data)
//                self.characters.append(contentsOf: page.results)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
