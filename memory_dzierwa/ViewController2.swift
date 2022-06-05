//
//  ViewController2.swift
//  memory_dzierwa
//
//  Created by Maciej Dzierwa on 09/12/2021.
//

import UIKit

class ViewController2: UIViewController {
    var poziom:Int = 0
    
    var tab = ["img/Cabbage-icon-32.png","img/Carrot-icon-32.png","img/Cauliflower-icon-32.png","img/Chinese-Cabbage-icon-32.png","img/Corn-icon-32.png","img/Cucumber-icon-32.png","img/Eggplant-icon-32.png","img/Garlic-icon-32.png","img/Ginger-icon-32.png","img/Green-Onion-icon-32.png","img/Green-Pepper-icon-32.png","img/Japanese-Radish-icon-32.png","img/Leaf-Lettuce-icon-32.png","img/Lettuce-icon-32.png"]
    var tab2 = ["img/Eggplant-icon-32.png","img/Garlic-icon-32.png","img/Ginger-icon-32.png","img/Green-Onion-icon-32.png","img/Green-Pepper-icon-32.png","img/Japanese-Radish-icon-32.png"]
    var tab3: [UIButton] = []
    var tab4: [String] = []
    var punkty = 0
    var losowe:[Int] = [5]
    var j = 0
    @objc func jazda(sender:UIButton){
        var i = sender.tag
        
        
            
        
        print(i)
        var img = UIImage(named : tab[i])!
        if poziom == 1{
            img = UIImage(named : tab[i])!
        }else{
            img = UIImage(named : tab2[i])!
        }
        
        
        let img2 = UIImage(named : "img/none.jpg")!
        sender.setBackgroundImage(img, for: UIControl.State.normal)
        let a = String(tab[i])
        if tab3.count < 1{
            tab3.append(sender)
            tab4.append(a)
        }else {
            tab3.append(sender)
            tab4.append(a)
            //print(tab4[0])
            //print(tab4[1])
            if tab4[0] == tab4[1]{
                //print("para")
                tab3.removeAll()
                tab4.removeAll()
                punkty += 1
                if poziom == 1 && punkty == 14{
                       let defaultAction = UIAlertAction(title: "OK",
                                            style: .default) {
                        action in NSLog("No!!!!")
                        let controllers = self.navigationController?.viewControllers
                                      for vc in controllers! {
                                        if vc is ViewController {
                                          _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
                                        }
                                     }
                       }
                       
                       let alert = UIAlertController(title: "Wygrana!!",
                             message: "Powróć do strony głównej",
                             preferredStyle: .alert)
                       alert.addAction(defaultAction)
                                    
                       self.present(alert, animated: true) {

                       }
                    
                }else if poziom == 0 && punkty == 6{
                       let defaultAction = UIAlertAction(title: "OK",
                                            style: .default) { action in NSLog("No!!!!")
                        let controllers = self.navigationController?.viewControllers
                                      for vc in controllers! {
                                        if vc is ViewController {
                                          _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
                                        }
                                     }
                       }
                    
                       let alert = UIAlertController(title: "Wygrana!!",
                             message: "Powróć do strony głównej",
                             preferredStyle: .alert)
                       alert.addAction(defaultAction)
                       
                            
                       self.present(alert, animated: true) {

                       }
                    
                }
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.tab3[0].setBackgroundImage(img2, for: UIControl.State.normal)
                    self.tab3[1].setBackgroundImage(img2, for: UIControl.State.normal)
//                    view.isUserInteractionEnabled
                
                    self.tab3.removeAll()
                    self.tab4.removeAll()
                }
                
            }
            
        }
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        for view in view.subviews{
            view.removeFromSuperview()
        }
        viewDidLoad()
        }
    override func viewDidLoad() {
        tab.shuffle()
        tab2.shuffle()
        var k = 0
        for i in 0...100{
            let randomInt = Int.random(in: 0..<6)
            for i in 0...losowe.count{
                if(randomInt != Int(losowe[k]))
                {
                    losowe.append(randomInt);
                    k+=1;
                }
                
            }
            if losowe.count == 5 {
                break
            }
                
        }
        let screenSize: CGRect = UIScreen.main.bounds
        var he = screenSize.height
        var we = screenSize.width
        let bloczek = we / 8
        let bloczek2 = we / 5
        let const = bloczek / 8
        let const2 = bloczek2 / 5
        let h1 = (Int(he) - 4 * Int(bloczek) - 5 * Int(const)) / 2
        let h2 = (Int(he) - 3 * Int(bloczek2) - 4 * Int(const2)) / 2
        var licznik = 0
        print(poziom)
        if poziom == 1{
            for i in 0...6{
                for j in 0...3{
                    let button: UIButton = UIButton()
                    let img = UIImage(named : "img/none.jpg")!
                    
                    button.frame = CGRect(x: i * Int(bloczek) + Int(const) * i + Int(const), y: j * Int(bloczek) + Int(const) * j + Int(const) + Int(h1), width:Int(bloczek), height: Int(bloczek))
                    
                    button.tag = licznik//mozna dodac liczbowy tag
                    button.setBackgroundImage(img, for: UIControl.State.normal)
                    button.addTarget(self, action: #selector(jazda), for: UIControl.Event.touchUpInside)
                    self.view.addSubview(button)
                    if licznik == 13{
                        licznik = 0
                    }else{
                        licznik += 1
                    }
                }
            }
        }else{
            for i in 0...3{
                for j in 0...2{
                    let button : UIButton = UIButton()
                    let img = UIImage(named : "img/none.jpg")!
                    button.frame = CGRect(x: i * Int(bloczek2) + Int(const2) * i + Int(const2), y: j * Int(bloczek2) + Int(const2) * j + Int(const2) + Int(h2), width: Int(bloczek2), height: Int(bloczek2))
                    button.tag = licznik//mozna dodac liczbowy tag
                    button.setBackgroundImage(img, for: UIControl.State.normal) // dodanie tła
                    button.addTarget(self, action: #selector(jazda), for: UIControl.Event.touchUpInside)
                    self.view.addSubview(button)
                    if licznik == 5{
                        licznik = 0
                    }else{
                        licznik += 1
                    }
                }
            }
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
