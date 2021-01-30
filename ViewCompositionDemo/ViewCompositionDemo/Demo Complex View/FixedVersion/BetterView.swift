//
//  BetterView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct BetterView: View {
    @StateObject var viewModel: PlayerViewModel

    var body: some View {
        ZStack {
            BackgroundView(color: viewModel.media.color)

            VStack(alignment: .center) {

                HeaderView(title: viewModel.media.artist)

                Spacer()

                Image(viewModel.media.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minHeight: 150, maxHeight: 300, alignment: .center)
                    .padding(.bottom, 30)

                VStack (alignment: .leading) {
                    MediaInfoView(media: viewModel.media)

                    TrackProgressView(viewModel: viewModel)

                    HStack {
                        Image(systemName: "shuffle")
                            .foregroundColor(Color.white.opacity(0.7))
                        Spacer()
                        Button(
                            action: { viewModel.backward() },
                            label: {
                                Image(systemName: "backward.end.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                            }
                        )
                        Spacer()
                        Button(
                            action: { viewModel.play() },
                            label: {
                                Image(systemName: viewModel.isPlaying ? "play.circle.fill" : "pause.circle.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 80)
                            }
                        )
                        Spacer()
                        Button(
                            action: { viewModel.forward() },
                            label: {
                                Image(systemName: "forward.end.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                            }
                        )
                        Spacer()
                        Image(systemName: "repeat")
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    .frame(maxHeight: .infinity)

                    Spacer()
                    HStack (alignment: .bottom){
                        Image(systemName: "tv.and.hifispeaker.fill")
                        Spacer()
                        Image(systemName: "list.triangle")
                    }
                    .foregroundColor(.white)


                }
            }.padding([.leading, .trailing, .bottom])
        }
    }
}

struct BetterView_Previews: PreviewProvider {
    static var previews: some View {
        BetterView(
            viewModel: .init(
                media: Media(
                    name: "Bohemian Rhapsody",
                    artist: "Queen",
                    duration: 330000,
                    imageName: "queen",
                    color: .pink
                )
            )
        )
    }
}

