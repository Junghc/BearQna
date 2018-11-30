//
//  QuestionViewController.swift
//  Qna
//
//  Created by User03 on 2018/11/21.
//  Copyright © 2018 User03. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var number=0
    var r_ans=""
    var grade=0
    
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgainBtn(_ sender: Any) {
        // initial
        number=0
        grade=0
        QNumBtn.text="Question： "+String(number+1)
        gradeLabel.text="得分："+String(grade)
        // random question
        qnas.shuffle()
        playGame()
        playAgainBtn.isHidden=true
    }
    
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var QNumBtn: UILabel!
    
    // btn array to use outlet collection
    @IBOutlet var ansBtn: [UIButton]!
    
    // ref: http://blackbear.ysnp.gov.tw/Chinese/qa/qa_include.asp?search=1
	
    var qnas:[Qna] = [Qna(question: "台灣黑熊的壽命有多長？",answer: "20、30年", choice:["1、2年","5、6年","10、15年","20、30年"]),
                      Qna(question: "台灣黑熊胸前的最大特徵為何？", answer: "V字形", choice: ["V字形","X字形","W字形","U字形"]),
                      Qna(question: "台灣黑熊幾歲才性成熟可以產仔？", answer: "三、四歲", choice: ["一、二歲","三、四歲","五、六歲","七、八歲"]),
                      Qna(question: "世界上有幾種熊？", answer: "八種", choice: ["六種","七種","八種","九種"]),
                      Qna(question: "何種熊不在亞洲地區？", answer: "眼鏡熊", choice: ["熊貓","馬來熊","亞洲黑熊","眼鏡熊"]),//貓熊、馬來熊、懶熊、亞洲黑熊
        Qna(question: "野外的台灣黑熊都居住在哪裡？", answer: "沒有固定的居所", choice: ["山頂","山腰","深山隱密處","沒有固定的居所"]),//深山隱密處 山頂 山腰
        Qna(question: "如何知道附近有沒有熊出沒？", answer: "以上皆是", choice: ["食痕","排糞","腳印","以上皆是"]),//食痕、排糞、腳印
        Qna(question: "台灣黑熊多高？", answer: "120–180公分", choice: ["95-110公分","120–180公分","200-250公分","260-320公分"]),
        Qna(question: "熊的食性？", answer: "雜食性動物", choice: ["腐食性動物","植食性動物","雜食性動物","肉食性動物"]),
        Qna(question: "雌熊每次產下多少熊仔？", answer: "1-3隻", choice: ["1-3隻","4-6隻","7-8隻","9-11隻"]),
        Qna(question: "熊界的弱雞？", answer: "馬來熊", choice: ["馬來熊","熊貓","棕熊","懶熊"]),
        Qna(question: "熊界大BOSS？", answer: "熊貓", choice: ["熊貓","北極熊","美洲黑熊","棕熊"]),
        Qna(question: "熊的正常心跳是每分鐘幾下？", answer: "40", choice: ["40","72","120","66"]),
        Qna(question: "冬眠的熊的心臟跳動下降到每分鐘幾下？", answer: "8", choice: ["8","16","32","24"]),
        Qna(question: "幾乎只吃竹子的熊？", answer: "熊貓", choice: ["熊貓","馬來熊","懶熊","亞洲黑熊"]),
        Qna(question: "哪種熊擁有最濃密的毛？", answer: "懶熊", choice: ["懶熊","眼鏡熊","熊貓","棕熊"]),
        Qna(question: "最小的熊種？", answer: "馬來熊", choice: ["馬來熊","眼鏡熊","懶熊","亞洲黑熊"]),
        Qna(question: "常在夜間活動的熊？", answer: "懶熊", choice: ["懶熊","北極熊","熊貓","棕熊"]),
        Qna(question: "數量最多的熊？", answer: "美洲黑熊", choice: ["美洲黑熊","熊貓","棕熊","馬來熊"]),
        Qna(question: "世界上最常見的熊？", answer: "棕熊", choice: ["棕熊","熊貓","美洲黑熊","亞洲黑熊"])
    ]
    
    @IBAction func chooseBtn(_ sender: UIButton) {
        number+=1
        
        if sender.currentTitle==r_ans{
            grade+=10
            gradeLabel.text="得分："+String(grade)
        }
		// playEnd
        if number==10{
            
            let alertController = UIAlertController(
                title: "遊戲結束",
                message: "分數：\(grade)分",
                preferredStyle: .alert)
            
            let okBtn = UIAlertAction(
                title: "確認",
                style: .default,
                handler:{
                    (action: UIAlertAction!) -> Void in
            })
            alertController.addAction(okBtn)
            //show the alertController
            self.present(alertController, animated: true, completion: nil)
            
            playAgainBtn.isHidden=false
			
        }
        else{
            QNumBtn.text="Question： "+String(number+1)
            playGame()
        }        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        qnas.shuffle()
        playGame()
        
    }
    func playGame(){
        //Qna(question: <#T##String#>, answer: <#T##String#>)
        //build question
        qLabel.text=qnas[number].question
        r_ans=qnas[number].answer
        // random choice
        qnas[number].choice.shuffle()
        for i in 0...3{
            ansBtn[i].setTitle(qnas[number].choice[i], for: .normal)
        }
        //ansBtn[0].setTitle(qnas[number].answer, for: .normal)
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
