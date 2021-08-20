import UIKit
class CharactersTableViewController : UIViewController, CharactersTableViewControllerType {
    var myTabView :  CharactersTableView!
    var viewModel: CharactersTableViewModelType
   
    required init(viewModel: CharactersTableViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.tableOutput = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let tbview = CharactersTableView(frame: UIScreen.main.bounds, style: .grouped)
        myTabView = tbview
        self.view = myTabView
        
        self.myTabView.tableView.dataSource = self
        self.myTabView.tableView.delegate = self
        
        self.myTabView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "kReuseIdentifier")
//        self.myTabView.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCellReuseIdentifier")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Characters Table View"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.viewModel.drawData()
    }
}

extension CharactersTableViewController {
    func reloadView() {
        self.myTabView.tableView.reloadData()
    }
    
    func showError(mesasge: String) {
        
    }
}

extension CharactersTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kReuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = self.viewModel.characters[indexPath.row].name
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .basicBackground
        }else{
            cell.backgroundColor = UIColor(red: 0.31, green: 0.488, blue: 0.497, alpha: 1)
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterToPreview = self.viewModel.characters[indexPath.row]
        let previewModel : CharacterPreviewModelType
        previewModel = CharacterPreviewModel(characterId: characterToPreview.id)
        let vc = CharacterPreviewController(viewModel: previewModel)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == tableVM.CharactersArray.count - 1 {
//            // load more
//        }
//    }
}
