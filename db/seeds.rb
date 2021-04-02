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
            email: "member11@example.com",
            password: "password",
            phone_number: 00000000,
            is_deleted: false,
              )
Member.create!(
            group_id: 1,
            name: "グループ1のメンバー2",
             email: "member12@example.com",
            password: "password",
            phone_number: 00000000,
            is_deleted: false,
              )              
Member.create!(
            group_id: 2,
            name: "グループ2のメンバー１",
             email: "member21@example.com",
            password: "password",
            phone_number: 00000000,
            is_deleted: false,
              )
Member.create!(
            group_id: 2,
            name: "グループ2のメンバー2",
            email: "member22@example.com",
            password: "password",
            phone_number: 00000000,
            is_deleted: false,
              )
