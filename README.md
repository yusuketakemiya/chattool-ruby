 # 匿名チャチE��チE�Eル

技術検証用として作�Eしました、E

使用言語とフレームワークにつぁE��説明します、E

***
## 環墁E

1. 言誁E

* Ruby 2.5.3  

2. フレームワーク 

* Rails 5.2.3

*  [Vue](https://jp.vuejs.org/index.html)  
フロントエンド�Eフレームワークとして、実裁E��ストが低く、フレームワークとしての実裁E��ールが緩ぁE��とから選定いたしました、E
*  [Vuex](https://vuex.vuejs.org/ja/)  
フロントエンド�EMVVMチE��インパターン実現のため、採用しました、Eコンポ�EネントとModelの刁E��を果たすことを目皁E��しております、E
*  [Vuetify](https://next.vuetifyjs.com/ja/)  
マテリアルチE��インの実裁E��向けて、E��発コスト削減とVueを用ぁE��開発案件での選定率の高さから選択いたしました、E
***
## 検証技衁E * WebSocket  
サーバを介してWebSocketによるサーバ�EチE��ュ技術習得�Eため、実裁E��証を行いました、E
 * マテリアルチE��イン  
 クライアント端末が多種多様なチE��イスを想定する昨今での画面チE��イン学習�Eため実裁E��証を行いました、E
***
## サンプルアプリケーションのクラス構造につぁE��  
### フロントエンチE 

* フォルダ構�EにつぁE��
```
app
 └── javascript
        └── packs
              └── components
              └── router
              └── store
```

1. components  
本アプリケーションのコンポ�Eネント定義を格納しております、Eアプリケーションの画面構�Eパ�EチE�E「○◁Evue」とぁE��形式で保管しております、E
2. router  
本アプリケーションの画面遷移URLを定義しております、E
3. store  
本アプリケーションのフロントエンド�EチE�Eタ層定義になります、E
- エントリポイントおよ�Eそ�E仁E 
```
app
 └── javascript
        └── App.vue
        └── packs
              └── chat.js
              └── main_vue.js
```

1. App.vue  
本アプリケーションのメイン画面構�Eファイルになります、E
2. packs/chat.js  
チャチE��に使用するWebSocketの実行クラスになります、EWebSocket関連の煩雑�E琁E�Eここに雁E��E��れます、E
3. packs/main_vue.js  
画面展開時に最初に呼ばれるJavaScriptになります、EVueの初期化ロジチE��はここに雁E��E��れます、E
### サーバサイチE 

* フォルダ構�EにつぁE��
```
app
 └── models
 └── controllers
 └── channels
```

1. models  
アプリケーションのModel層になります、E本アプリケーションではAcitiveRecordと直結状態になります、EDB参�E以上�E実裁E�E現バ�Eジョンでは含まれておりません、E
2. controllers  
APIのロジチE��箁E��になります、E
3. channels  
チャンネルごとの実裁E��ラスになります、E
* API定義につぁE��  

```
config
 └── routes.rb
```
routes.rbにてサーバサイド�EAPI実裁E��なるコントローラーおよびWebSocketのAPIとURLの関連付けを実施しております、E
