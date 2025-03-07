import SwiftUI

struct ContentView: View {
    @State private var showPopup = false

    var body: some View {
        VStack(spacing: 16) {
            // ✅ المربعات الأساسية
            HStack(spacing: 16) {
                ZStack {
                    VStack {
                        Image(systemName: "person.3.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                        
                        Text("text")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .frame(width: 183, height: 142)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    Text("SOON")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                
                ZStack {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                        
                        Text("Launching a Startup")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .frame(width: 183, height: 142)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    Text("SOON")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .onTapGesture {
                            showPopup.toggle()
                        }
                }
            }
            
            HStack(spacing: 16) {
                ZStack {
                    VStack {
                        Image(systemName: "dollarsign.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                        
                        Text(" text ")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .frame(width: 183, height: 142)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    Text("SOON")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                
                ZStack {
                    VStack {
                        Image(systemName: "lightbulb.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                        
                        Text("text")
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .frame(width: 183, height: 142)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    Text("SOON")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(hex: "#B0B0B0"))
                .padding(.top, 10)
            
            HStack {
                Text("History")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .padding(.horizontal, 10)
            
            VStack(spacing: 10) {
                ForEach(0..<3, id: \.self) { _ in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#A0A0A0"), lineWidth: 1)
                            .frame(width: 378, height: 111)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Launching a Startup")
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(Color(hex: "#6A5412"))
                                
                                Spacer()
                                
                                Text("4-2-2025")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                VStack {
                                    ZStack {
                                        Circle()
                                            .stroke(Color("SecondaryL"), lineWidth: 5)
                                            .frame(width: 40, height: 40)
                                        
                                        Circle()
                                            .trim(from: 0.0, to: CGFloat(25) / 100)
                                            .stroke(Color("SecondaryH"), lineWidth: 5)
                                            .frame(width: 40, height: 40)
                                            .rotationEffect(.degrees(-90))
                                        
                                        Text("25%")
                                            .font(.caption)
                                            .bold()
                                    }
                                    Text("Marketing")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                
                                VStack {
                                    ZStack {
                                        Circle()
                                            .stroke(Color("SecondaryL"), lineWidth: 5)
                                            .frame(width: 40, height: 40)
                                        
                                        Circle()
                                            .trim(from: 0.0, to: CGFloat(75) / 100)
                                            .stroke(Color("SecondaryH"), lineWidth: 5)
                                            .frame(width: 40, height: 40)
                                            .rotationEffect(.degrees(-90))
                                        
                                        Text("75%")
                                            .font(.caption)
                                            .bold()
                                    }
                                    Text("Marketing")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                
                                VStack {
                                    ZStack {
                                        Circle()
                                            .stroke(Color("SecondaryL"), lineWidth: 5)
                                            .frame(width: 40, height: 40)
                                        
                                        Circle()
                                            .trim(from: 0.0, to: CGFloat(50) / 100)
                                            .stroke(Color("SecondaryH"), lineWidth: 5)
                                            .frame(width: 40, height: 40)
                                            .rotationEffect(.degrees(-90))
                                        
                                        Text("50%")
                                            .font(.caption)
                                            .bold()
                                    }
                                    Text("Marketing")
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Spacer()
                                    Text("Read More")
                                        .font(.subheadline)
                                        .foregroundColor(Color.blue)
                                }
                            }
                        }
                        .padding(10)
                    }
                }
            }
        }
        .padding()
        .overlay(
            Group {
                if showPopup {
                    Color.white.opacity(0.9)
                        .frame(width: 307, height: 229)
                        .cornerRadius(4)
                        .overlay(
                            VStack(spacing: 0) {
                                Spacer()
                                
                                Text("Are you ready?")
                                    .font(.system(size: 30, weight: .bold))
                                    .padding(.top, 15)
                                
                                Text("You will have 5 scenarios related to ")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                
                                Text("Launching a Startup")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(.top, -5)
                                
                                Divider()
                                    .background(Color(hex: "#B0B0B0"))
                                    .frame(height: 1)
                                    .padding(.horizontal) // الخط الأفقي فوق الزرين

                                HStack(spacing: 0) {
                                    VStack {
                                        Text("Cancel")
                                            .font(.system(size: 22, weight: .bold))
                                            .foregroundColor(.gray)
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                    }

                                    Divider()
                                        .background(Color(hex: "#B0B0B0"))
                                        .frame(width: 1, height: 50)

                                    VStack {
                                        Text("Start")
                                            .font(.system(size: 22, weight: .bold))
                                            .foregroundColor(Color.primary) // لون primary
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                    }
                                }
                                .frame(width: 307, height: 50)
                                .padding(.bottom, 20)
                            }
                            .padding()
                        )
                        .zIndex(1)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 - 100) // موقع البوب
                }
            }
        )
    }
}

/// ✅ لتحويل Hex Color إلى SwiftUI Color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    ContentView()
}
