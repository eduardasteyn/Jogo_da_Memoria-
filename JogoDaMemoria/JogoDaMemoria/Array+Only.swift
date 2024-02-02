//
//  Array+Only.swift
//  JogoDaMemoria
//
//  Created by Eduarda Gislon on 01/02/24.
//

import Foundation

extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
}
