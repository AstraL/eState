class Control::LocationController < ApplicationController
		before_action :ria_api

		def locations
				@regions = Region.all

				District.create!([
						                 {city_id: 10, area_id: 101, name: "Академгородок", level: 4, parent_area_id: 15186},
						                 {city_id: 10, area_id: 102, name: "Беличи", level: 4, parent_area_id: 15186},
						                 {city_id: 10, area_id: 103, name: "Березняки", level: 4, parent_area_id: 15182},
						                 {city_id: 10, area_id: 104, name: "Бортничи", level: 4, parent_area_id: 15181},
						                 {city_id: 10, area_id: 105, name: "Борщаговка", level: 4, parent_area_id: 15186},
						                 {city_id: 10, area_id: 106, name: "Ветряные Горы", level: 4, parent_area_id: 15188},
						                 {city_id: 10, area_id: 107, name: "Виноградарь", level: 4, parent_area_id: 15188},
						                 {city_id: 10, area_id: 108, name: "Воскресенка", level: 4, parent_area_id: 15182},
						                 {city_id: 10, area_id: 109, name: "Галаганы", level: 4, parent_area_id: 15186},
						                 {city_id: 10, area_id: 110, name: "Голосеево", level: 4, parent_area_id: 15184},
						                 {city_id: 10, area_id: 111, name: "ДВРЗ", level: 4, parent_area_id: 15182},
						                 {city_id: 10, area_id: 112, name: "Комсомольский", level: 4, parent_area_id: 15182},
						                 {city_id: 10, area_id: 113, name: "Кудрявец", level: 4, parent_area_id: 15190},
						                 {city_id: 10, area_id: 114, name: "Куреневка", level: 4, parent_area_id: 15187},
						                 {city_id: 10, area_id: 115, name: "Левобережный массив", level: 4, parent_area_id: 15182},
						                 {city_id: 10, area_id: 116, name: "Лесной", level: 4, parent_area_id: 15183},
						                 {city_id: 10, area_id: 117, name: "Липки", level: 4, parent_area_id: 15189},
						                 {city_id: 10, area_id: 118, name: "Лукьяновка", level: 4, parent_area_id: 15190},
						                 {city_id: 10, area_id: 119, name: "Минский", level: 4, parent_area_id: 15187},
						                 {city_id: 10, area_id: 120, name: "Мостицкий массив", level: 4, parent_area_id: 15188},
						                 {city_id: 10, area_id: 121, name: "Нивки", level: 4, parent_area_id: 15190},
						                 {city_id: 10, area_id: 122, name: "Новое строение", level: 4, parent_area_id: 15190},
						                 {city_id: 10, area_id: 123, name: "Оболонь", level: 4, parent_area_id: 15187},
						                 {city_id: 10, area_id: 124, name: "Осокорки", level: 4, parent_area_id: 15181},
						                 {city_id: 10, area_id: 125, name: "Отрадный", level: 4, parent_area_id: 15185},
						                 {city_id: 10, area_id: 126, name: "Печерск", level: 4, parent_area_id: 15189},
						                 {city_id: 10, area_id: 127, name: "Подол", level: 4, parent_area_id: 15188},
						                 {city_id: 10, area_id: 128, name: "Позняки", level: 4, parent_area_id: 15181},
						                 {city_id: 10, area_id: 129, name: "Пуща-Водица", level: 4, parent_area_id: 15187},
						                 {city_id: 10, area_id: 130, name: "Русановка", level: 4, parent_area_id: 15182},
						                 {city_id: 10, area_id: 131, name: "Саперная Слободка", level: 4, parent_area_id: 15184},
						                 {city_id: 10, area_id: 132, name: "Святошино", level: 4, parent_area_id: 15186},
						                 {city_id: 10, area_id: 133, name: "Соломенка", level: 4, parent_area_id: 15185},
						                 {city_id: 10, area_id: 134, name: "Соцгород", level: 4, parent_area_id: 15182},
						                 {city_id: 10, area_id: 135, name: "Старый Киев", level: 4, parent_area_id: 15190},
						                 {city_id: 10, area_id: 136, name: "Сырец", level: 4, parent_area_id: 15190},
						                 {city_id: 10, area_id: 137, name: "Татарка", level: 4, parent_area_id: 15190},
						                 {city_id: 10, area_id: 138, name: "Теремки", level: 4, parent_area_id: 15184},
						                 {city_id: 10, area_id: 139, name: "Троещина", level: 4, parent_area_id: 15183},
						                 {city_id: 10, area_id: 140, name: "Харьковский", level: 4, parent_area_id: 15181},
						                 {city_id: 10, area_id: 141, name: "Чёрная гора", level: 4, parent_area_id: 15189},
						                 {city_id: 10, area_id: 142, name: "Шулявка", level: 4, parent_area_id: 15190}
				                 ])
		end


		private

		def ria_api
				@api_key = 'UQ0Z5cO1zsRi9MMTJzW81qwPxkKBarVdbbVWeiMJ'
		end

		def region_params
				params.require(:region).permit(:name, :state_id, :translit, :declension, :region_center, :center_declension)
		end
end
