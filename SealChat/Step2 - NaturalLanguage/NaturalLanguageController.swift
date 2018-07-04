//
//  NaturalLanguageController.swift
//  SealChat
//
//  Created by Roy Marmelstein on 2018-07-01.
//  Copyright © 2018 Roy Marmelstein. All rights reserved.
//

import Foundation
import NaturalLanguage
import UIKit

class NaturalLanguageController {

    func extractNames(from sentence: String) -> [String] {
        // Use NLTagger to return an array of names
        return [String]()
    }

    func extractSentiment(sentence: String) -> String {
        // Use MLModel to do a sentiment analysis
        return "0"
    }

    func sealImage(sentence: String) -> UIImage? {
        // Get names
        //let names = extractNames(from: sentence)
        // Switch on names to return one of the asset seal images
        return nil
    }
}
