//
//  ErrorType.swift
//  GitFollowers
//
//  Created by Mahmoud on 12/06/2023.
//

import Foundation

enum ErrorType: String, Error {

        case invalidUsername = "This username create an invalid request. Please try again"
        case unableToComplete = "Unable to complete your request.Please check your internet connection"
        case invalidResponse = "Invalid response form the server. Please try again"
        case invalidData = "The data received from the server was invalid. Please try again"
        case noError = ""

}
