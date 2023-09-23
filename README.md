## usersテーブル

|Column    |Type    |Options                   |
|----------|--------|--------------------------|
|nickname  |string  |null: false, unique: true |
|email     |string  |null: false               |
|password  |string  |null: false               |
|name      |string  |null: false               |
|name_kana |string  |null: false               |
|birthday  |integer |null: false               |


### Association
- has_many :items
- has_many :buy_records


### itemsテーブル

|Column          |Type    |Options     |
|----------------|--------|------------|
|product_name    |string  |null: false |
|explanation     |text    |null: false |
|category        |string  |null: false |
|condition       |text    |null: false |
|postage         |string  |null: false |
|shipping_source |text    |null: false |
|shipping_day    |string  |null: false |
|price           |integer |null: false |


### Association
- belongs_to :user
- has_one :buy_record

## buy_recordテーブル

|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|user  |references |null: false, foreign_key: true |
|item  |references |null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses


## addressesテーブル

|Column         |Type    |Options     |
|---------------|--------|------------|
|post_code      |integer |null: false |
|prefectures    |string  |null: false |
|municipalities |string  |null: false |
|street_address |text    |null: false |
|building       |text    |            |
|phone_number   |integer |null: false |


### Association
- belongs_to :buy_record