# ManOWar-SwarzChen
***~This is a shooting game originally developed by me, enjoy it !***

## 獲勝條件
對方玩家只要被子彈擊中或是踩進原形地雷的範圍內，就會死亡
每位玩家只有一條命  

## 子彈限制
* 螢幕中每位玩家只會存在***三枚子彈*** 需要等待子彈消失才可以繼續射擊  
超過限制會顯示 ***out of charge*** 在 terminal 中  
(一次射太多發太op了)  

* 每完玩家只有***三枚地雷*** 不會重新裝彈  
放完就沒有了  
超過限制會顯示 ***out of charge*** 在 terminal 中  

## 注意事項
* 因為是吃操作技術的遊戲 請勿使用過爛的鍵盤遊玩  
(不然會偵測不到按鍵放開release...)
如果真的每有好一點的鍵盤  
請操作的慢一點...

* 若是電腦顯卡不夠進行螢幕刷新  
會造成角色移動卡盪  
目前測試以 macbook 跑會非常的順  
給玩家們參考  

* 請用英文輸入法

## Player 1  
* Color : Blue  
* Operation :  
  `W` : 向上走  
  `A` : 向左走  
  `S` : 向下走  
  `D` : 向右走  
    
  `G` : 向上發射子彈  
  `B` : 向下發射子彈  
  `V` : 向左發射子彈  
  `N` : 向右發射子彈  
    
  `space` : 放置圓形地雷  
  
## Player 2  
* Color : Red  
* Operation :  
  `↑` : 向上走  
  `←` : 向左走    
  `↓` : 向下走    
  `→` : 向右走  
    
  `5` : 向上發射子彈
  `2` : 向下發射子彈  
  `1` : 向左發射子彈  
  `3` : 向右發射子彈  
  
  `+` : 放置圓形地雷
---
## 實作方式
由一個每隔0.01秒呼叫特定函式的timer實作成遊戲引擎  
每次確定各個物件的狀態是否改變  
遊戲在運算上面做了許多優化 在顯示卡刷新率支持的情況下  
應該可以順暢的遊玩  
 
