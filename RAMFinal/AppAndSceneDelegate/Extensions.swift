import UIKit
import Foundation

extension UIColor{
    static var basicBackground =  UIColor(red: 43/255, green: 77/255, blue: 70/255, alpha: 0.7)
    static var labelBackground = UIColor(red: 30.6/255, green: 53.7/255, blue: 48.8/255, alpha: 0.1)
}
extension UILabel{
    func changeFormat(){
        self.text = self.text?.uppercased()
    }
    func gender( _ Gemder: String) {
        self.text = "Gender: " + Gemder
    }
    func species(species: String) {
        self.text = "Species: " + species
    }
    func episodes(episodes: Int) {
        if episodes > 1 {
            self.text = "Appears in \(episodes) episodes"
        }else {
            self.text =  "Appears in only \(episodes) episode"
        }
    }
    func originLocation(locationName: String, gender: String) {
        if locationName == "unknown" {
            if gender == "Male" {
                self.text = "No one knows where he comes from"
            }else if gender == "Female" {
                self.text = "No one knows where she comes from"
            }else{
                self.text = "No one knows where it comes from"
            }
        }else {
            self.text = "Comes from \(locationName)"
        }
    }
    
    func liveStatus(status: String) {
        if status == "unknown" {
            self.text = "No one knows whether this character is alive or dead"
        }else {
            self.text = "This character is \(status) "
        }
    }
}


