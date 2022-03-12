//
//  NewLayout.swift
//  GFG News
//
//  Created by Palak Gandhi on 12/03/22.
//

import SwiftUI

struct NewsLayout: View {
    
    @Binding var title:String
    @Binding var date:String
    @Binding var imageLink: String
    
    var body: some View {
        HStack {
            ZStack {
                VStack {
                    Text(title)
                        .foregroundColor(.green)
                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 2)
                    dateView()
                        .foregroundColor(.secondary)
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                    .frame(width: 10, height: 10)
            }
            AsyncImage(url: URL(string: imageLink)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Text("Image is not available at the moment")
            }
            .frame(width: 150, height: 150)
        }.cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 1)))
    }
    
    func dateView() -> some View {
        let components = date.components(separatedBy: " ")
        let finalDate: String = components[0]
        let time: String = components[1]
        let dateComponents = finalDate.components(separatedBy: "-")
        var month: String
        switch dateComponents[1] {
        case "01":
            month = "Jan"
        case "02":
            month = "Feb"
        case "03":
            month = "March"
        case "04":
            month = "April"
        case "05":
            month = "May"
        case "06":
            month = "June"
        case "07":
            month = "July"
        case "08":
            month = "Aug"
        case "09":
            month = "Sept"
        case "10":
            month = "Oct"
        case "11":
            month = "Nov"
        case "12":
            month = "Dec"
        default:
            month = ""
        }
        let finalTime = time.components(separatedBy: ":")
        var suffix: String
        var hour: String
        if finalTime[0] >= "12" && finalTime[0] <= "23" {
            suffix = "pm"
            if finalTime[0] > "12" {
                hour = String(Int(finalTime[0])! - 12)
            } else {
                hour = "12"
            }
        } else {
            suffix = "am"
            hour = finalTime[0]
        }
        return Text("\(month) \(dateComponents[2]), \(dateComponents[0]) \(hour):\(finalTime[1]) \(suffix)")
        
    }
}

struct NewsLayout_Previews: PreviewProvider {
    static var previews: some View {
        NewsLayout(title: .constant("Data"), date: .constant("Date"), imageLink: .constant("Link"))
    }
}
