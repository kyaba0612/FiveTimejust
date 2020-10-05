//
//  SelectViewController.swift
//  FiveTimejust
//
//  Created by チップまん on 2020/10/04.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    //ユーザーデフォルトにアクセス
    let saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var stage1Label: UILabel!
    @IBOutlet var stage2Label: UILabel!
    @IBOutlet var stage3Label: UILabel!
    @IBOutlet var stage1Button: UIButton!
    @IBOutlet var stage2Button: UIButton!
    @IBOutlet var stage3Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starcount = saveData.object(forKey: "starcount")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func stageselect() {
        //星の数が一つ以上あれば遷移、なければアラート
        if starcount >= 1 {
           performSegue(withIdentifier: "toGameView", sender: nil)
        }else {
            let alert: UIAlertController = UIAlertController(title:"進めません",message:"前のステージをクリアしていません。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
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
