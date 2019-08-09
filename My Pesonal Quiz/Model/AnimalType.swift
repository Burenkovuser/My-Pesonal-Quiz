//
//  AnimalType.swift
//  My Pesonal Quiz
//
//  Created by Vasilii on 03/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

enum AmimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые Вам нравятся и всегда готовы помочь"
        case .cat:
            return "Вы себе на уме, любите гулять сами по себею Вы цените одиночество"
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила в мудрости. Медленный и вдумчивый выигрывает на дальних дистанциях"
        }
    }
}
