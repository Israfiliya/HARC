;------------------------------------------------------------
;點下「開始遊戲」以後一開始默認執行的內容
;你可以把下面替換成自己的劇本，或者直接從這裡跳躍到其他自建腳本
;------------------------------------------------------------
*start|序章
@backlay
@image left="-384" page="back" time="3000" method="crossfade" visible="true" zoom="80" layer="stage" top="-200" storage="tanumachi003_19201080"
@trans time="3000" method="crossfade"
@wt
@dia
@history output="true"
走過微斜的坡道上，男子回身望去-[w]
陽光灑在走過的斜坡上，反射的光輝有些刺眼。[lr]
@hidemes
@backlay
@image left="-384" page="back" time="3000" method="crossfade" visible="true" zoom="80" layer="stage" top="-200" storage="1710machi004_19201080"
@trans time="3000" delay="3000" method="crossfade"
@wt
@dia
@v
[macro name=Vb]
@font color="0xCCFFFF"
[endmacro]
@vb
轉學......我該慶幸至少不是夏天嗎？[p]
@resetfont
你抬手抹去了額頭上薄博的汗珠。[p]
@v
@vb
真是的，到底要給我添多少麻煩。[l]
自顧自地換工作，又把人丟在這奇怪的地方......[lr]
@resetfont
抬頭望向眼前，越過路邊的行道樹，可以隱約見到遠處的建築物。[w]
@v
@vb
希望這次......[l]
@wait time="1000"
還是算了。[p]
@hidemes
@wait time="1000"
@backlay
@image left="-384" page="back" time="3000" method="crossfade" visible="true" zoom="80" layer="stage" top="-200" storage="gakuen10_001_19201080"
@trans time="3000" method="crossfade"
@wt
@dia
收回了後半句的話，片刻前還只能見到輪廓的建築物已然近在眼前[p]
@v
@vb
就是這裡了嗎？還真是......
@wait time="500"
惡趣味的名字。[p]
@resetfont
私立玫銘恣學園-這樣的名字好好地刻在了正門口的立柱上。[lr]
順著人潮，你走入了學園。[lr]
@hidemes
@backlay
@image left="-384" page="back" time="3000" method="crossfade" visible="true" zoom="80" layer="stage" top="-200" storage="gakuen10_005_19201080"
@trans time="3000" method="crossfade"
@wt
@dia
你望著走廊末端的地圖，簡易的平面圖清楚標示了建築內部的結構[lr]
@clfg layer="0" clface="1"
;----------
;顯示選擇按鈕
@selstart hidemes="0" hidesysbutton="0"
@locate y="200" x="0"
@selbutton target="*選擇A" text="前往教室"
@locate y="300" x="0"
@selbutton target="*選擇B" text="前往教師辦公室"
@selend
;----------
*選擇A|路線一
@clsel
@v
@vb
就算想去教室，也還不知道班級呢。[lr]
果然還是直接去找他吧.....記得是在.....[lr]
@resetfont
@jump target="*合併"
;----------
*選擇B|路線二
@clsel
@v
@vb
果然還是直接去找他吧.....記得是在.....[lr]
@resetfont
@jump target="*合併"
;----------
*合併
@hidemes
@backlay
@image left="-384" page="back" time="3000" method="crossfade" visible="true" zoom="80" layer="stage" top="-200" storage="gakuen10_005_19201080 - Copy"
@trans time="3000" method="crossfade"
@wt
@dia
@quake time="1000" layer="message0" vmax="20" hmax="20"
@font size="50"
轟咚！匡噹！[lr]
@resetfont
@hidemes
@wait time="500"
@dia
這時從走廊外傳來劇烈的聲響。[lr]
雖然不算特別大的聲音，在寧靜的早晨卻格外刺耳。[lr]
於是.....[w]
@clfg layer="0" clface="1"
;----------
;顯示選擇按鈕
@selstart hidemes="0" hidesysbutton="0"
@locate y="200" x="0"
@selbutton target="*選項2-A" text="......感覺不是什麼好事，繼續前往辦公室吧？"
@locate y="300" x="0"
@selbutton target="*選項2-B" text="有些好奇，於是從窗戶向外觀察。"
@selend
;----------
*選項2-A|路線一
@clsel
@v
@vb
對呢，確實是這個方向。[lr]
@m
[macro name=Mb]
@font color="0x923300"
[endmacro]
@mb
哈 哈 哈！這下......[lr]
@resetfont
@hidemes
@wait time="200"
@dia
隱隱約約地，身後傳來了笑聲和怒罵。[lr]
是錯覺吧？倒不如說在意了會很不妙的感覺……[lr]
@jump target="*合併2"
;----------
*選項2-B|路線二
@clsel
@v
@vb
果然還是很介意，稍微偷看一下吧？[p]
@resetfont
這樣地說著，悄悄將頭探出窗外。[lr]
@hidemes
@backlay
@image left="-384" page="back" time="3000" method="crossfade" visible="true" zoom="80" layer="stage" top="-200" storage="gakuen10_014_19201080"
@trans time="3000" method="crossfade"
@wt
@dia
映入眼簾的是足以讓人以為自己產生了幻覺的奇異景象。[lr]
@v
@vb fontsize="35"
......
@wait time="1000"
這是什麼鬼？[p]
@resetfont
巨大的沙灘車在操場上橫衝直撞，[r]將將衝出跑道的範圍時，[lr]
卻以前輪為軸心甩出一個驚人的曲線，[r]在地上拖出深深的溝槽的同時成功轉彎。[p]
@v
@vb
為什麼是甩尾?
@wait time="200"
難道是考慮到砂石地利用抓
力過彎的輪胎損耗量.....[lr]
@wait time="200"
不，說來這裡應該是學校吧？那個沙灘車到底是怎麼回事。[p]
@resetfont
雖然感覺到深入思考會讓自己的理智受到某種程度的挑戰，[lr]
你仍然無法控制自己發散的思維。[lr]
而此時，似乎注意到這邊視線似地，車上的人轉過頭來。[p]
@hidemes
@fg left="512" zoom="50" top="-300" storage="Male_02_Surprise"
@jump target="*合併2"
;----------
*合併2
@link exp="System.shellExecute('http://www.nvlmaker.net/')"
《THE NVL Maker》的官網
@endlink
也提供了專門的頁面用於遊戲宣傳，方便同好交流。[w]
@nvl娘
所以，發佈遊戲的時候歡迎
@link exp="System.shellExecute('http://www.weibo.com/nvlmaker')"
@font color="0xCCFFCC"
艾特官方微博
@resetfont
@endlink
喲~[w]
@nvl娘 face="face01_01" fg="fg01_01"
還有一點要注意的是，在使用THE NVL Maker製作遊戲時，不能使用「侵犯到他人版權的素材」。[w]
@nvl娘
例如，不能使用網上隨意搜索到的風景圖片作為背景，不能使用來源不明的MP3作為BGM等等。[w]
@nvl娘
NVL可以使用的素材僅限於此範圍：來歷明確（可指向特定的作者，而非收集者）、有清楚的使用規約（作者聲明同意用於遊戲）。[w]
@nvl娘
網上會有一些所謂的素材站，將其他遊戲的圖片音樂音效等解包並放出，或隨意擴散他人版權的作品，這些被稱為「版權物」，是絕對不可以使用的。[w]
@nvl娘
簡單地說，請不要使用由「收集者」而非「原作者」上傳的「XX素材包」。[w]
@nvl娘
如果你看到「內容由用戶上傳版權歸原作者所有僅供學習」等字樣，那麼可以直接把那個站拉黑了。[w]
@nvl娘
「禁止侵權」這點對免費遊戲也沒有例外。因為，一旦你公開了包含版權問題素材的遊戲，你的行為已經不屬於通稱的「個人學習使用」。[w]
@nvl娘
在這種情況下，發佈（如在論壇、貼吧、QQ群有條件或無條件分享等等）即是違法。[w]
@nvl娘 face="face01_02" fg="fg01_02"
當然，並不是說所有東西都一定要自己做。[lr]還是可以利用現有資源的～[w]
@nvl娘
所以，為了幫助大家更有效率地製作遊戲，
@link exp="System.shellExecute('http://www.nvlmaker.net/')"
《THE NVL Maker》的官網[endlink]
提供了一些合法的共享素材網站連接。
請點
@link exp="System.shellExecute('http://www.nvlmaker.net/material.html')"
@font color="0xCCFFCC"
這裡查看
@resetfont
@endlink
。[w]
@nvl娘 face="face01_01" fg="fg01_01"
對於一些作品的二次創作（即是俗稱的XX作品的同人），在沒有獲得官方授權的情況下，也不可以使用官方的原畫、截圖、OST等。[w]
@nvl娘 face="face01_02" fg="fg01_02"
真心想要製作二次創作遊戲的話，請寫信去向官方索要授權，[lr]或者徵集同好一起來畫圖、創作音樂吧。[w]
@nvl娘 face="face01_01" fg="fg01_01"
接下來進入演示正題～[w]
@clfg layer="8" time="100"
;----------
;設置默認姓名
@eval exp="f.姓='abc'"
@eval exp="f.名='def'"
@history output="false"
;自定義主角名字的代碼
@nowait
請輸入主角名字：[r]
姓氏：[edit opacity=0 color=0xFFFFFF name=f.姓][r]
名字：[edit opacity=0 color=0xFFFFFF name=f.名][r]
@links target="*輸入完畢" text="確定" hint="點這裡繼續~"
@endnowait
@history output="true"
@s
;----------
*輸入完畢
;將輸入的名字使用commit保存下來，沒有這個指令的話輸入了也還是維持默認值
@commit
@er
;使用emb指令來在對話裡顯示變數的值
@主角
主角的姓氏是[emb exp=f.姓]，名字是[emb exp=f.名]。[w]
@fg layer="0" pos="center" storage="fg01_02"
@nvl娘 face="face01_02"
那麼，測試一下選擇吧。[w]
@clfg layer="0" clface="1"
;----------
;顯示選擇按鈕
@selstart hidemes="0" hidesysbutton="0"
@locate y="200" x="0"
@selbutton target="*選擇A" text="我要選擇A"
@locate y="300" x="0"
@selbutton target="*選擇B" text="我要選擇B"
@selend
;----------
*選擇A|路線一
@clsel
@bg storage="cg_01"
;登陸CG（記得也要在cglist.txt裡寫上對應CG名才能成功顯示）
@addcg storage="cg_01"
@npc id="路人甲"
你選擇了A。第一張CG現在可以在CG模式裡查看了。[w]
@bg storage="cg_01_a"
@addcg storage="cg_01_a"
@npc id="路人甲"
第一張CG的變化也被登陸了，現在在CG模式中點選第一張CG，會連續顯示兩張圖。[w]
@jump target="*合併"
;----------
*選擇B|路線二
@clsel
@bg storage="cg_02"
;登陸CG（記得也要在cglist.txt裡寫上對應CG名才能成功顯示）
@addcg storage="cg_02"
@npc id="路人甲"
你選擇了B。第二張CG現在可以在CG模式裡查看了。[w]
@jump target="*合併"
;----------
*合併
@npc id="路人甲"
不管選擇了A還是B，最後你都會看到這句話。[w]
@scr
試試另外一個樣式的對話框……[w]
你也可以切換文字的顏色。[l][font color=0xCCFFCC]比如這樣……[resetfont][lr][r]
改變[font size=30]大[font size=15]小[resetfont]也沒有問題喲。[w]
@dia
@npc id="路人甲"
現在換回來了……[w]
@npc id="路人甲"
地圖測試。[w]
@clfg layer="all"
@map storage="sample.map"
;----------
*地圖01|教室
@clmap
@bg storage="BG01a"
@dia
@主角
來到了教室。[w]
@call storage="endA.ks"
;呼叫結局事件A，當事件執行完之後就會返回這裡
@jump target="*地圖合併"
;----------
*地圖02|車上
@clmap
@bg storage="BG12a"
@dia
@主角
來到了車上。[w]
@call storage="endB.ks"
;呼叫結局事件B，當事件執行完之後就會返回這裡
@jump target="*地圖合併"
;----------
*地圖合併
@fg pos="center" storage="fg01_02"
@nvl娘 face="face01_02"
功能演示完畢。[lr]
更多內容請查看tutorial文件夾下的教程。[w]
@nvl娘 face="face01_01" fg="fg01_01"
準備好就返回標題了哦。[w]
;執行返回標題指令，返回到標題畫面
@gotostart ask="false"
