# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.last

Warehouse.create(name: "runner1", latitude: "hhediie112", longtitude: "hhderfee3355",imei:"hccbbdioe2233", user_id: @user.id, time_in: "2017-08-24", time_out: "2017-08-24")
Warehouse.create(name: "runner2", latitude: "hhediie155", longtitude: "hhderfee433", imei:"hccbbdioe23443",user_id: @user.id, time_in: "2017-08-23", time_out: "2017-08-23")
Warehouse.create(name: "runner3", latitude: "hhediie1552", longtitude: "hhderfee77", imei:"hccbbdioe2999",user_id: @user.id, time_in: "2017-08-22", time_out: "2017-08-22")
Warehouse.create(name: "runner4", latitude: "hhediie442", longtitude: "hhderfee366", imei:"hccbbdioe22000",user_id: @user.id, time_in: "2017-08-21", time_out: "2017-08-21")
Warehouse.create(name: "runner5", latitude: "hhediie1166", longtitude: "hhderfee44", imei:"hccbbdioe233222",user_id: @user.id, time_in: "2017-08-20", time_out: "2017-08-20")
