import Foundation
import Alamofire
import AlamofireImage
import UIKit
class CharactersTableViewModel: CharactersTableViewModelType {
    
    var tableOutput: CharactersTableViewController?
    var characters: [CDCharacter] = [] 
    func drawData() {
        do {
            if let characters = try AppDelegate.shared.persistentContainer.viewContext.fetch(CDCharacter.fetchRequest()) as? [CDCharacter] {
                self.characters = characters
            }
        } catch {
            self.tableOutput?.showError(mesasge: error.localizedDescription)
        }
    }
}
