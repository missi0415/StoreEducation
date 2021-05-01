Manager.create!(
              email: "manager@example.com",
              password: "password",
              )
Manager.create!(
              email: "manager2@example.com",
              password: "password",
              )              
              
Group.create!(
            manager_id: 1,
            name: "〇〇店　1号店"
            )
Group.create!(
            manager_id: 1,
            name: "〇〇店　2号店"
            )  
Group.create!(
            manager_id: 1,
            name: "〇〇店　3号店"
            )  
Group.create!(
            manager_id: 1,
            name: "〇〇店　4号店"
            )  
Group.create!(
            manager_id: 2,
            name: "グループ2-1"
            )
Member.create!(
            group_id: 1,
            name: "田中 太郎",
            name_kana: "たなか たろう",
            email: "member01@example.com",
            password: "password",
            phone_number: "00000000001",
            is_deleted: false,
              )
Member.create!(
            group_id: 1,
            name: "鈴木 次郎",
            name_kana: "すずき じろう",
            email: "member02@example.com",
            password: "password",
            phone_number: "00000000002",
            is_deleted: false,
              )              
Member.create!(
            group_id: 1,
            name: "阿部 晃",
            name_kana: "あべ あきら",
            email: "member03@example.com",
            password: "password",
            phone_number: "00000000003",
            is_deleted: false,
              )              
Member.create!(
            group_id: 1,
            name: "鈴木 紋子",
            name_kana: "すずき あやこ",
            email: "member04@example.com",
            password: "password",
            phone_number: "00000000004",
            is_deleted: false,
              )              
Member.create!(
            group_id: 1,
            name: "川崎 はるか",
            name_kana: "かわさき はるか",
            email: "member05@example.com",
            password: "password",
            phone_number: "00000000005",
            is_deleted: false,
              )              
Member.create!(
            group_id: 1,
            name: "高岡 茜",
            name_kana: "たかおか あかね",
            email: "member06@example.com",
            password: "password",
            phone_number: "00000000006",
            is_deleted: false,
              )              
Member.create!(
            group_id: 1,
            name: "坂本 真",
            name_kana: "さかもと まこと",
            email: "member07@example.com",
            password: "password",
            phone_number: "00000000007",
            is_deleted: false,
              )              
Member.create!(
            group_id: 1,
            name: "石井 茂樹",
            name_kana: "いしい しげき",
            email: "member08@example.com",
            password: "password",
            phone_number: "00000000008",
            is_deleted: false,
              )              
Member.create!(
            group_id: 2,
            name: "グループ2のメンバー１",
            name_kana: "ふりがな",
            email: "member21@example.com",
            password: "password",
            phone_number: "00000000",
            is_deleted: false,
              )
Member.create!(
            group_id: 2,
            name: "グループ2のメンバー2",
            name_kana: "ふりがな",
            email: "member22@example.com",
            password: "password",
            phone_number: "00000000",
            is_deleted: false,
              )
Education.create!(
                  member_id: 1,
                  title: "接客用語教育",
                  body: "34ページから",
                  progress: 50
                  )              
Education.create!(
                  member_id: 1,
                  title: "用語教育",
                  body: "マニュアル用語P40から",
                  progress: 20
                  )              
Education.create!(
                  member_id: 2,
                  title: "接客用語教育",
                  body: "34ページから",
                  progress: 50
                  )              
Education.create!(
                  member_id: 2,
                  title: "用語教育",
                  body: "マニュアル用語P40から",
                  progress: 20
                  )
                  
Task.create!(
                  member_id: 1,
                  title: "接客用語暗記",
                  body: "34ページから",
                  start_on: "2021-04-11",
                  end_on: "2021-04-15",
                  member_body: "完了しました。確認お願いいたします",
                  member_status: 2,
                  manager_status: 0,
                  progress: 50
                  )              
Task.create!(
                  member_id: 1,
                  title: "調理マニュアル",
                  body: "15ページから",
                  start_on: "2021-04-11",
                  end_on: "2021-04-15",
                  member_body: "26ページまで進んでいます",
                  member_status: 1,
                  manager_status: 0,
                  progress: 50
                  )              
Task.create!(
                  member_id: 2,
                  title: "接客用語暗記",
                  body: "34ページから",
                  start_on: "2021-04-11",
                  end_on: "2021-04-15",
                  member_body: "完了しました。確認お願いいたします",
                  member_status: 2,
                  manager_status: 0,
                  progress: 50
                  )              
Task.create!(
                  member_id: 2,
                  title: "調理マニュアル",
                  body: "12ページから",
                  start_on: "2021-04-11",
                  end_on: "2021-04-15",
                  member_body: "わからない単語があるので後日相談します",
                  member_status: 1,
                  manager_status: 0,
                  progress: 50
                  )              
Task.create!(
                  member_id: 3,
                  title: "接客用語暗記",
                  body: "34ページから",
                  start_on: "2021-04-11",
                  end_on: "2021-04-15",
                  member_body: "完了しました。確認お願いいたします",
                  member_status: 2,
                  manager_status: 0,
                  progress: 50
                  )              
AbilityTitle.create!(
                group_id:1,
                title: "接客"
                    )
AbilityTitle.create!(
                group_id:1,
                title: "調理"
                    )
AbilityTitle.create!(
                group_id:1,
                title: "清掃"
                    )
AbilityTitle.create!(
                group_id:1,
                title: "モラル"
                    )
AbilityTitle.create!(
                group_id:1,
                title: "労務管理"
                    )
Ability.create!(
                member_id: 1,
                ability_title_id: 1,
                value: 5,
                )                             
Ability.create!(
                member_id: 1,
                ability_title_id: 2,
                value: 5,
                )                             
Ability.create!(
                member_id: 1,
                ability_title_id: 3,
                value: 2,
                )                             
Ability.create!(
                member_id: 1,
                ability_title_id: 4,
                value: 3,
                )                             
Ability.create!(
                member_id: 1,
                ability_title_id: 5,
                value: 4,
                )                             
Ability.create!(
                member_id: 2,
                ability_title_id: 1,
                value: 5,
                )                             
Ability.create!(
                member_id: 2,
                ability_title_id: 2,
                value: 5,
                )                             
Ability.create!(
                member_id: 2,
                ability_title_id: 3,
                value: 5,
                )                             
Ability.create!(
                member_id: 2,
                ability_title_id: 4,
                value: 4,
                )                             
Ability.create!(
                member_id: 2,
                ability_title_id: 5,
                value: 3,
                )                             
Ability.create!(
                member_id: 3,
                ability_title_id: 1,
                value: 2,
                )                             
Ability.create!(
                member_id: 3,
                ability_title_id: 2,
                value: 5,
                )                             
Ability.create!(
                member_id: 3,
                ability_title_id: 3,
                value: 4,
                )                             
Ability.create!(
                member_id: 3,
                ability_title_id: 4,
                value: 4,
                )                             
Ability.create!(
                member_id: 3,
                ability_title_id: 5,
                value: 4,
                )                             
Ability.create!(
                member_id: 4,
                ability_title_id: 1,
                value: 4,
                )                             
Ability.create!(
                member_id: 4,
                ability_title_id: 2,
                value: 5,
                )                             
Ability.create!(
                member_id: 4,
                ability_title_id: 3,
                value: 2,
                )                             
Ability.create!(
                member_id: 4,
                ability_title_id: 4,
                value: 5,
                )                             
Ability.create!(
                member_id: 4,
                ability_title_id: 5,
                value: 4,
                )                             
Ability.create!(
                member_id: 5,
                ability_title_id: 1,
                value: 4,
                )                             
Ability.create!(
                member_id: 5,
                ability_title_id: 2,
                value: 5,
                )                             
Ability.create!(
                member_id: 5,
                ability_title_id: 3,
                value: 2,
                )                             
Ability.create!(
                member_id: 5,
                ability_title_id: 4,
                value: 5,
                )                             
Ability.create!(
                member_id: 5,
                ability_title_id: 5,
                value: 4,
                )                             
Ability.create!(
                member_id: 6,
                ability_title_id: 1,
                value: 4,
                )                             
Ability.create!(
                member_id: 6,
                ability_title_id: 2,
                value: 1,
                )                             
Ability.create!(
                member_id: 6,
                ability_title_id: 3,
                value: 2,
                )                             
Ability.create!(
                member_id: 6,
                ability_title_id: 4,
                value: 1,
                )                             
Ability.create!(
                member_id: 6,
                ability_title_id: 5,
                value: 4,
                )                             
Ability.create!(
                member_id: 7,
                ability_title_id: 1,
                value: 2,
                )                             
Ability.create!(
                member_id: 7,
                ability_title_id: 2,
                value: 3,
                )                             
Ability.create!(
                member_id: 7,
                ability_title_id: 3,
                value: 1,
                )                             
Ability.create!(
                member_id: 7,
                ability_title_id: 4,
                value: 4,
                )                             
Ability.create!(
                member_id: 7,
                ability_title_id: 5,
                value: 3,
                )                             
Ability.create!(
                member_id: 8,
                ability_title_id: 1,
                value: 4,
                )                             
Ability.create!(
                member_id: 8,
                ability_title_id: 2,
                value: 5,
                )                             
Ability.create!(
                member_id: 8,
                ability_title_id: 3,
                value: 5,
                )                             
Ability.create!(
                member_id: 8,
                ability_title_id: 4,
                value: 4,
                )                             
Ability.create!(
                member_id: 8,
                ability_title_id: 5,
                value: 3,
                )                             
                          
            
                