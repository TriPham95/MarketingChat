//
//  StatusSelectorView.swift
//  ChatApp
//
//  Created by Tri Pham on 7/18/21.
//

import SwiftUI

struct StatusSelectorView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
        }
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("CURRENTLY SET TO")
                    .foregroundColor(.gray)
                    .padding()
                
                StatusCell(viewModel: StatusViewModel(rawValue: 4)!)
                
                Text("SELECT YOUR STATUS")
                    .foregroundColor(.gray)
                    .padding()
                
                ForEach(StatusViewModel.allCases, id: \.self) { viewModel in
                    Button(action: {
                        print("change status here")
                    }, label: {
                        StatusCell(viewModel: viewModel)
                    })
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}


struct StatusCell: View {
    let viewModel: StatusViewModel
    var body: some View {
        HStack {
            Text(viewModel.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)
    }
}
