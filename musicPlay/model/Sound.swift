//
//  Sound.swift
//  soundProcess
//
//  Created by 范志勇 on 2022/7/11.
//

import Foundation

enum TypeOfSound: Int {
    case music = 1 // 音乐
    case noise = 2 // 噪音
    case voice = 3 // 人声
}

enum TypeOfMusic: Int {
    case vocalMusic = 1 // 声乐
    case instrumentalMusic = 2 // 器乐
    case scale = 3 // 音阶
}

// 存储在数据库
class Sound: Codable { // Codable，必须是简单类型
    var file : String? // 存储的声音文件名称，不含扩展名
    var ext : String? // 扩展名
    var name : String? // 声音名称，关注，列表
    var size : Int? // 文件大小
    var duration : Int? // 持续时间
    var time_create: Int? // 生成时间
    var type: Int? // 声音类型
    
    var note: String? // 内容说明，json格式
    
    var description : String {
        var str = ""
        str += "file: \(self.file ?? "")\n"
        str += "name: \(self.name ?? "")\n"
        str += "size: \(self.size ?? -1)\n"
        str += "duration: \(self.duration ?? -1)\n"
        str += "time_create: \(self.time_create ?? -1)\n"
        str += "type: \(self.type ?? -1)\n"

        return str
    }
    
}

extension Sound {
    static func createAllSounds() -> [Sound] {
        var allSounds = [Sound]()
        
        do {
            let sound = Sound()
            sound.file = "1 B大调"
            sound.ext = "aiff"
            sound.name = "1 B大调"
            sound.size = 1000
            sound.duration = 1000
            sound.size = 1000
            sound.type = 10001

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "2 g小调"
            sound.ext = "aiff"
            sound.name = "2 g小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "3 E大调"
            sound.ext = "aiff"
            sound.name = "3 E大调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "4 c小调"
            sound.ext = "aiff"
            sound.name = "4 c小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        // =============
        do {
            let sound = Sound()
            sound.file = "1 B大调"
            sound.ext = "aiff"
            sound.name = "1 B大调"
            sound.size = 1000
            sound.duration = 1000
            sound.size = 1000
            sound.type = 10001

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "2 g小调"
            sound.ext = "aiff"
            sound.name = "2 g小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "3 E大调"
            sound.ext = "aiff"
            sound.name = "3 E大调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "4 c小调"
            sound.ext = "aiff"
            sound.name = "4 c小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "1 B大调"
            sound.ext = "aiff"
            sound.name = "1 B大调"
            sound.size = 1000
            sound.duration = 1000
            sound.size = 1000
            sound.type = 10001

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "2 g小调"
            sound.ext = "aiff"
            sound.name = "2 g小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "3 E大调"
            sound.ext = "aiff"
            sound.name = "3 E大调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "4 c小调"
            sound.ext = "aiff"
            sound.name = "4 c小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "1 B大调"
            sound.ext = "aiff"
            sound.name = "1 B大调"
            sound.size = 1000
            sound.duration = 1000
            sound.size = 1000
            sound.type = 10001

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "2 g小调"
            sound.ext = "aiff"
            sound.name = "2 g小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "3 E大调"
            sound.ext = "aiff"
            sound.name = "3 E大调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        
        do {
            let sound = Sound()
            sound.file = "4 c小调"
            sound.ext = "aiff"
            sound.name = "4 c小调"
            sound.size = 2000
            sound.duration = 2000
            sound.size = 2000
            sound.type = 10003

            allSounds.append(sound)
        }
        return allSounds
    }
}
