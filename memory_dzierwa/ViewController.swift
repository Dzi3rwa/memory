//
//  ViewController.swift
//  memory_dzierwa
//
//  Created by Maciej Dzierwa on 09/12/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    var a = 0
    @IBAction func segmentneeded(_ sender: Any) {
            }
    @IBAction func zmianawartosci(_ sender: Any) {
        a = SegmentControl.selectedSegmentIndex
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ViewController2
        dest.poziom = a
        print(a)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

