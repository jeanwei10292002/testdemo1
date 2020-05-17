//
//  resultViewController.swift
//  testdemo1
//
//  Created by jeanwei on 2020/5/11.
//  Copyright © 2020 jeanwei. All rights reserved.
//

import UIKit
import WebKit

class resultViewController: UIViewController {
    
    let lifeNumberNames = ["", "開創", "協調", "創意", "務實", "自由", "關懷", "探究", "權威", "智慧"]
    
    @IBOutlet weak var webview: WKWebView!
    var birthday : Date! /*將birthdayviewcontroller切換到resultviewcontroller頁面時，將生日傳給resultviewcontroller，將resultviewcontroller的birthday設為使用者選擇的生日*/
    
  
    func calculateLifeNumber() -> Int {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yMd"
           let dateString = dateFormatter.string(from: birthday)
           return calculateLifeNumber2(dateString)
       }
    func calculateLifeNumber2(_ dateString: String) -> Int {
        var sum = 0
        for numberString in dateString {
            let number = Int(String(numberString))!
            sum = sum + number
          //  print(sum) ，例：19871029 sum = 0 ，sum = 0 + 1 =1 :sum = 1,sum = 1 + 9 =10 :sum=10 , sum = 10+8=18:sum=18 , sum=18+7=25 :sum=25 , sum=25+1=26:sum=26 , sum=26+0=26:sum=26 , sum=26+2=28:sum=28 , sum=28+9=37:sum=37 ，跳到if sum那行，37大於10，在執行一次func，sum=0+3=3:sum=3 , sum=3+7=10:sum=10 , 跳到if sum那行，10等於10，sum=0+1=1:sum=1,sum=1+0=1:sum=1 //
        }
        if sum >= 10 {
            sum = calculateLifeNumber2(sum.description)
            
        }
        return sum
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       let number = calculateLifeNumber() //最先跑的程式，進入func 把值存到number
               title = "\(number) \(lifeNumberNames[number])數" //標題
               
              if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).htm") {
                   let request = URLRequest(url: url)
                   webview.load(request) 
               }
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
