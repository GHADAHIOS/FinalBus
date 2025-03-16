import SwiftUI

struct ContentView: View {
    @State private var showPopup = false
    @State private var navigateToScenario = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // ✅ المربعات الأساسية
                HStack(spacing: 16) {
                    ZStack {
                        // 1️⃣ الصندوق الأساسي فيه صورة ونص
                        VStack {
                            Image("Image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Text("Market Expansion ")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .bold()

                        }
                        .frame(width: 165.97, height: 126.67)
                        .background(Color.rok)
                        .cornerRadius(10)
                        
                        // 2️⃣ الصندوق الإضافي بنفس الحجم
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.rok.opacity(0.86)) // صندوق شفاف بلون غامق
                            .frame(width: 165.97, height: 126.67)
                        
                        // 3️⃣ نص "SOON" فوق كل شيء
                        Text("SOON")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .opacity(0.73)

                            .padding(.top, 10)
                    }
                ZStack {
                        // 1️⃣ الصندوق الأساسي فيه صورة ونص
                        VStack {
                            Image("Image 3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Text("Launching a Startup")
                                .font(.subheadline)
                                .foregroundColor(.black)
                              

                                .bold()
                        }
                        .frame(width: 165.97, height: 126.67)
                        .background(Color.color1)
                        .cornerRadius(10)
                        
                        // 2️⃣ الصندوق الإضافي بنفس الحجم
                        
                            .padding(.top, 10)
                    }
                }

                HStack(spacing: 16) {
                    ZStack {
                        // 1️⃣ الصندوق الأساسي فيه صورة ونص
                        VStack {
                            Image("Image 1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.black)
                            
                            Text("Team Management")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .bold()
                        }
                        .frame(width: 165.97, height: 126.67)
                        .background(Color.rok)
                        .cornerRadius(10)
                        
                        // 2️⃣ الصندوق الإضافي بنفس الحجم
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.rok.opacity(0.86)) // صندوق شفاف بلون غامق
                            .frame(width: 165.97, height: 126.67)
                        
                        // 3️⃣ نص "SOON" فوق كل شيء
                        Text("SOON")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .opacity(0.73)
                            .padding(.top, 10)
                    }
                    ZStack {
                        // 1️⃣ الصندوق الأساسي فيه صورة ونص
                        VStack {
                            Image("Image 2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .foregroundColor(.white)
                            
                            Text("Monay Management ")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .bold()
                        }
                        .frame(width: 165.97, height: 126.67)
                        .background(Color.rok)
                        .cornerRadius(10)
                        
                        // 2️⃣ الصندوق الإضافي بنفس الحجم
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.rok.opacity(0.86)) // صندوق شفاف بلون غامق
                            .frame(width: 165.97, height: 126.67)
                        
                        // 3️⃣ نص "SOON" فوق كل شيء
                        Text("SOON")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .opacity(0.73)

                            .padding(.top, 10)
                    }                }

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
                
                NavigationLink(destination: ScenarioView(), isActive: $navigateToScenario) {
                    EmptyView()
                }
            }
            .padding()
            .alert(isPresented: $showPopup) {
                Alert(
                    title: Text("Are you ready?"),
                    message: Text("You will have 5 scenarios related to Launching a Startup."),
                    primaryButton: .default(Text("Start")) {
                        navigateToScenario = true
                    },
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
        }
    }
}

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
