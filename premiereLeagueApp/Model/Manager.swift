//
//  Manager.swift
//  premiereLeagueApp
//
//  Created by Kaua Miguel on 18/09/23.
//

import Foundation

enum JobType : String{
    case manager = "Manager"
    case headCoach = "Hear Coach"
}

struct Manager{
    let name:String
    let job : JobType
}
