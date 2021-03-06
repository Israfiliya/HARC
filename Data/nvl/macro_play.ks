;-------------------------------------------------------------------------------------------
;封裝的宏,對應於指令編輯器，可以根據自己的需求修改
;-------------------------------------------------------------------------------------------
*start
;-------------------------------------------------------------------------------------------
;★人名顯示基礎
;-------------------------------------------------------------------------------------------
[macro name=npc]

[nowait]
[layopt layer="message0" visible="true"]
[current layer="message0"]
[er]

;修改姓名顯示相對位置的地方
;去掉下面這行的;，就可以用了，坐標可以為負值
;【記得後面還有要把對話文字位置改回來的地方】
;[locate x=-50 y=0]

;使用人名默認顏色
[eval exp="setfont()"]

;假如特別設定了顏色，使用傳入的顏色值
[font color=%color]

;非主角
[if exp="mp.id!='主角'"]
【[emb exp="mp.id"]】
[endif]

;為主角，沒姓名時不顯示
[if exp="mp.id=='主角'"]
[ch text="【" cond="f.姓!=void || f.名!=void"]
[emb exp="f.姓"][emb exp="f.名"]
[ch text="】" cond="f.姓!=void || f.名!=void"]
[endif]

[resetfont]

[r]
[endnowait]

;可以這裡再把顯示位置改回來
;[locate x=0 y=0]

;附加顯示
[backlay]
;頭像
[if exp="mp.face!=void"]
[image layer=8 page="back" storage=%face visible="true"]
;left/top位置可以自己調整，可以用數字，這裡是根據編輯器設定的值，按底邊中點對齊
[layopt layer=8 page="back" left=&"(int)f.config_dia.face.left-kag.back.layers[8].width\2" top=&"(int)f.config_dia.face.top-kag.back.layers[8].height"]
[endif]
;立繪
[if exp="mp.fg!=void"]
;在原位置顯示圖片
[eval exp="mp.layer='0'" cond="mp.layer==''"]
[eval exp="mp.left=kag.fore.layers[mp.layer].left"]
[eval exp="mp.top=kag.fore.layers[mp.layer].top"]
[image layer=%layer page="back" storage=%fg left=%left top=%top visible="true"]
[endif]
[trans method="crossfade" time=100]
[wt]

[endmacro]
;------------------------------------------------------------------
;★準備選項
;------------------------------------------------------------------
[macro name=selstart]
[hr]
[backlay]
;隱藏對話層、消除頭像
[if exp="mp.hidemes"]
[rclick enabled="false"]
[layopt layer="message0" visible="false" page=back]
[freeimage layer="8" page=back]
[endif]
;隱藏按鈕層
[if exp="mp.hidesysbutton"]
[rclick enabled="false"]
[hidesysbutton]
[endif]
;顯示選項層
[frame layer="message1" page="back"]
[current layer="message1" page="back"]
[nowait]
[endmacro]
;------------------------------------------------------------------
;★按鈕選項
;------------------------------------------------------------------
[macro name=selbutton]
;顯示選項按鈕
[eval exp="createSelbutton(mp)"]
[endmacro]
;------------------------------------------------------------------
;★等待選擇-選項
;------------------------------------------------------------------
[macro name=selend]
[endnowait]
;假如是限時選項，強制將系統菜單無效化
[if exp="mp.timeout"]
[history enabled="false"]
[rclick enabled="false"]
[hidesysbutton]
[endif]
[trans method=%method|crossfade time=%time|300 rule=%rule|1 from=%from stay=%stay]
[wt canskip=%canskip]
;限時選項處理
[if exp="mp.timeout"]
[timeout time=%outtime storage=%storage target=%target]
[endif]
[if exp="mp.timebar"]
[timebar bar=%bar x=%x y=%y time=%outtime width=%width bgimage=%bgimage bgx=%bgx bgy=%bgy]
[endif]
[s]
[endmacro]
;------------------------------------------------------------------
;★清理選項
;------------------------------------------------------------------
[macro name=clsel]
[rclick enabled="true"]
[history enabled="true"]
[backlay]
[layopt layer="message1" visible="false" page="back"]

;恢復對話框與系統按鈕
[layopt layer="message0" visible="true" page=back]
;顯示系統按鈕層
[showsysbutton]
[trans method=%method|crossfade time=%time|100 rule=%rule|1 from=%from stay=%stay]
[wt canskip=%canskip]
;返回對話
[current layer="message0"]
[endmacro]
;------------------------------------------------------------------
;★文字連接
;------------------------------------------------------------------
[macro name=links]
[link *][ch text=%text][endlink]
[endmacro]

;------------------------------------------------------------------
;★等待
;------------------------------------------------------------------
[macro name=lr]
[l][r]
[endmacro]

[macro name=w]
;可在這裡加入等待語音播放完畢的指令
[endvo]
[p]
[stopse buf="1"]
[hr]
[endmacro]
;------------------------------------------------------------------
;★普通對話框(含頭像)
;------------------------------------------------------------------
[macro name=dia]
[rclick enabled="true"]
[history enabled="true"]
[backlay]
[freeimage layer=8 page="back"]
[current layer="message0" page="back"]
[position page="back" layer="message0" visible="true" frame=&"f.config_dia.dia.frame" left=&"f.config_dia.dia.left" top=&"f.config_dia.dia.top" marginl=&"f.config_dia.dia.marginl" marginr=&"f.config_dia.dia.marginr" margint=&"f.config_dia.dia.margint" marginb=&"f.config_dia.dia.marginb"]
;顯示系統按鈕層
[showsysbutton]
[trans method="crossfade" time=200]
[wt]
[current layer="message0" page="fore"]
[endmacro]
;------------------------------------------------------------------
;★全屏對話框(不含頭像)
;------------------------------------------------------------------
[macro name=scr]
[rclick enabled="true"]
[history enabled="true"]
[backlay]
[freeimage layer=8 page="back"]
[current layer="message0" page="back"]
[position page="back" layer="message0" visible="true" frame=&"f.config_dia.scr.frame" left=&"f.config_dia.scr.left" top=&"f.config_dia.scr.top" marginl=&"f.config_dia.scr.marginl" marginr=&"f.config_dia.scr.marginr" margint=&"f.config_dia.scr.margint" marginb=&"f.config_dia.scr.marginb"]
;顯示系統按鈕層
[showsysbutton]
[trans method="crossfade" time=200]
[wt]
[current layer="message0" page="fore"]
[endmacro]
;------------------------------------------------------------------
;★透明全屏對話框
;------------------------------------------------------------------
[macro name=menu]
[rclick enabled="false"]
[history enabled="false"]
[backlay]
[freeimage layer=8 page="back"]
[current layer="message0" page="back"]
[position frame="" page="back" layer="message0" visible="true" width=&"kag.scWidth" height=&"kag.scHeight" color="0xFFFFFF" opacity="0" left=0 top=0 marginl=&"f.config_dia.blank.marginl" marginr=&"f.config_dia.blank.marginr" margint=&"f.config_dia.blank.margint" marginb=&"f.config_dia.blank.marginb"]
;隱藏系統按鈕層
[hidesysbutton]
[trans method="crossfade" time=200]
[wt]
[current layer="message0" page="fore"]
[endmacro]
;------------------------------------------------------------
;★隱藏對話框
;------------------------------------------------------------
[macro name=hidemes]
[backlay]
;隱藏對話框
[layopt layer="message0" page="back" visible="false"]
;隱藏系統按鈕
[layopt layer="message2" page="back" visible="false"]
;隱藏頭像
[layopt layer=8 page="back" visible="false"]
[trans method="crossfade" time=100]
[wt]
[endmacro]
;------------------------------------------------------------
;★顯示對話框
;------------------------------------------------------------
[macro name=showmes]
[backlay]
;隱藏對話框
[layopt layer="message0" page="back" visible="true"]
;隱藏系統按鈕
[layopt layer="message2" page="back" visible="true"]
;隱藏頭像
[layopt layer=8 page="back" visible="true" cond="kag.back.layers[8].width>32"]
[trans method="crossfade" time=100]
[wt]
[current layer=message0 page=back]
[er]
[current layer=message0 page=fore]
[endmacro]
;------------------------------------------------------------------
;★顯示背景
;------------------------------------------------------------------
[macro name=bg]
[backlay]
;一般效果
[image * layer=stage storage=%storage|black page=back visible="true" left=0 top=0 grayscale=%grayscale|false mcolor=%mcolor mopacity=%mopacity]
;反色效果
[if exp="mp.convert==true"]
[image * layer=stage storage=%storage|black page=back visible="true" left=0 top=0 grayscale=%grayscale|false mcolor=%mcolor mopacity=%mopacity rceil=0 gceil=0 bceil=0 rfloor=255 bfloor=255 gfloor=255]
[endif]

;消除立繪
[if exp="mp.clfg==true"]
[freeimage layer=0 page="back"]
[freeimage layer=1 page="back"]
[freeimage layer=2 page="back"]
[freeimage layer=3 page="back"]
[freeimage layer=4 page="back"]
[freeimage layer=5 page="back"]
[freeimage layer=6 page="back"]
[freeimage layer=7 page="back"]
;[freeimage layer=event page="back"]
[freeimage layer=8 page="back"]
[endif]

;消除對話框
[if exp="mp.hidemes==true"]
[current layer="message0" page="back"]
[er]
[current layer="message1" page="back"]
[er]
[current layer="message2" page="back"]
[er]
[layopt layer="message0" visible="false" page="back"]
[layopt layer="message1" visible="false" page="back"]
[hidesysbutton]
[endif]

[trans method=%method|crossfade time=%time|700 rule=%rule stay=%stay from=%from]
[wt canskip=%canskip|true]
[endmacro]
;------------------------------------------------------------------
;★消除背景
;------------------------------------------------------------------
[macro name=clbg]
[backlay]
[freeimage layer=stage page="back"]
;連同全部前景
[if exp="mp.clfg==true"]
[freeimage layer=0 page="back"]
[freeimage layer=1 page="back"]
[freeimage layer=2 page="back"]
[freeimage layer=3 page="back"]
[freeimage layer=4 page="back"]
[freeimage layer=5 page="back"]
[freeimage layer=6 page="back"]
[freeimage layer=7 page="back"]

;[freeimage layer=event page="back"]
[freeimage layer=8 page="back"]
[endif]

;連同對話框
[if exp="mp.hidemes==true"]
[current layer="message0" page="back"]
[er]
[current layer="message1" page="back"]
[er]
[current layer="message2" page="back"]
[er]
[layopt layer="message0" visible="false" page="back"]
[layopt layer="message1" visible="false" page="back"]
[hidesysbutton]
[endif]

[trans method=%method|crossfade time=%time|700 rule=%rule stay=%stay from=%from]
[wt canskip=%canskip|true]
[endmacro]
;------------------------------------------------------------------
;★顯示人物
;------------------------------------------------------------------
[macro name=fg]
[backlay]
;第一次顯示,指定角色位置
[if exp="mp.pos!=''"]
[image * storage=%storage|empty layer=%layer|0 page="back" pos=%pos visible="true"]
[else]
;不指定時,自動調整,使立繪顯示在原位置/指定位置
[eval exp="mp.layer='0'" cond="mp.layer==''"]
[eval exp="mp.left=kag.fore.layers[mp.layer].left" cond="mp.left==void"]
[eval exp="mp.top=kag.fore.layers[mp.layer].top" cond="mp.top==void"]
[image * storage=%storage layer=%layer page="back" left=%left top=%top visible="true"]
[endif]
[trans method=%method|crossfade time=%time|500 rule=%rule stay=%stay from=%from]
[wt canskip=%canskip|true]
[endmacro]
;------------------------------------------------------------------
;★消除人物
;------------------------------------------------------------------
[macro name=clfg]
[backlay]
;消除全部
[if exp="mp.layer=='all'"]
[freeimage layer=0 page="back"]
[freeimage layer=1 page="back"]
[freeimage layer=2 page="back"]
[freeimage layer=3 page="back"]
[freeimage layer=4 page="back"]
[freeimage layer=5 page="back"]
[freeimage layer=6 page="back"]
[freeimage layer=7 page="back"]
;[freeimage layer=event page="back"]
[freeimage layer=8 page="back"]
[endif]
;消除單層
[if exp="mp.layer!='all'"]
[freeimage layer=%layer|0 page="back"]
[endif]
;消除頭像
[if exp="mp.clface==true"]
[freeimage layer=8 page="back"]
[endif]
;連同對話框
[if exp="mp.hidemes==true"]
[current layer="message0" page="back"]
[er]
[current layer="message1" page="back"]
[er]
[current layer="message2" page="back"]
[er]
[layopt layer="message0" visible="false" page="back"]
[layopt layer="message1" visible="false" page="back"]
[hidesysbutton]
[endif]
[trans method=%method|crossfade time=%time|500 rule=%rule stay=%stay from=%from]
[wt canskip=%canskip|true]
[endmacro]
;------------------------------------------------------------------
;★顯示頭像
;------------------------------------------------------------------
[macro name=face]
[backlay]
[image * layer=8 visible="true" page="back" storage=%storage|empty]
[layopt layer=8 page="back" left=&"(int)f.config_dia.face.left-kag.back.layers[8].width\2" top=&"(int)f.config_dia.face.top-kag.back.layers[8].height"]
;附加顯示立繪
[if exp="mp.fg!=void"]
;在原位置顯示圖片
[eval exp="mp.layer='0'" cond="mp.layer==''"]
[eval exp="mp.left=kag.fore.layers[mp.layer].left"]
[eval exp="mp.top=kag.fore.layers[mp.layer].top"]
[image layer=%layer page="back" storage=%fg left=%left top=%top visible="true"]
[endif]
[trans method=%method|crossfade time=%time|100 rule=%rule|1]
[wt]
[endmacro]
;------------------------------------------------------------
;★播放音樂
;------------------------------------------------------------
[macro name=bgm]
[xchgbgm * storage=%storage overlap=%overlap|500 time=%time|1000]
[endmacro]
;------------------------------------------------------------
;★播放音效
;------------------------------------------------------------
[macro name=se]
[if exp="mp.time==void"]
[playse storage=%storage loop=%loop|false buf=%buf|0]
[else]
[fadeinse storage=%storage loop=%loop|false buf=%buf|0 time=%time|0]
[endif]
[endmacro]
;------------------------------------------------------------
;★播放語音
;------------------------------------------------------------
;播放語音（並進行歷史記錄回放處理）
[macro name=vo]
	[eval exp="f.voing=true"]
	[playse storage=%storage buf="1" loop="false"]
	[hact exp=&("playse("+"\""+mp.storage+"\""+")")]
[endmacro]
;語音結束（等待播放完畢，歷史記錄處理結束）
[macro name=endvo]
	;假如有語音正在播放才執行以下指令
	[if exp="f.voing==true"]
		[eval exp="f.voing=false"]
		[endhact]
		;僅在auto模式下進行語音等待
		[ws buf="1" canskip="true" cond="kag.autoMode==true"]
	[endif]
[endmacro]
;-------------------------------------------------------------------------------------------
;★播放視頻
;-------------------------------------------------------------------------------------------
[macro name=mv]
[video visible="true" mode="mixer" width=&"kag.scWidth" height=&"kag.scHeight"]
[playvideo storage=%storage]
[wv canskip="true"]
[endmacro]
;-------------------------------------------------------------------------------------------
;★移動
;-------------------------------------------------------------------------------------------
[macro name=movepos]
[eval exp="tf.layer=0"]
[eval exp="tf.layer=mp.layer" cond="mp.layer!=''"]
[eval exp="tf.left=kag.fore.layers[tf.layer].left"]
[eval exp="tf.top=kag.fore.layers[tf.layer].top"]
[eval exp="tf.oop=kag.fore.layers[tf.layer].opacity"]
[eval exp="tf.x=0"]
[eval exp="tf.y=0"]
[eval exp="tf.opacity=kag.fore.layers[tf.layer].opacity"]
[eval exp="tf.x=mp.x" cond="mp.x!=''"]
[eval exp="tf.y=mp.y" cond="mp.y!=''"]
[eval exp="tf.opacity=mp.opacity" cond="mp.opacity!=''"]
[eval exp="tf.x2=tf.left*1+mp.x*1"]
[eval exp="tf.y2=tf.top*1+mp.y*1"]
[eval exp="tf.path='('+&tf.x2+','+&tf.y2+','+&tf.opacity+')'"]
[move layer=%layer|0 path="&tf.path" time=%time|100 accel=%accel]
[wm canskip=%canskip]
[endmacro]
;-------------------------------------------------------------------------------------------
;★背景搖晃
;-------------------------------------------------------------------------------------------
[macro name=shake]
[action layer=stage module=LayerWaveActionModule vibration=10 cycle=100 time=400 cond="mp.dir=='wave'"]
[action layer=stage module=LayerJumpActionModule vibration=10 cycle=100 time=400 cond="mp.dir=='jump'"]
[wact canskip=%canskip]
[endmacro]
;-------------------------------------------------------------------------------------------
[return]
