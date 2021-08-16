import UIKit
class CharactersTableViewController : UIViewController {
    var myTabView :  CharactersTableView!
    var CharactersArray : [Character] = []
   
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
    }
}

extension CharactersTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //CharactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kReuseIdentifier", for: indexPath)
        
        cell.textLabel!.text = "test \(indexPath.row)"//CharactersArray[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == CharactersArray.count - 1 {
            // load more
        }
    }
}
