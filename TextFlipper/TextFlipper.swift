//
//  TextFlipper.swift
//  TextFlipper
//
//  Created by Landon Hughes on 3/24/22.
//

import Foundation

struct TextFlipper {
    //Credit goes to @jasny for the ASCII table
    //https://gist.github.com/jasny/9807617
    
    private static let table: [String: String] =
    [
        "a": "\u{0250}",
        "b": "q",
        "c": "\u{0254}",
        "d": "p",
        "e": "\u{01DD}",
        "f": "\u{025f}",
        "g": "\u{0183}",
        "h": "\u{0265}",
        "i" : "\u{0131}",
        "j" : "\u{027E}",
        "k": "\u{029E}",
        "l" : "\u{0283}",
        "m" : "\u{026F}",
        "n": "u",
        "o": "o",
        "p": "d",
        "r" : "\u{0279}",
        "s": "s",
        "t" : "\u{0287}",
        "u": "n",
        "v": "\u{028C}",
        "w" : "\u{028D}",
        "x" : "x",
        "y" : "\u{028E}",
        "z": "z",
        "." : "\u{02D9}",
        "[" : "]",
        "(" : ")",
        "{" : "}",
        "?" : "\u{00BF}",
        "!" : "\u{00A1}",
        //comma
        "\'" : ",",
        "<" : ">",
        "_" : "\u{203E}",
        "\u{203F}" : "\u{2040}",
        "\u{2045}" : "\u{2046}",
        "\u{2234}" : "\u{2235}",
        "\r" : "\n",
        " ": " "
    ]
    
    static func invertText(sentence: String?) -> String? {
        guard let sentence = sentence?.lowercased() else { return nil }
        if sentence.isEmpty { return nil }
        
        var invertedCharacters = [String]()
        
        var i = 0;
        while(i < sentence.count ) {
            let character = String(sentence[i])
            if let invertedCharacter = table[character] {
                invertedCharacters.append(invertedCharacter)
            }
            i += 1
        }
        
        let reversedInvertedSentence = invertedCharacters.reversed()
        let upsideDownSentence = reversedInvertedSentence.joined(separator: "")
        return upsideDownSentence
    }
    
    
}
