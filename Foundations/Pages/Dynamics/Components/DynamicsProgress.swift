//
//  DynamicsProgress.swift
//  Foundations
//
//  Created by Madu on 18/04/23.
//

import SwiftUI

struct DynamicsProgress: View {
    @State private var fase = 3.0
    
    var body: some View {
        VStack {
            HStack(spacing: 90) {
                Image(systemName: "target")
                Image(systemName: "target")
                Image(systemName: "target")
                Image(systemName: "target")
            }
            .padding()
            .padding(.top)
            RoundedRectangle(cornerRadius: 60)
                .fill(LinearGradient(
                    gradient: Gradient(
                        colors: updateProgress(fase: 4)
                    ),
                    startPoint: .leading, endPoint: .trailing
                 ))
                .frame(width: 380, height: 10)
        }
        .padding()
    }
    
    func updateProgress(fase: Double) -> [Color] {
        switch fase {
        case 1:
            return [Color("card-color"), Color("progressbar"), Color("progressbar"), Color("progressbar")]
        case 2:
            return [Color("card-color"), Color("dynamics-orange"), Color("progressbar"), Color("progressbar")]
        case 3:
            return [Color("card-color"), Color("dynamics-orange"), Color("dynamics-pink"), Color("progressbar")]
        case 4:
            return [Color("card-color"), Color("dynamics-orange"), Color("dynamics-pink"), Color("dynamics-green")]
        default:
            return [Color("progressbar")]
        }
    }
}

struct DynamicsProgress_Previews: PreviewProvider {
    static var previews: some View {
        DynamicsProgress()
    }
}
