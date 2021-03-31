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
Group.create!(
            manager_id: 2,
            name: "グループ2-2"
            )              