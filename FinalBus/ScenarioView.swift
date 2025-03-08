
import SwiftUI

struct ScenarioView: View {
    @State private var selectedOption: Int? = nil
    @State private var currentScenario: Int = 1 // عداد السيناريو الحالي
    let totalScenarios = 5 // عدد السيناريوهات
    let progressStep: CGFloat = 1.0 / 5.0 // نسبة التقدم في كل خطوة
    @State private var showResultsSheet = false // للتحكم في عرض شاشة النتائج كشيت

    var body: some View {
        VStack {
            // ✅ مستطيل السيناريو مع شريط التقدم
            ZStack(alignment: .top) {
                // ✅ مستطيل الخلفية للسيناريو
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0.9)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(width: 393, height: 317)
                    .cornerRadius(8)

                    // ✅ نص السيناريو داخل المستطيل
                    Text("""
                    Scenario \(currentScenario): Your startup is running low on funds. What do you do next?
                    """)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding()
                }

                // ✅ شريط التقدم مع العداد فوقه في اليمين
                ZStack(alignment: .trailing) {
                    ProgressView(value: CGFloat(currentScenario) * progressStep, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                        .background(Color.gray.opacity(0.3)) // لون خلفية خفيف
                        .cornerRadius(6) // تدوير الحواف أكثر ليكون أنعم

                    Text("\(currentScenario)/\(totalScenarios)") // ✅ العداد داخل شريط التقدم في اليمين
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.trailing, 8)
                }
                .frame(width: 393, height: 60) // ضبط حجم الحاوية
                .padding(.top, 10) // تحريكه للأسفل قليلًا
            }

            // ✅ قائمة الخيارات مع نصوص مختلفة
            VStack(spacing: 16) {
                let options = [
                    "Invest in aggressive marketing campaigns to boost sales.", // تسويق
                    "Seek external funding from investors to extend runway.", // إدارة مالية
                    "Develop a new, innovative feature to attract users.", // ابتكار
                    "Optimize internal processes to enhance team productivity." // إدارة الفرق
                ]

                ForEach(0..<options.count, id: \.self) { index in
                    HStack {
                        // ✅ دائرة التحديد
                        Circle()
                            .stroke(Color.gray, lineWidth: 2)
                            .background(selectedOption == index ? Circle().fill(Color.blue) : Circle().fill(Color.clear)) // تعبئة الدائرة فقط
                            .frame(width: 24, height: 24)

                        Spacer().frame(width: 8)

                        // ✅ مستطيل الخيار مع النصوص المختلفة
                        Text(options[index])
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .frame(width: 310, height: 71)
                            .background(selectedOption == index ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                            .cornerRadius(4)
                            .onTapGesture {
                                selectedOption = index // عند الضغط يتم تحديد الخيار
                            }
                    }
                }
            }
            .padding(.top, 20)

            // ✅ أزرار التحكم (Back و Next)
            HStack {
                Button(action: {
                    if currentScenario > 1 {
                        currentScenario -= 1 // تقليل العداد
                    }
                }) {
                    Text("Back")
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 184, height: 51)
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.blue, lineWidth: 2))
                }

                Button(action: {
                    if currentScenario < totalScenarios {
                        currentScenario += 1 // زيادة العداد
                    } else {
                        showResultsSheet = true // عرض شاشة النتائج كشيت
                    }
                }) {
                    Text(currentScenario == totalScenarios ? "End" : "Next") // تغيير الزر إلى "End" عند الوصول للسيناريو الأخير
                        .font(.system(size: 18, weight: .bold))
                        .frame(width: 184, height: 51)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(3)
                }
            }
            .frame(width: 393)
            .padding(.top, 20)
        }
        .padding(.bottom, 30)
        .sheet(isPresented: $showResultsSheet) {
            VStack(spacing: 16) {
                // العنوان
                Text("Your Analysis")
                    .font(.system(size: 31.32, weight: .medium, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)

                // الخط الفاصل
                Divider()
                    .frame(width: 381.42, height: 1.04)
                    .background(Color.gray)

                // المستطيلات
                VStack(spacing: 16) {
                    analysisItemView(icon: "target", title: "Marketing", percentage: 75)
                    analysisItemView(icon: "dollarsign.circle", title: "Business", percentage: 50)
                    analysisItemView(icon: "target", title: "Marketing", percentage: 20)
                    analysisItemView(icon: "target", title: "Marketing", percentage: 20)
                }
                .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }

    // وظيفة لإنشاء العنصر الفردي
    private func analysisItemView(icon: String, title: String, percentage: Int) -> some View {
        HStack {
            // الأيقونة والنص
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(.purple)
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
            }

            Spacer()

            // النسبة داخل دائرة
            ZStack {
                Circle()
                    .stroke(Color.purple.opacity(0.3), lineWidth: 6)
                    .frame(width: 50, height: 50)
                Circle()
                    .trim(from: 0, to: CGFloat(percentage) / 100)
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 50, height: 50)
                Text("%\(percentage)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.purple)
            }
        }
        .padding()
        .frame(width: 344.37, height: 87.51)
        .background(Color.purple.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview {
    ScenarioView()
}
