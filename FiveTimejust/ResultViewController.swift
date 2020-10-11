//
//  ResultViewController.swift
//  FiveTimejust
//
//  Created by チップまん on 2020/10/04.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var timer: Float = 0.0
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var starImage1: UIImageView!
    @IBOutlet var starImage2: UIImageView!
    @IBOutlet var starImage3: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //結果表示
        resultLabel.text = String(format: "%.2f",timer)
        //星表示
        if timer == 5.00 {
            starImage1.image = UIImage(named: "color_star.png")
            starImage2.image = UIImage(named: "color_star.png")
            starImage3.image = UIImage(named: "color_star.png")
        } else if  timer >= 4.75 && timer <= 5.25 {
            starImage1.image = UIImage(named: "color_star.png")
            starImage2.image = UIImage(named: "color_star.png")
            starImage3.image = UIImage(named: "outline_star.png")
        } else if  timer >= 4.50 && timer <= 5.50 {
            starImage1.image = UIImage(named: "color_star.png")
            starImage2.image = UIImage(named: "outline_star.png")
            starImage3.image = UIImage(named: "outline_star.png")
        } else {
            starImage1.image = UIImage(named: "outline_star.png")
            starImage2.image = UIImage(named: "outline_star.png")
            starImage3.image = UIImage(named: "outline_star.png")
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super .didReceiveMemoryWarning()
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)

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
