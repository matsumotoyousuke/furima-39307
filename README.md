## usersテーブル

|Column             |Type    |Options                   |
|-------------------|--------|--------------------------|
|nickname           |string  |null: false               |
|email              |string  |null: false, unique: true |
|encrypted_password |string  |null: false               |
|family_name        |string  |null: false               |
|first_name         |string  |null: false               |
|family_name_kana   |string  |null: false               |
|first_name_kana    |string  |null: false               |
|birthday           |date    |null: false               |


### Association
- has_many :items
- has_many :buy_records


### itemsテーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|product_name       |string     |null: false                    |
|explanation        |text       |null: false                    |
|category_id        |integer    |null: false                    |
|condition_id       |integer    |null: false                    |
|postage_id         |integer    |null: false                    |
|shipping_source_id |integer    |null: false                    |
|shipping_day_id    |integer    |null: false                    |
|price              |integer    |null: false                    |
|user               |references |null: false, foreign_key: true |


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
- has_one :address


## addressesテーブル

|Column             |Type    |Options     |
|-------------------|--------|------------|
|post_code          |string  |null: false |
|shipping_source_id |integer |null: false |
|municipalities     |string  |null: false |
|street_address     |string  |null: false |
|building           |string  |            |
|phone_number       |string  |null: false |


### Association
- belongs_to :buy_record