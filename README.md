# 關於熊🐻的Ｑ＆Ａ
> 看看你對於熊的了解有多少！


![](https://github.com/Junghc/BearQna/blob/master/QnaMov.gif)

- 題目為隨機出題
- 答案選項順序隨機
- Play Again 重新挑戰遊戲
- 使用 shuffle() 打亂順序

```
qnas.shuffle() // random question
qnas[number].choice.shuffle() // random choice
```

- 將多個 Button 變成 Array (outlet collection)

```
@IBOutlet var ansBtn: [UIButton]!
```

- 透過 currentTitle 取得按鈕目前的文字
(判斷是否答對)

```
if sender.currentTitle==r_ans{
   grade+=10
   gradeLabel.text="得分："+String(grade)
}
```
