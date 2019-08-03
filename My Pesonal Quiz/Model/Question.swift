//
//  Question.swift
//  My Pesonal Quiz
//
//  Created by Vasilii on 03/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import Foundation

struct Quistion {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}


extension Quistion {
    //статичный метод можно вызывать из стуктуры без экземпляра
    static func getOuistion() -> [Quistion] {
        return [
            Quistion(
                text: "Какую пищу Вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковь", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtle)
                ]
            ),
            Quistion(
                text: "Что Вам нравится больше?",
                type: .muleplay,
                answers: [
                    Answer(text: "Плавать", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Обниматься", type: .rabbit),
                    Answer(text: "Есть", type: .turtle)
                ]
            ),
            Quistion(
                text: "Любите ли Вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(text: "Ненавижу", type: .dog),
                    Answer(text: "Нервничаю", type: .cat),
                    Answer(text: "Не замечаю", type: .rabbit),
                    Answer(text: "Обожаю", type: .turtle)
                ]
            ),
        ]
    }
}
