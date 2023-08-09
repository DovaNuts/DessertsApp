import SwiftUI
import UIKit

struct DessertItemRowView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    let name: String
    let imageUrl: String

    var body: some View {
        VStack {            
            HStack(spacing: 20) {
                Text(name)
                    .foregroundColor(isDarkMode ? Color.textDark : Color.text)
                    .font(.headline)
                    .fontWeight(.medium)
                
                Spacer()
                
                RemoteImage(url: imageUrl)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke((isDarkMode ? Color.secondaryDark : Color.secondary).opacity(0.2), lineWidth: 1))
                    .shadow(color: (isDarkMode ? Color.highlightDark : Color.highlight).opacity(0.1), radius: 8, x: 0, y: 4)
            }
        }
    }
}


struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertItemRowView(name: "Dessert", imageUrl: "")
    }
}
