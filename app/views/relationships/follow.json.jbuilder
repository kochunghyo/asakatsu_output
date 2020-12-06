json.count Relationship.where(following_id: @user.id).count
json.flag @flag