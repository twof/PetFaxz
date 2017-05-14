//
//  AgeViewController.swift
//  
//
//  Created by fnord on 5/14/17.
//
//

import UIKit

class AgeViewController: UIViewController {
    var dog: Dog?

    @IBOutlet weak var ageStepper: UIStepper!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChange(_ sender: Any) {
        self.ageLabel.text = String(self.ageStepper.value)
        self.dog?.age = Int(self.ageStepper.value)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PronounsViewController
        vc.dog = self.dog
    }
}
