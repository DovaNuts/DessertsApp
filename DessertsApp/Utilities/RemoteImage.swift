import SwiftUI

struct RemoteImage: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        Image(uiImage: imageLoader.image ?? UIImage(named: "placeholder")!)
            .resizable()
            .overlay {
                if imageLoader.image == nil {
                    ProgressView()
                }
            }
    }
}
