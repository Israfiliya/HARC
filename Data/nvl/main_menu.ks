;------------------------------------------------------------
;主菜單
;------------------------------------------------------------
*start
[locksnapshot]
[tempsave]
;------------------------------------------------------------
*window
[history enabled="false"]
[locklink]
[rclick enabled="true" jump="true" storage="main_menu.ks" target=*返回]

[backlay]
;主選單背景
[image layer=14 page=back storage=&"f.config_menu.bgd" left=0 top=0 visible="true"]
;無效化系統按鈕層
[disablesysbutton page="back"]
;用message4描繪
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[current layer="message4" page="back"]
[er]
;顯示主選單按鈕
[button_menu]
[trans method="crossfade" time=200]
[wt]

[s]

*刷新畫面
[current layer="message4"]
[er]
;顯示主選單按鈕
[button_menu]
[s]

;------------------------------------------------------------
;以下都是跳轉到對應界面的window標籤，避免重複tempsave
;------------------------------------------------------------
*保存遊戲
[jump storage="save.ks" target=*window]

*讀取進度
[jump storage="load.ks" target=*window]

*系統設定
[jump storage="option.ks" target=*window]

*自定選單
;可以自己設定跳到什麼地方
[jump storage="other_sample.ks" target=*window]

;------------------------------------------------------------
;從其他界面返回時，都會跳到 *返回 標籤
;如果需要返回主選單，可以修改成跳到如上的 *刷新畫面 標籤
;------------------------------------------------------------
*返回
[locklink]
[rclick enabled="false"]
[backlay]
[tempload backlay="true" bgm="false" se="false"]
[trans method="crossfade" time=200]
[wt]

[unlocksnapshot]
[return]
