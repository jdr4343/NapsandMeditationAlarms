//
//  InformationSetting.swift
//  FirstToyProject
//
//  Created by 신지훈 on 2021/07/02.
//

import Foundation

enum CellType: String {
    case action
    case disclosure
    case `switch`
    case checkmark
}

class PhotoSettingItem {
    init(type: CellType, title: String, on: Bool = false, imageName: String? = nil) {
        self.type = type
        self.title = title
        self.on = on
    self.imageName = imageName
    }

    let type: CellType
    let title: String
    var on: Bool
    var imageName: String?
    }

class PhotoSettingSection {
    init(items: [PhotoSettingItem], header: String? = nil, footer: String? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
    let items: [PhotoSettingItem]
    var header: String?
    var footer: String?
}
