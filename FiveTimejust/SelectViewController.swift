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
    var saveData: UserDefaults = UserDefaults.standard
    
    var starcount01:Int = 0
    var starcount02:Int = 0
    var starcount03:Int = 0
    
    @IBOutlet var stage1Label: UILabel!
    @IBOutlet var stage2Label: UILabel!
    @IBOutlet var stage3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starcount01 = UserDefaults.standard.integer(forKey: "starcount01")
        starcount02 = saveData.integer(forKey: "starcount02")
        starcount03 = saveData.integer(forKey: "starcount03")

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stageselect01(){
           performSegue(withIdentifier: "toGameView01", sender: nil)
    }
    
    @IBAction func stageselect02(){
        //星の数が一つ以上あれば遷移、なければアラート
        if starcount01 >= 1 {
           performSegue(withIdentifier: "toGameView02", sender: nil)
        }else {
            let alert: UIAlertController = UIAlertController(title:"進めません",message:"前のステージをクリアしていません。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        }
    }
    
    @IBAction func stageselect03(){
        //星の数が一つ以上あれば遷移、なければアラート
        if starcount02 >= 1 {
           performSegue(withIdentifier: "toGameView", sender: nil)
        }else {
            let alert: UIAlertController = UIAlertController(title:"進めません",message:"前のステージをクリアしていません。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        }
    }
    
    @IBAction func deleteDataFromUserDefaults() {
        //削除処理
        UserDefaults.standard.removeObject(forKey: "starcount01")
        UserDefaults.standard.removeObject(forKey: "starcount02")
        UserDefaults.standard.removeObject(forKey: "starcount03")
     
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
