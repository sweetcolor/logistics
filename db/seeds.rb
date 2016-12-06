# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cargoes = Array.new
destinations = Array.new
cargoes << Cargo.create(name: 'Хліб')
cargoes << Cargo.create([{ name: 'Молоко' }])
destinations << Destination.create([{ name: 'Магазин Молока' }, { capacity: 100 }, { current_quantity: 10 },
                                    { cargo_id: cargoes[-1].first }])
destinations << Destination.create([{ name: 'Склад Молока' }, { capacity: 200 }, { current_quantity: 200 },
                                    { cargo_id: cargoes[-1].first }])

cargoes << Cargo.create([{name: 'Масло'}])
destinations << Destination.create([{ name: 'Магазин Масла 1' }, { capacity: 100 }, { current_quantity: 80 },
                                    { cargo_id: cargoes[-1] }])
destinations << Destination.create([{name: 'Магазин Масла 2'}, {capacity: 70}, {current_quantity: 40}, {cargo_id: cargoes[-1].first }])
destinations << Destination.create([{name: 'Магазин Масла 3'}, {capacity: 170}, {current_quantity: 100}, {cargo_id: cargoes[-1].first}])
destinations << Destination.create([{ name: 'Магазин Масла 4' }, { capacity: 60 }, { current_quantity: 20 }, { cargo_id: cargoes[-1].first }])
destinations << Destination.create([{ name: 'Магазин Масла 5' }, { capacity: 120 }, { current_quantity: 120 }, { cargo_id: cargoes[-1].first }])
destinations << Destination.create([{ name: 'Магазин Масла 6' }, { capacity: 110 }, { current_quantity: 60 }, { cargo_id: cargoes[-1].first }])
destinations << Destination.create([{ name: 'Склад Масла 1'}, {capacity: 100}, {current_quantity: 100}, {cargo_id: cargoes[-1].first}])
destinations << Destination.create([{ name: 'Склад Масла 2'}, {capacity: 150}, {current_quantity: 150}, {cargo_id: cargoes[-1].first}])
destinations << Destination.create([{ name: 'Склад Масла 3'}, {capacity: 250}, {current_quantity: 250}, {cargo_id: cargoes[-1].first}])
destinations << Destination.create([{ name: 'Склад Масла 4'}, {capacity: 190}, {current_quantity: 190}, {cargo_id: cargoes[-1].first}])
destinations << Destination.create([{ name: 'Склад Масла 5'}, {capacity: 180}, {current_quantity: 180}, {cargo_id: cargoes[-1].first}])

# cargoes << Cargo.create(name: 'Сир')
# destinations << Destination.create(name: 'Магазин Сиру', capacity: 90, cargo_id: cargoes[-1])
# destinations << Destination.create(name: 'Склад Сиру', capacity: 80, cargo_id: cargoes[-1])
#
# cargoes << Cargo.create(name: 'Сметана')
# destinations << Destination.create(name: 'Магазин Сметани', capacity: 100, cargo_id: cargoes[-1])
# destinations << Destination.create(name: 'Склад Сметани', capacity: 100, cargo_id: cargoes[-1])
#
# cargoes << Cargo.create(name: 'Йогурт')
# cargoes << Cargo.create(name: 'Творог')
# destinations << Destination.create(name: 'Магазин Творогу', capacity: 100, cargo_id: cargoes[-1])
# destinations << Destination.create(name: 'Склад Творогу', capacity: 100, cargo_id: cargoes[-1])
#
# cargoes << Cargo.create(name: 'Сир плавлений')
# destinations << Destination.create(name: 'Магазин Сиру плавленого 1', capacity: 100, cargo_id: cargoes[-1])
# destinations << Destination.create(name: 'Магазин Сиру плавленого 2', capacity: 100, cargo_id: cargoes[-1])
# destinations << Destination.create(name: 'Склад Сиру плавленого 2', capacity: 100, cargo_id: cargoes[-1])
# destinations << Destination.create(name: 'Склад Сиру плавленого 2', capacity: 100, cargo_id: cargoes[-1])
#
