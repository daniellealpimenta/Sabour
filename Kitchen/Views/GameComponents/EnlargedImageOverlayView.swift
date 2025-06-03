//
//  EnlargedImageOverlayView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 17/05/25.
//

import SwiftUI

struct EnlargedImageOverlayView: View {
    let imageUrlString: String
    @Binding var isPresented: Bool

    @State private var steadyStateScale: CGFloat = 1.0
    @GestureState private var gestureZoomScale: CGFloat = 1.0

    @State private var steadyStateOffset: CGSize = .zero
    @GestureState private var gestureDragOffset: CGSize = .zero

    private var totalScale: CGFloat {
        steadyStateScale * gestureZoomScale
    }

    private var totalOffset: CGSize {
        CGSize(width: steadyStateOffset.width + gestureDragOffset.width,
               height: steadyStateOffset.height + gestureDragOffset.height)
    }

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    if totalScale <= 1.05 {
                        isPresented = false
                    }
                }

            VStack {
                Spacer()
                if let url = URL(string: imageUrlString) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView().scaleEffect(1.5).tint(.white)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(totalScale)
                                .offset(totalOffset)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.9,
                                       maxHeight: UIScreen.main.bounds.height * 0.7)
                                .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 5)
                                .padding(20)
                                .gesture(
                                    DragGesture()
                                        .updating($gestureDragOffset) { value, state, _ in
                                            if steadyStateScale > 1.0 {
                                                state = value.translation
                                            } else {
                                                state = .zero
                                            }
                                        }
                                        .onEnded { value in
                                            if steadyStateScale > 1.0 {
                                                steadyStateOffset.width += value.translation.width
                                                steadyStateOffset.height += value.translation.height
                                            }
                                        }
                                )
                                .simultaneousGesture(
                                    MagnificationGesture()
                                        .updating($gestureZoomScale) { value, state, _ in
                                            state = value
                                        }
                                        .onEnded { value in
                                            withAnimation(.interactiveSpring()) {
                                                steadyStateScale *= value
                                                steadyStateScale = max(1.0, min(steadyStateScale, 5.0))

                                                if steadyStateScale == 1.0 {
                                                    steadyStateOffset = .zero
                                                }
                                            }
                                        }
                                )
                                .onTapGesture(count: 2) {
                                    withAnimation(.interactiveSpring()) {
                                        steadyStateScale = 1.0
                                        steadyStateOffset = .zero
                                    }
                                }
                                .onTapGesture {
                                    if totalScale <= 1.05 {
                                        isPresented = false
                                    }
                                }
                        case .failure:
                            Image(systemName: "photo.fill")
                                .resizable().scaledToFit().frame(width: 80, height: 80)
                                .foregroundColor(.gray)
                            Text("Imagem indisponível")
                                .foregroundColor(.white.opacity(0.7))
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Text("URL inválida").foregroundColor(.white)
                }
                Spacer()
            }
        }
        .transition(.opacity.combined(with: .scale(scale: 0.9, anchor: .center)))
        .onDisappear { 
            steadyStateScale = 1.0
            steadyStateOffset = .zero
        }
    }
}
