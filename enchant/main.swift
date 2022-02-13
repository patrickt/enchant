//
//  main.swift
//  enchant
//
//  Created by Patrick Thomson on 2/13/22.
//

import Foundation
import AppKit

let spellChecker = NSSpellChecker.shared

while true {
    print("word: ", terminator: "")
    if let input = readLine(strippingNewline: true) {
        if !input.isEmpty {
            let found = spellChecker.checkSpelling(of: input, startingAt: 0, language: nil, wrap: false, inSpellDocumentWithTag: 0, wordCount: nil)
            if found.location != NSNotFound {
                if let guesses = spellChecker.guesses(forWordRange: found, in: input, language: nil, inSpellDocumentWithTag: 0) {
                    if guesses.isEmpty {
                        print("not found")
                    } else {
                        print("how about:", guesses.joined(separator: ", "))
                    }
                } else {
                    print("not found")
                }
            } else {
                print("ok")
            }
            print("")
        }
    } else {
        break
    }
}
