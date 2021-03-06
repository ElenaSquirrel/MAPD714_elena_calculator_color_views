
//  SwitchingViewController.swift
//  MAPD714_ElenaMelnikova_optionsScreen

//  Basic Calculator with Options Screen version 1.1
//  Program description:  Basic Calculator with Options Screen allows users to change background color and text color for the calculator. Pressing on the "Switch" toolbar on the top of the main screen changes Basic Calculator Screen on Options Screen that contains two dropdown menus that have color options for calculator background color and text color. After choosing colors users press "Switch" toolbar one more time and move to the Basic Calculator Screen.
//  Created by Elena Melnikova on 2018-10-11.
//  Student ID: 301025880
//  Last modification date: 2018-10-21

//  Version history:
//  Calculator with Tab Bar Controller version 1.2
//  Scientific Calculator and Options Screens added. Options Screen allows users to pick and change background color and text color for both Basic and Scientific Calculators.
//  Basic Calculator with Options Screen version 1.1
//  Options Screens were added.
//  Basic Calculator version 1.0
//  Basic Calculator and Splash Screen created.

//  Copyright © 2018 Centennial College. All rights reserved.

import UIKit

class SwitchingViewController: UIViewController {
    private var calculatorViewController: CalculatorViewController!
    private var optionsViewController: OptionsViewController!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatorViewController = storyboard?.instantiateViewController(withIdentifier: "Calculator") as! CalculatorViewController
        calculatorViewController.view.frame = view.frame
        switchViewController(from: nil, to: calculatorViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchViews(sender: UIBarButtonItem) {
        // Create the new view controller, if required
        if optionsViewController?.view.superview == nil {
            if optionsViewController == nil {
                optionsViewController =
                    storyboard?.instantiateViewController(withIdentifier: "Options")
                    as! OptionsViewController
            }
        } else if calculatorViewController?.view.superview == nil {
            if calculatorViewController == nil {
                calculatorViewController =
                    storyboard?.instantiateViewController(withIdentifier: "Calculator")
                    as! CalculatorViewController
            }
        }
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        // Switch view controllers
        if calculatorViewController != nil
            && calculatorViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight,
                               for: view, cache: true)
            optionsViewController.view.frame = view.frame
            switchViewController(from: calculatorViewController,
                to: optionsViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft,
                                          for: view, cache: true)
            calculatorViewController.view.frame = view.frame
            switchViewController(from: optionsViewController,
                                 to: calculatorViewController)
        }
        UIView.commitAnimations()
    }

    private func switchViewController(from fromVC:UIViewController?,
                     to toVC:UIViewController?) {
        var textColor = UIColor.white
        var backgroungColor = UIColor.darkGray
        var tColor = "White"
        var bkColor = "Dark Gray"
 
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()

            if optionsViewController.menuOutlet.titleLabel != nil {
                if optionsViewController.menuOutlet.titleLabel!.text != nil {
                    tColor = optionsViewController.menuOutlet.titleLabel!.text!
                    switch tColor {
                    case "Yellow":
                        textColor = UIColor.yellow
                        break
                    case "Green":
                        textColor = UIColor.green
                        break
                    default:
                        textColor = UIColor.white
                    }
                }
            }
  
            if optionsViewController.menuOutlet2.titleLabel != nil {
                if optionsViewController.menuOutlet2.titleLabel!.text != nil {
                    bkColor = optionsViewController.menuOutlet2.titleLabel!.text!
                    switch bkColor {
                    case "Red":
                        backgroungColor = UIColor.red
                        break
                    case "Blue":
                        backgroungColor = UIColor.blue
                        break
                    default:
                        backgroungColor = UIColor.darkGray
                    }
                }
            }
        }
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
       
            let buttons = getSubviewsOfView(v: calculatorViewController.view)
            for btn in buttons {
                btn.setTitleColor(textColor, for: .normal)
                if btn.titleLabel?.text != "C" && btn.titleLabel?.text != "=" {
                    btn.backgroundColor = backgroungColor
                }
            }
        }
    }

    func getSubviewsOfView(v:UIView) -> [UIButton] {
        var buttonArray = [UIButton]()
        for subview in v.subviews {
            buttonArray += getSubviewsOfView(v: subview)
            if subview is UIButton {
                buttonArray.append(subview as! UIButton)
            }
        }
        return buttonArray
    }
}
