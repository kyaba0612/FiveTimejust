//
//  SelectViewController.swift
//  FiveTimejust
//
//  Created by チップまん on 2020/10/04.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    var inputField: Int!
    
    //ユーザーデフォルトにアクセス
    let saveData: UserDefaults = UserDefaults.standard
    
    var starcount = 0
    
    @IBOutlet var stage1Label: UILabel!
    @IBOutlet var stage2Label: UILabel!
    @IBOutlet var stage3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starcount = saveData.integer(forKey: "starcount")

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "toGameView" {
            // 2. 遷移先のViewControllerを取得
            let next = segue.destination as? GameViewController01
            // 3. １で用意した遷移先の変数に値を渡す
            next?.outputValue = self.inputField
        }
    }
    
    @IBAction func stageselect01(){

           performSegue(withIdentifier: "toGameView", sender: nil)
           inputField = 1;
    }
    
    @IBAction func stageselect02(){
        //星の数が一つ以上あれば遷移、なければアラート
        if starcount >= 1 {
           performSegue(withIdentifier: "toGameView", sender: nil)
        }else {
            let alert: UIAlertController = UIAlertController(title:"進めません",message:"前のステージをクリアしていません。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
            inputField = 2;
        }
    }
    
    @IBAction func stageselect03(){
        //星の数が一つ以上あれば遷移、なければアラート
        if starcount >= 1 {
           performSegue(withIdentifier: "toGameView", sender: nil)
        }else {
            let alert: UIAlertController = UIAlertController(title:"進めません",message:"前のステージをクリアしていません。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
            inputField = 3;
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
