//
//  GameViewController02.swift
//  FiveTimejust
//
//  Created by チップまん on 2020/10/11.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class GameViewController02: UIViewController {
    
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
        
        quizArray.append(["問題文1","選択肢1","選択肢2","選択肢3",2])
        quizArray.append(["問題文2","選択肢1","選択肢2","選択肢3",1])
        quizArray.append(["問題文3","選択肢1","選択肢2","選択肢3",3])
        quizArray.append(["問題文4","選択肢1","選択肢2","選択肢3",3])
        quizArray.append(["問題文5","選択肢1","選択肢2","選択肢3",2])
        quizArray.append(["問題文6","選択肢1","選択肢2","選択肢3",1])
              
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
    }
    
    @objc func timecount() {
        
        count = count + 0.01
        
        //タイマーが一定時間立つとリザルト
        if count >= 6.00 {
            performSegueToResult()
        }
    }
    
    
    //自動で遷移
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.timer = self.count
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
         let tmpArray = quizArray[0] as! [Any]
        
        //答えが合えば結果へ遷移、タイマー止める
        if tmpArray[4] as! Int == sender.tag && timer.isValid {
            performSegueToResult()
            timer.invalidate()
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
