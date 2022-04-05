//
//  DictionaryCodes.swift
//  BBVK
//
//  Created by Saúl Pérez on 01/04/22.
//

import Foundation

let CountryDictionary = ["AF":"93","AR":"54","AU":"61","AT":"43","BE":"32","CL":"56","CN":"86","CX":"61","MX":"52"].map { key, value in
    "+\(value) \(key)"
}
