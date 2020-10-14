//
//  SelectViewController.swift
//  FiveTimejust
//
//  Created by チップまん on 2020/10/04.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet var starImage1_1: UIImageView!
    @IBOutlet var starImage1_2: UIImageView!
    @IBOutlet var starImage1_3: UIImageView!
    
    @IBOutlet var starImage2_1: UIImageView!
    @IBOutlet var starImage2_2: UIImageView!
    @IBOutlet var starImage2_3: UIImageView!
    
    @IBOutlet var starImage3_1: UIImageView!
    @IBOutlet var starImage3_2: UIImageView!
    @IBOutlet var starImage3_3: UIImageView!
    
    @IBOutlet var starImage4_1: UIImageView!
    @IBOutlet var starImage4_2: UIImageView!
    @IBOutlet var starImage4_3: UIImageView!
    
    @IBOutlet var starImage5_1: UIImageView!
    @IBOutlet var starImage5_2: UIImageView!
    @IBOutlet var starImage5_3: UIImageView!
    
    @IBOutlet var starImage6_1: UIImageView!
    @IBOutlet var starImage6_2: UIImageView!
    @IBOutlet var starImage6_3: UIImageView!
    
    @IBOutlet var starImage7_1: UIImageView!
    @IBOutlet var starImage7_2: UIImageView!
    @IBOutlet var starImage7_3: UIImageView!
    
    @IBOutlet var starImage8_1: UIImageView!
    @IBOutlet var starImage8_2: UIImageView!
    @IBOutlet var starImage8_3: UIImageView!
    
    @IBOutlet var starImage9_1: UIImageView!
    @IBOutlet var starImage9_2: UIImageView!
    @IBOutlet var starImage9_3: UIImageView!
    
    //ユーザーデフォルトにアクセス
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let starcount01 = saveData.integer(forKey: "starcount01")
        let starcount02 = saveData.integer(forKey: "starcount02")
        let starcount03 = saveData.integer(forKey: "starcount03")
        
        if starcount01 >= 3 {
            starImage1_1.image = UIImage(named: "color_star_mini.png")
            starImage1_2.image = UIImage(named: "color_star_mini.png")
            starImage1_3.image = UIImage(named: "color_star_mini.png")
        } else if  starcount01 >= 2 {
            starImage1_1.image = UIImage(named: "color_star_mini.png")
            starImage1_2.image = UIImage(named: "color_star_mini.png")
            starImage1_3.image = UIImage(named: "outline_star_mini.png")
        } else if  starcount01 >= 1 {
            starImage1_1.image = UIImage(named: "color_star_mini.png")
            starImage1_2.image = UIImage(named: "outline_star_mini.png")
            starImage1_3.image = UIImage(named: "outline_star_mini.png")
        } else if  starcount01 == 0 {
            starImage1_1.image = UIImage(named: "outline_star_mini.png")
            starImage1_2.image = UIImage(named: "outline_star_mini.png")
            starImage1_3.image = UIImage(named: "outline_star_mini.png")
        }
        
        if starcount02 >= 3 {
            starImage2_1.image = UIImage(named: "color_star_mini.png")
            starImage2_2.image = UIImage(named: "color_star_mini.png")
            starImage2_3.image = UIImage(named: "color_star_mini.png")
        } else if  starcount02 >= 2 {
            starImage2_1.image = UIImage(named: "color_star_mini.png")
            starImage2_2.image = UIImage(named: "color_star_mini.png")
            starImage2_3.image = UIImage(named: "outline_star_mini.png")
        } else if  starcount02 >= 1 {
            starImage2_1.image = UIImage(named: "color_star_mini.png")
            starImage2_2.image = UIImage(named: "outline_star_mini.png")
            starImage2_3.image = UIImage(named: "outline_star_mini.png")
        } else if  starcount02 == 0 {
            starImage2_1.image = UIImage(named: "outline_star_mini.png")
            starImage2_2.image = UIImage(named: "outline_star_mini.png")
            starImage2_3.image = UIImage(named: "outline_star_mini.png")
        }
        
        if starcount03 >= 3 {
            starImage3_1.image = UIImage(named: "color_star_mini.png")
            starImage3_2.image = UIImage(named: "color_star_mini.png")
            starImage3_3.image = UIImage(named: "color_star_mini.png")
        } else if  starcount03 >= 2 {
            starImage3_1.image = UIImage(named: "color_star_mini.png")
            starImage3_2.image = UIImage(named: "color_star_mini.png")
            starImage3_3.image = UIImage(named: "outline_star_mini.png")
        } else if  starcount03 >= 1 {
            starImage3_1.image = UIImage(named: "color_star_mini.png")
            starImage3_2.image = UIImage(named: "outline_star_mini.png")
            starImage3_3.image = UIImage(named: "outline_star_mini.png")
        } else if  starcount03 == 0 {
            starImage3_1.image = UIImage(named: "outline_star_mini.png")
            starImage3_2.image = UIImage(named: "outline_star_mini.png")
            starImage3_3.image = UIImage(named: "outline_star_mini.png")
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func stageselect01(){
           performSegue(withIdentifier: "toGameView01", sender: nil)
    }
    
    @IBAction func stageselect02(){
        let starcount01 = saveData.integer(forKey: "starcount01")
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
        let starcount02 = saveData.integer(forKey: "starcount02")
        //星の数が一つ以上あれば遷移、なければアラート
        if starcount02 >= 1 {
           performSegue(withIdentifier: "toGameView03", sender: nil)
        }else {
            let alert: UIAlertController = UIAlertController(title:"進めません",message:"前のステージをクリアしていません。",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        }
    }
    
    @IBAction func stageselect04(){
        
            let alert: UIAlertController = UIAlertController(title:"ごめんね",message:"次のアップデートに期待",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        
    }
    
    @IBAction func stageselect05(){

            let alert: UIAlertController = UIAlertController(title:"ごめんね",message:"次のアップデートに期待",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        
    }
    
    @IBAction func stageselect06(){

            let alert: UIAlertController = UIAlertController(title:"ごめんね",message:"次のアップデートに期待",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        
    }
    
    @IBAction func stageselect07(){

            let alert: UIAlertController = UIAlertController(title:"ごめんね",message:"次のアップデートに期待",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        
    }
    
    @IBAction func stageselect08(){
       
            let alert: UIAlertController = UIAlertController(title:"ごめんね",message:"次のアップデートに期待",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        
    }
    
    @IBAction func stageselect09(){
        
            let alert: UIAlertController = UIAlertController(title:"ごめんね",message:"次のアップデートに期待",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert,animated: true, completion: nil)
        
    }
    
    @IBAction func deleteDataFromUserDefaults() {
        
       let alert = UIAlertController(title: "警告", message: "クリアしたデータを削除します。", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            // キーの値を削除
            UserDefaults.standard.removeObject(forKey: "starcount01")
                  
            UserDefaults.standard.removeObject(forKey: "starcount02")
                  
            UserDefaults.standard.removeObject(forKey: "starcount03")
            self.dismiss(animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
    
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancel)

        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
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
