//
//  GameViewController01.swift
//  FiveTimejust
//
//  Created by チップまん on 2020/10/04.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class GameViewController01: UIViewController {
    
    var outputValue : Int!
    
    //ステージが入ってる配列
    var stageArray = [Any]()
    
    //問題文
    @IBOutlet var QuizLabel: UILabel!
    
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
        
        
        //選択したステージの問題、ボタン、答え
        stageArray.append(["正しいのはどれ","1","2","3",2])
        stageArray.append(["r:10 g:10 b:10はどれ","1","2","3",2])
        stageArray.append(["問題","選択肢1","選択肢2","選択肢3",2])
        
        //タイマー動かす
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.timecount),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        
        if outputValue == 1 {
            
        }
        //セレクト画面で選択したステージを読んでくる
        stageArray = Any(outputValue)
        
        //タイマー起動
        timecount()
        
        //choiceStageを実行
        choiceStage()
        
    }
    
    @objc func timecount() {
        
        count = count + 0.01
        
        //タイマーが一定時間立つとリザルト
        if count >= 6.00 {
            performSegueToResult()
            
        }
    }
    
    func choiceStage() {
        
        let tmpArray = stageArray[0] as! [Any]
        
        //問題文を表示
        QuizLabel.text = tmpArray[0] as? String
        
        //選択肢をセットする
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
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
        
        let tmpArray = stageArray[0] as! [Any]
        
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

