# 匿名チャットツール

技術検証用として作成しました。 

使用言語とフレームワークについて説明します。 

***

## 環境 

1. 言語 

* Ruby 2.5.3  

2. フレームワーク 

* Rails 5.2.3

*  [Vue](https://jp.vuejs.org/index.html)  
フロントエンドのフレームワークとして、実装コストが低く、フレームワークとしての実装ルールが緩いことから選定いたしました。

*  [Vuex](https://vuex.vuejs.org/ja/)  
フロントエンドのMVVMデザインパターン実現のため、採用しました。
コンポーネントとModelの分離を果たすことを目的としております。

*  [Vuetify](https://next.vuetifyjs.com/ja/)  
マテリアルデザインの実装に向けて、開発コスト削減とVueを用いた開発案件での選定率の高さから選択いたしました。

***

## 検証技術

 * WebSocket  
サーバを介してWebSocketによるサーバプッシュ技術習得のため、実装検証を行いました。

 * マテリアルデザイン  
 クライアント端末が多種多様なデバイスを想定する昨今での画面デザイン学習のため実装検証を行いました。

***

## サンプルアプリケーションのクラス構造について  

### フロントエンド  

* フォルダ構成について

```
app
 └── javascript
        └── packs
              └── components
              └── router
              └── store
```

1. components  
本アプリケーションのコンポーネント定義を格納しております。
アプリケーションの画面構成パーツは「○○.vue」という形式で保管しております。

2. router  
本アプリケーションの画面遷移URLを定義しております。

3. store  
本アプリケーションのフロントエンドのデータ層定義になります。

* エントリポイントおよびその他  

```
app
 └── javascript
        └── App.vue
        └── packs
              └── chat.js
              └── main_vue.js
```

1. App.vue  
本アプリケーションのメイン画面構成ファイルになります。

2. packs/chat.js  
チャットに使用するWebSocketの実行クラスになります。
WebSocket関連の煩雑処理はここに集約されます。

3. packs/main_vue.js  
画面展開時に最初に呼ばれるJavaScriptになります。
Vueの初期化ロジックはここに集約されます。

### サーバサイド  

* フォルダ構成について  

```
app
 └── models
 └── controllers
 └── channels
```

1. models  
アプリケーションのModel層になります。
本アプリケーションではAcitiveRecordと直結状態になります。
DB参照以上の実装は現バージョンでは含まれておりません。

2. controllers  
APIのロジック箇所になります。

3. channels  
チャンネルごとの実装クラスになります。

* API定義について  

```
config
 └── routes.rb
```

routes.rbにてサーバサイドのAPI実装となるコントローラーおよびWebSocketのAPIとURLの関連付けを実施しております。

## Docker  

開発環境向けDockerコンテナを用意しております。
以下にDocker起動用のファイル構成を明示します。  

```
/
└── docker-compose.yml
└── Dockerfile
└── entrypoint.sh
```

1. docker-compose.yml  
Dockerサービスの構成ファイル。
現バージョンではRuby+Railsのコンテナ起動のみ。
DBの分割、WebPackerの構成が入る予定。

2. Dockerfile  
コンテナ定義ファイル
Ruby+Railsの環境が構築されております。

3. entrypoint.sh  
コンテナ起動時のShellスクリプト。
異常終了時のpidファイル削除処理が記載されております。

### Dockerコマンド  

* Build  
コンテナをビルドしてDocker RegistryにPullします。

```
$ docker-compose build
```

* 起動

```
$ docker-compose up
```

* 不要コンテナ一括削除

```
$ docker rm $(docker ps -q -a)
```

* 不要イメージ一括削除

```
$ docker rmi $(docker images -q)
```
