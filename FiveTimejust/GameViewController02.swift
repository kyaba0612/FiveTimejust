//
//  GameViewController01.swift
//  FiveTimejust
//
//  Created by チップまん on 2020/10/04.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class GameViewController02: UIViewController {
    
    //ユーザーデフォルトにアクセス
    let saveData = UserDefaults.standard
   
    //星の数
    var star02: Int = 0
    
    var quizArray = [Any]()
    
    //問題文
    @IBOutlet var quizTextView: UITextView!
    
    //問題画像
    @IBOutlet var imageLabel: UIImageView!
    
    //選択肢ボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    //タイマー
    var timer: Timer = Timer()
    var count: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["R:255,G:0,,B:0はどれ？","①","②","③",1,1])
        quizArray.append(["R:241,G:0,B:141,はどれ？","①","②","③",2,3])
        quizArray.append(["R:61,G:61,B:61,はどれ？","①","②","③",3,2])

        quizArray.shuffle()
              
        choiceQuiz()

        //タイマー動かす
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.timecount),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        //タイマー起動
        timecount()
    }
    
    func choiceQuiz() {
        
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
        if tmpArray[4] as! Int  == 1 {
            imageLabel.image = UIImage(named: "color01.png")
        }else if  tmpArray[4] as! Int  == 2 {
            imageLabel.image = UIImage(named: "color02.png")
        }else if  tmpArray[4] as! Int  == 3 {
            imageLabel.image = UIImage(named: "color03.png")
        }
    }
    
    @objc func timecount() {
        
        count = count + 0.01
        
        //タイマーが一定時間立つとリザルト
        if count >= 6.00 {
            performSegueToResult()
            timer.invalidate()
        }
    }
    
    
    //自動で遷移
    func performSegueToResult() {
        saveData.set(star02, forKey: "starcount02")
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.timer = self.count
        segue.destination.modalPresentationStyle = .fullScreen
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
         let tmpArray = quizArray[0] as! [Any]
        
        //答えが合えば結果へ遷移、タイマー止める
        if tmpArray[5] as! Int == sender.tag && timer.isValid && count == 5.00 {
            timer.invalidate()
            star02 = star02 + 3
            performSegueToResult()
        }else if tmpArray[5] as! Int == sender.tag && timer.isValid && count >= 4.75 && count <= 5.25 {
            timer.invalidate()
            star02 = star02 + 2
            performSegueToResult()
        }else if tmpArray[5] as! Int == sender.tag && timer.isValid && count >= 4.50 && count <= 5.50 {
            timer.invalidate()
            star02 = star02 + 1
            performSegueToResult()
        }else if tmpArray[5] as! Int == sender.tag && timer.isValid {
            timer.invalidate()
            performSegueToResult()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

