;------------------------------------------------------------
;對應默認標題畫面的腳本，界面編輯的修改都會在這裡體現出來
;總之不知道是做什麼用的話請不要編輯這裡，編輯默認標題界面就夠了
;------------------------------------------------------------
*start
[iscript]

	if (sf.通關==true)	//二周目的情況
	{
		f.config_title=Scripts.evalStorage("uititle_omake.tjs");
	}
	else	//一周目的情況
	{
		f.config_title=Scripts.evalStorage("uititle.tjs");
	}

[endscript]

@bg time="500" storage="nvl_logo"
@wait time="500" canskip="true"

;------------------------------------------------------------
;遊戲組LOGO、背景音樂等處理
;------------------------------------------------------------
*logo
;可在標題畫面「小組標誌」一欄處修改這裡的遊戲組LOGO圖
@bg time="500" storage=&"f.config_title.logo"
;背景音樂
@fadeinbgm time="1000" storage=&"f.config_title.bgm"
;粒子效果
@raininit cond="f.config_title.rain==true"
@snowinit cond="f.config_title.snow==true"
@sakurainit cond="f.config_title.sakura==true"
@momijiinit cond="f.config_title.momiji==true"
@oldmovieinit cond="f.config_title.movie==true"
@fireflyinit cond="f.config_title.firefly==true"
;等待
@wait canskip="1" time="500"
;切黑屏
@bg time="1000" storage="black"
;------------------------------------------------------------
;顯示標題畫面和按鈕（帶有漸變切換效果）
;------------------------------------------------------------
*title
;停止其他一切切換效果
@stoptrans

@backlay
;背景圖片
@image left="0" visible="true" page="back" layer="stage" top="0" storage=&"f.config_title.bgd"
;前景圖片
@image left="0" visible="true" page="back" layer="8" top="0" storage=&"f.config_title.front" cond="f.config_title.front!=void"
;消息層歸位
@frame page="back"
@current layer="message0" page="back"
;顯示標題按鈕
@button_title
;可在這裡修改切換效果
@trans time="500" method="crossfade"
@wt
@s
;------------------------------------------------------------
;標題畫面（從其他界面返回時，不帶有漸變切換效果）
;------------------------------------------------------------
*刷新畫面
@current layer="message0" page="fore"
@er
@button_title
@s
;------------------------------------------------------------
*開始遊戲
@fadeoutbgm time="1000"
;清除粒子效果
@rainuninit
@snowuninit
@sakurauninit
@momijiuninit
@oldmovieuninit
@fireflyuninit
;清除標題畫面
@backlay
@freeimage layer="stage" page="back"
@freeimage layer="8" page="back"
@current layer="message0" page="back"
@er
@trans time="200" method="crossfade"
@wt
@current layer="message0" page="fore"
;鑒於很多人自己不知道打開歷史記錄，所以加上默認這條，不爽的自己關掉吧
@history output="true"
@hr
@jump storage="prelogue.ks"
;------------------------------------------------------------
*讀取進度
@call storage="load.ks"
@jump target="*刷新畫面" storage="title.ks"
;------------------------------------------------------------
*CG模式
@call storage="cgmode.ks"
@jump target="*刷新畫面" storage="title.ks"
;------------------------------------------------------------
*自定選單
;可以在這裡呼叫自製選單，例如音樂鑒賞、劇情回放等
@call storage="title_other.ks"
;改成下面這行，直接調用音樂鑒賞
;@call storage="bgmmode.ks"
;改成下面這行，直接調用結局鑒賞
;@call storage="endmode.ks"
@jump target="*刷新畫面" storage="title.ks"
;------------------------------------------------------------
*系統設定
@call storage="option.ks"
@jump target="*刷新畫面" storage="title.ks"
;------------------------------------------------------------
*離開遊戲
@fadeoutbgm time="1500"
@backlay
@freeimage layer="stage" page="back"
@freeimage layer="8" page="back"
@current layer="message0" page="back"
@er
;可在這裡修改切換效果
@trans time="1500" rule="00" method="universal"
@wt
@close ask="false"
;------------------------------------------------------------

