//
//  PagesView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 16/05/25.
//

import SwiftUI

struct PagesView: View {
    @Binding var isPresented: Bool
    @State private var showContent = false
    
    var page: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if showContent {
                Image(page)
                    .resizable()
                    .scaledToFit()

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                     showContent = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.isPresented = false
                    }
                }){
                    Image(systemName: "xmark").foregroundColor(.black).imageScale(.large).font(.title3)
                        .padding(.trailing, 35).padding(.top, 20)
                }
            
            }
        }
        .transition(.opacity)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.3)) {
                showContent = true
            }
        }
    }
}

//#Preview {
   // PagesView(page: "Pagina0")
//}
