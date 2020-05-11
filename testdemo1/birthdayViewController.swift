//
//  birthdayViewController.swift
//  testdemo1
//
//  Created by jeanwei on 2020/5/11.
//  Copyright © 2020 jeanwei. All rights reserved.
//

import UIKit

class birthdayViewController: UIViewController {

    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBSegueAction func showresult(_ coder: NSCoder) ->
   resultViewController? {
        let controller = resultViewController(coder: coder)
        controller?.birthday = datepicker.date
        return controller
    }
    
    
    
    
    
    
    override func viewDidLoad() {
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
