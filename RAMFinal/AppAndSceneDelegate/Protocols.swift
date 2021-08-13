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

protocol CharacterViewViewModelType: AnyObject {
    var output: CharacterViewControllerType? { get set }
    
    var name: String? { get }
    var imageUrl: URL? { get }
    var gender: String { get }
    var species: String { get }
    var episodeCounter: Int {get}
    var originLocationName: String {get}
    var status: String {get}
    func outputIsReadyForData()
}

protocol CharacterViewControllerType: AnyObject {
    init(viewModel: CharacterViewViewModelType)

    func reloadView()
}
