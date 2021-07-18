//
//  StatusViewModel.swift
//  ChatApp
//
//  Created by Tri Pham on 7/18/21.
//

import Foundation

enum StatusViewModel: Int, CaseIterable {
    case notConfigured
    case available
    case busy
    case school
    case movies
    case work
    case batteryLow
    case meeting
    case gym
    case sleeping
    case urgentCallsOnly
    
    var title: String {
        switch self {
        case .notConfigured:
            return "Click here to update your status"
        case .available:
            return "Available"
        case .busy:
            return "Busy"
        case .school:
            return "At school"
        case .movies:
            return "At the movies"
        case .work:
            return "At work"
        case .batteryLow:
            return "Battery low"
        case .meeting:
            return "In a meeting"
        case .gym:
            return "At the gym"
        case .sleeping:
            return "Sleeping"
        case .urgentCallsOnly:
            return "Urgent calls only"
        }
    }
    
    
}
