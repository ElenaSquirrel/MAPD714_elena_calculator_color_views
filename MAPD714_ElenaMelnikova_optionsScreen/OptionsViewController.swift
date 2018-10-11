//
//  OptionsViewController.swift
//  MAPD714_ElenaMelnikova_optionsScreen
//
//  Created by Elena Melnikova on 2018-10-11.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    //Outlet
    @IBOutlet weak var menuOutlet: UIButton!
    @IBOutlet var menuItemsOutlets: [UIButton]!

    @IBOutlet weak var menuOutlet2: UIButton!

    @IBOutlet var menuItemsOutlets2: [UIButton]!
    
    //Actions
    @IBAction func menuAction(_ sender: UIButton) {
        menuItemsOutlets.forEach {
            (button) in UIView.animate(withDuration: 0.5, animations:{
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBAction func menuItemsActions(_ sender: UIButton) {
        menuOutlet.titleLabel?.text = sender.titleLabel?.text
    }
    
    @IBAction func menuItemsActions2(_ sender: UIButton) {
        menuOutlet2.titleLabel?.text = sender.titleLabel?.text
    }
    
    @IBAction func menuAction2(_ sender: UIButton) {
        menuItemsOutlets2.forEach {
            (button) in UIView.animate(withDuration: 0.5, animations:{
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
