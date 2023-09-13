## fluentd_send_log_bigquery

fluentdのログをbigqueryに送るためのサンプルです。

## 使い方

Google Cloudのプロジェクト作成、データセット作成、テーブル作成、サービスアカウントと権限設定は前もって行ってください。
また、Rubyのインストールも前もって行ってください。

### 1. このリポジトリをfork

```sh
git clone git@github.com:Umekawa/fluentd_send_log_bigquery.git
```

### 2. .envを埋める

.env.sampleをコピーして、.envを作成してください。

```sh
cp .env.sample .env
```

その後、.envに必要な情報を埋めてください。
必要な情報は、下記になります。

- PROJECT_ID: Google CloudのプロジェクトID
- LOCATION: データセットが存在するロケーション
- DATASET: ログを入れるテーブルが存在するデータセット
- TABLE: ログを入れるテーブル
- JSON_KEY_FILENAME: サービスアカウントのjson鍵ファイル名
  - サービスアカウントのjson鍵ファイルは、このリポジトリのprivate_keysフォルダに置いてください。

### 3. fluent.confの作成

fluentdの設定ファイルを作成します。
まずbundle installで必要なgemをインストールします。

```sh
bundle install
```

その後、fluent.confを作成するrakeタスクを実行します。実行すると、.envの内容を読み取ってfluent.confをconfigファイル下に作成します。

```sh
bundle exec rake create_conf
```

### 4. コンテナの起動

```sh
docker compose build
```
```sh
docker compose up -d
```

### 5. アクセスする

curl localhost:24224
