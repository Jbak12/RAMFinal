import UIKit

/// PROTOKÓŁ WSPOMAGAJĄCY TWORZENIE LINKÓW
protocol ApiModelProtocol {
    static var urlString: String { get }
}
//
//protocol RandomViewProtocol {
//    init(frame: CGRect, theme: Theme)
//    var onButtonPress: (() -> Void)? { get set }
//}


// MARK: - Character
//Users/admin/Desktop/RAMFinal/RAMFinal/ViewControllers/CharacterViewController.swift:            self?.viewModel.drawData()
protocol CharacterViewModelType: AnyObject {
    var output: CharacterViewControllerType? { get set }
    var name: String? { get }
    var imageUrl: URL? { get }
    var gender: String { get }
    var species: String { get }
    var episodeCounter: Int {get}
    var originLocationName: String {get}
    var status: String {get}
    var firstEpisode: String {get}
    var tableViewModel: CharactersTableViewModelType {get}
    func drawData()
    func saveData(image: UIImage?)
    func check() -> Bool
}

protocol CharacterPreviewModelType: AnyObject {
    var output: CharacterPreviewController! {get set}
    init(characterId: Int16)
    var name: String? { get }
    var image: UIImage? { get }
    var gender: String { get }
    var species: String { get }
    var episodeCounter: Int {get}
    var originLocationName: String {get}
    var status: String {get}
    var firstEpisode: String {get}
    
}

protocol CharactersTableViewModelType: AnyObject {
    var tableOutput: CharactersTableViewController? {get set}
    var characters: [CDCharacter] {get set}

    func drawData()
}

protocol CharacterViewControllerType: AnyObject {
    init(viewModel: CharacterViewModelType)

    func reloadView()
    func setLoading(isLoading: Bool)
    func showError(mesasge: String)
    func disableSaveButton()
    func enableSaveButton()
}

protocol CharactersTableViewControllerType: AnyObject {
    var viewModel: CharactersTableViewModelType { get }
    init(viewModel: CharactersTableViewModelType)

    func reloadView()
    func showError(mesasge: String)
}

protocol ViewBackend {
    func initiateSave()
}
