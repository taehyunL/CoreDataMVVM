//
//  ContentView.swift
//  CoreDataPractice
//
//  Created by 이태현 on 2022/03/15.
//

import SwiftUI

struct ContentView: View {
    
    let coreDM: CoreDataManager
    @State var movieTitle = ""
    @State var movies: [Movie] = [Movie]()
    @State var needsRefresh = false
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter title", text: $movieTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Save") {
                    coreDM.saveMovie(title: movieTitle)
                    populateMovies()
                }
                
                List {
                    ForEach(movies, id: \.self) { movie in
                        NavigationLink(destination: DetailView(movie: movie, coreDM: coreDM, needsRefresh: $needsRefresh), label: {
                            Text(movie.title ?? "")
                        })
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    })
                }
                .listStyle(PlainListStyle())
                .accentColor(needsRefresh ? .black : .white)
                Spacer()
            }
            .padding()
            .navigationTitle("Movies")
            
            .onAppear {
                populateMovies()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView(coreDM: CoreDataManager())
    }
}
