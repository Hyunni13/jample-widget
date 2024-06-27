//
//  MainViewController.swift
//  JampleWidget
//
//  Created by James on 6/9/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModel! {
        didSet { self.displayStepCounts() }
    }
    
    @IBOutlet weak var stepCountsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = MainViewModel()
    }
    
    @IBAction func displayStepCounts(_ sender: Any) {
        self.displayStepCounts()
    }
    
    /**
     오늘 걸음수 렌더링
     */
    private func displayStepCounts() {
        self.viewModel.queryStepCounts { stepCounts in
            DispatchQueue.main.async {
                self.stepCountsLabel.text = stepCounts
            }
        }
    }
    
}
