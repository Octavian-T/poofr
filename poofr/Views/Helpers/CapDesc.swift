//
//  CapDesc.swift
//  poofr
//
//  Created by Octavian Tabacaru on 20/09/2021.
//

import SwiftUI

struct CapDesc: View {
    var desc: String
    var body: some View {
        Text(desc)
            .font(.headline)
            .foregroundColor(.black)
            .padding(5)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .overlay(RoundedRectangle(cornerRadius: 30).strokeBorder(Color.black, lineWidth: 0.8))
    }
}

struct CapDesc_Previews: PreviewProvider {
    static var previews: some View {
        CapDesc(desc:"1")
    }
}
