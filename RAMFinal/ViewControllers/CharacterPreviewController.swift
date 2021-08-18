//
//  CharacterPreviewController.swift
//  RAMFinal
//
//  Created by admin on 18/08/2021.
//

import UIKit

class CharacterPreviewController: UIViewController {
    
    var previewView: CharacterView!
    
    override func loadView() {
        self.previewView = CharacterView(frame: UIScreen.main.bounds)
        self.view = self.previewView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.previewView.setButtonsHidden(true)
    }
    
}
