//
//  BookView.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 14/05/25.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var book = Book()
    @State var showBookPage = false
    @State var page: String = ""
    
    @EnvironmentObject var globalAppState: GlobalAppState
    
    let swipeThreshold: CGFloat = 50

    var body: some View {
        ZStack(alignment: .bottom) {
            
            if let imageName = book.livros[safe: book.currentIndex], let image = UIImage(named: imageName) {
                Image(uiImage: image)
                    .aspectRatio(contentMode: .fit)
                    .transition(.opacity)
                    .id(book.currentIndex)
                    .padding(.bottom, 40)
            } else {
                Text("Imagem não encontrada para o índice: \(book.currentIndex)")
                    .padding(.bottom, 40)
            }
            
            if showBookPage {
                PagesView(isPresented: $showBookPage, page: page)
                    .zIndex(1)
                    .padding(.trailing, 10)
            }
            
            if (book.currentIndex == 0){
                Button(action: {
                    globalAppState.definirCulturaAtual(novaCultura: "Japan")
                    book.passarPagina(destinationIndex: 11)
                    SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
                }) {
                    Image(systemName: "arrow.right").imageScale(.large)
                        .symbolEffect(.breathe)
                }.foregroundColor(.black).padding(.leading, 185).padding(.bottom, 50)
            }
            else if (book.currentIndex == 11 && !showBookPage){
                Button(action: {
                    showBookPage = true
                    page = "Pagina0"
                }) {
                    Image(systemName: "arrow.down.left.and.arrow.up.right").imageScale(.medium)
                }.foregroundColor(.black).padding(.leading, 315).padding(.bottom, 230)
                
                Button(action: {
                    book.voltarPagina(backIndex: 0)
                    SoundManager.instance.playSoundEffect(soundFileName: "closeBook", volume: 0.3)
                }) {
                    Image(systemName: "arrow.left").imageScale(.large)
                }.foregroundColor(.black).padding(.trailing, 315).padding(.bottom, 55)

                Button(action: {
                    globalAppState.definirCulturaAtual(novaCultura: "France")
                    book.passarPagina(destinationIndex: 18)
                    SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
                }) {
                    Image(systemName: "arrow.right").imageScale(.large)
                }.foregroundColor(.black).padding(.leading, 315).padding(.bottom, 55)
            }
            else if (book.currentIndex == 18 && !showBookPage){
                if (globalAppState.jogosConcluidosPorCultura["Japan"] ?? 0 < 2) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 109.87805, height: 104.06097)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.7))
                            .cornerRadius(9.69512)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9.69512)
                                    .inset(by: 0.65)
                                    .stroke(.black, lineWidth: 1.29268)
                            )
                        Image(systemName: "lock.fill").imageScale(.large).font(.system(size: 26, weight: .bold)).foregroundStyle(.black)
                    }.padding(.bottom, 94).padding(.trailing, 177)
                }
                
                Button(action: {
                    showBookPage = true
                    page = "Pagina1"
                }) {
                    Image(systemName: "arrow.down.left.and.arrow.up.right").imageScale(.medium)
                }.foregroundColor(.black).padding(.leading, 315).padding(.bottom, 230)
                
                Button(action: {
                    globalAppState.definirCulturaAtual(novaCultura: "Japan")
                    book.voltarPagina(backIndex: 11)
                    SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
                }) {
                    Image(systemName: "arrow.left").imageScale(.large)
                }.foregroundColor(.black).padding(.trailing, 315).padding(.bottom, 55)

                Button(action: {
                    globalAppState.definirCulturaAtual(novaCultura: "Mexico")
                    book.passarPagina(destinationIndex: 25)
                    SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
                }) {
                    Image(systemName: "arrow.right").imageScale(.large)
                }.foregroundColor(.black).padding(.leading, 315).padding(.bottom, 55)
            }
            else if (book.currentIndex == 25 && !showBookPage){
                if (globalAppState.jogosConcluidosPorCultura["France"] ?? 0 < 2) {
                     ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 109.87805, height: 104.06097)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.7))
                            .cornerRadius(9.69512)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9.69512)
                                    .inset(by: 0.65)
                                    .stroke(.black, lineWidth: 1.29268)
                            )
                        Image(systemName: "lock.fill").imageScale(.large).font(.system(size: 26, weight: .bold)).foregroundStyle(.black)
                    }.padding(.bottom, 94).padding(.trailing, 177)
                }
                Button(action: {
                    showBookPage = true
                    page = "Pagina2"
                }) {
                    Image(systemName: "arrow.down.left.and.arrow.up.right").imageScale(.medium)
                }.foregroundColor(.black).padding(.leading, 315).padding(.bottom, 230)
                
                Button(action: {
                    globalAppState.definirCulturaAtual(novaCultura: "France")
                    book.voltarPagina(backIndex: 18)
                    SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
                }) {
                    Image(systemName: "arrow.left").imageScale(.large)
                }.foregroundColor(.black).padding(.trailing, 315).padding(.bottom, 55)

                Button(action: {
                    globalAppState.definirCulturaAtual(novaCultura: "Italy")
                    book.passarPagina(destinationIndex: 32)
                    SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
                }) {
                    Image(systemName: "arrow.right").imageScale(.large)
                }.foregroundColor(.black).padding(.leading, 315).padding(.bottom, 55)
            }
            else if (book.currentIndex == 32 && !showBookPage){
                 if (globalAppState.jogosConcluidosPorCultura["Mexico"] ?? 0 < 2) {
                     ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 109.87805, height: 104.06097)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.7))
                            .cornerRadius(9.69512)
                            .overlay(
                                RoundedRectangle(cornerRadius: 9.69512)
                                    .inset(by: 0.65)
                                    .stroke(.black, lineWidth: 1.29268)
                            )
                        Image(systemName: "lock.fill").imageScale(.large).font(.system(size: 26, weight: .bold)).foregroundStyle(.black)
                    }.padding(.bottom, 94).padding(.trailing, 177)
                }
                Button(action: {
                    showBookPage = true
                    page = "Pagina3"
                }) {
                    Image(systemName: "arrow.down.left.and.arrow.up.right").imageScale(.medium)
                }.foregroundColor(.black).padding(.leading, 315).padding(.bottom, 230)
                
                Button(action: {
                    globalAppState.definirCulturaAtual(novaCultura: "Mexico")
                    book.voltarPagina(backIndex: 25)
                    SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
                }) {
                    Image(systemName: "arrow.left").imageScale(.large)
                }.foregroundColor(.black).padding(.trailing, 315).padding(.bottom, 55)
            }
            
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onEnded { value in
                    if showBookPage { return }

                    let horizontalAmount = value.translation.width
                    let verticalAmount = value.translation.height

                    if abs(horizontalAmount) > abs(verticalAmount) {
                        if horizontalAmount < -swipeThreshold {
                            handleSwipeNext()
                        } else if horizontalAmount > swipeThreshold {
                            handleSwipePrevious()
                        }
                    }
                }
        )
    }

    func handleSwipeNext() {
        switch book.currentIndex {
        case 0:
            globalAppState.definirCulturaAtual(novaCultura: "Japan")
            book.passarPagina(destinationIndex: 11)
            SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
        case 11:
            globalAppState.definirCulturaAtual(novaCultura: "France")
            book.passarPagina(destinationIndex: 18)
            SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
        case 18:
            globalAppState.definirCulturaAtual(novaCultura: "Mexico")
            book.passarPagina(destinationIndex: 25)
            SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
        case 25:
            globalAppState.definirCulturaAtual(novaCultura: "Italy")
            book.passarPagina(destinationIndex: 32)
            SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
        default:
            print("Swipe para próxima: Sem ação definida para o índice atual \(book.currentIndex).")
        }
    }

    func handleSwipePrevious() {
        switch book.currentIndex {
        case 11:
            book.voltarPagina(backIndex: 0)
            SoundManager.instance.playSoundEffect(soundFileName: "closeBook", volume: 0.3)
        case 18:
            globalAppState.definirCulturaAtual(novaCultura: "Japan")
            book.voltarPagina(backIndex: 11)
            SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
        case 25:
            globalAppState.definirCulturaAtual(novaCultura: "France")
            book.voltarPagina(backIndex: 18)
            SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
        case 32:
            globalAppState.definirCulturaAtual(novaCultura: "Mexico")
            book.voltarPagina(backIndex: 25)
            SoundManager.instance.playSoundEffect(soundFileName: "page", volume: 0.5)
        default:
            print("Swipe para anterior: Sem ação definida para o índice atual \(book.currentIndex).")
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


#Preview {
    BookView()
}
