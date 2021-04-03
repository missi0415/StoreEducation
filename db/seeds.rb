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
            name: "グループ１－１"
            )
Group.create!(
            manager_id: 1,
            name: "グループ１－２"
            )  
Group.create!(
            manager_id: 2,
            name: "グループ2-1"
            )
Member.create!(
            group_id: 1,
            name: "グループ1のメンバー１",
            name_kana: "ふりがな",
            email: "member11@example.com",
            password: "password",
            phone_number: "00000000",
            is_deleted: false,
              )
Member.create!(
            group_id: 1,
            name: "グループ1のメンバー2",
            name_kana: "ふりがな",
             email: "member12@example.com",
            password: "password",
            phone_number: "00000000",
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

Ability.create!(
                member_id: 1,
                title: "接客",
                value: 5,
                )                             
Ability.create!(
                member_id: 1,
                title: "調理",
                value: 2,
                )                             
Ability.create!(
                member_id: 1,
                title: "人格",
                value: 4,
                )                             
Ability.create!(
                member_id: 1,
                title: "走力",
                value: 5,
                )                             