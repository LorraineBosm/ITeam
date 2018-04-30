# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Request.destroy_all
Agreement.destroy_all

DeviceModel.destroy_all
DeviceModel.reset_pk_sequence

DeviceBrand.destroy_all
DeviceBrand.reset_pk_sequence

DeviceType.destroy_all
DeviceType.reset_pk_sequence

DeviceType.create(name: 'Смартфон')
DeviceType.create(name: 'Фотоаппарат')
DeviceType.create(name: 'Планшет')

DeviceBrand.create(short_name: 'Samsung', full_name: 'Samsung Electronics Co., Ltd.', device_type_id: 1)
DeviceBrand.create(short_name: 'HTC', full_name: 'HTC Corporation', device_type_id: 1)
DeviceBrand.create(short_name: 'LG', full_name: 'LG Electronics', device_type_id: 1)

DeviceModel.create(name: 'Galaxy S9 Plus', code: 'SM-G965F/FD', device_brand_id: 1)
DeviceModel.create(name: 'Galaxy Note 8', code: 'SM-N950F/DS', device_brand_id: 1)
DeviceModel.create(name: 'Galaxy J3', code: 'SM-J330FZ', device_brand_id: 1)
DeviceModel.create(name: 'Desire 12', device_brand_id: 2)
DeviceModel.create(name: 'U Ultra', device_brand_id: 2)

