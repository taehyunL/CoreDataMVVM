//
//  DetailView.swift
//  CoreDataPractice
//
//  Created by 이태현 on 2022/03/15.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    let coreDM: CoreDataManager
    
    @State var movieName = ""
    @Binding var needsRefresh: Bool
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "" , text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie(movie: movie)
                    needsRefresh.toggle()
                }
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
