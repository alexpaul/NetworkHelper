//
//  Joke.swift
//  NetworkHelper
//
//  Created by Alex Paul on 12/6/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

// Encodable is encoding data to send to a web API
// Decodable is decoding JSON or other data from the web

// together they are packages as an alias known as Codable

struct Joke: Decodable {
  let id: Int
  let type: String
  let setup: String
  let punchline: String
}
