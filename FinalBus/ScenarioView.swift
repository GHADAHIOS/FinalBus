import SwiftUI

struct ScenarioView: View {
    @State private var selectedOption: Int? = nil
    @State private var currentScenario: Int = 1
    let totalScenarios = 5
    let progressStep: CGFloat = 1.0 / 5.0
    @State private var showResultsSheet = false
    
    // النقاط المبدئية لكل مجال
    @State private var marketingScore: Int = 0
    @State private var businessScore: Int = 0
    @State private var customerScore: Int = 0
    @State private var teamScore: Int = 0

    // السيناريوهات المتاحة
    let allScenarios: [(question: String, options: [String])] = [
            ("Your startup is running low on funds. What do you do next?",
             ["Invest in marketing campaigns.", "Seek external funding.", "Develop a new feature.", "Optimize internal processes."]),
            ("A competitor is gaining market share rapidly. How do you respond?",
             ["Analyze their strategy.", "Increase advertising budget.", "Launch a loyalty program.", "Improve customer service."]),
            ("Your product launch generated low traction. What’s your next move?",
             ["Improve branding.", "Offer discounts.", "Pivot to a different market.", "Increase social media engagement."]),
            ("Your website traffic is dropping. What’s your plan?",
             ["Enhance SEO.", "Run paid ads.", "Collaborate with influencers.", "Redesign the website."]),
            ("Your team is struggling with productivity. What’s your approach?",
             ["Implement time tracking.", "Offer remote work options.", "Provide training.", "Increase salaries."]),
            ("An investor wants to see quick profitability. What do you do?",
             ["Increase pricing.", "Expand to new markets.", "Reduce expenses.", "Improve conversion rates."]),
            ("Your product has many bugs after launch. How do you handle it?",
             ["Release a hotfix ASAP.", "Communicate issues to users.", "Delay new features to fix bugs.", "Offer compensation to affected users."]),
            ("You’re losing customers to a competitor. How do you react?",
             ["Improve customer support.", "Launch a discount campaign.", "Enhance your product.", "Target competitor’s audience with ads."]),
            ("You need to raise capital. What’s your best approach?",
             ["Seek venture capital.", "Apply for a startup loan.", "Crowdfund your idea.", "Bootstrap and grow organically."]),
            ("A major client cancels a contract. What’s your next step?",
             ["Find new clients quickly.", "Diversify your revenue streams.", "Negotiate with the client.", "Reduce costs to compensate."]),
            ("Your marketing campaign is underperforming. What do you change?",
             ["Adjust targeting.", "Increase budget.", "Change the ad creative.", "Try a different platform."]),
            ("A key employee resigns unexpectedly. How do you handle it?",
             ["Promote internally.", "Hire a replacement quickly.", "Distribute workload among team.", "Offer incentives to retain staff."]),
            ("Your app's engagement rate is low. How do you boost it?",
             ["Introduce gamification.", "Enhance notifications.", "Improve onboarding.", "Add social sharing features."]),
            ("Your business gets negative PR. What’s your response?",
             ["Issue a public apology.", "Engage with the community.", "Ignore and move forward.", "Offer discounts to regain trust."]),
            ("Your competitors launch a cheaper alternative. How do you react?",
             ["Lower your prices.", "Differentiate on quality.", "Offer additional services.", "Enhance branding."]),
            ("Your startup faces a lawsuit. What do you do first?",
             ["Hire legal counsel.", "Settle out of court.", "Defend aggressively.", "Seek public support."]),
            ("Your software experiences a security breach. What’s your next move?",
             ["Notify affected users.", "Enhance security measures.", "Offer compensation.", "Investigate internally first."]),
            ("Your startup is expanding too fast. How do you manage?",
             ["Slow down growth.", "Secure more funding.", "Hire experienced leaders.", "Improve internal processes."]),
            ("Your lead generation is failing. What’s your new approach?",
             ["Try inbound marketing.", "Focus on outbound sales.", "Offer referral incentives.", "Increase content marketing."]),
            ("A supplier raises prices unexpectedly. What’s your response?",
             ["Negotiate better terms.", "Find alternative suppliers.", "Absorb the costs.", "Pass costs to customers."]),
            ("Your social media engagement is low. How do you improve it?",
             ["Post more frequently.", "Use paid promotions.", "Engage with followers.", "Run giveaways."]),
            ("A major partner pulls out. How do you recover?",
             ["Find a new partner.", "Adjust business strategy.", "Strengthen remaining partnerships.", "Absorb the impact internally."]),
            ("Your MVP gets mixed feedback. What’s your next step?",
             ["Refine based on feedback.", "Launch a new version.", "Ignore and proceed.", "Test different user segments."]),
            ("A new law affects your business model. How do you adapt?",
             ["Consult a lawyer.", "Pivot your business model.", "Lobby against the law.", "Find loopholes."]),
            ("Your employees demand better benefits. How do you respond?",
             ["Increase salaries.", "Offer stock options.", "Enhance work culture.", "Negotiate compromises."]),
            ("You’re running out of personal savings. What do you do?",
             ["Find a co-founder.", "Raise funding.", "Look for a side income.", "Take out a personal loan."]),
            ("A top competitor wants to acquire you. What’s your decision?",
             ["Accept the offer.", "Negotiate better terms.", "Decline and compete.", "Merge but keep control."]),
            ("Your startup struggles to build brand awareness. How do you fix it?",
             ["Launch PR campaigns.", "Leverage social media influencers.", "Run viral marketing stunts.", "Focus on community building."]),
            ("A major client delays payment. What’s your next move?",
             ["Charge late fees.", "Negotiate payment terms.", "Seek legal action.", "Offer discounts for early payment."])
        ]

    @State private var selectedScenarios: [(question: String, options: [String])] = []

    init() {
        _selectedScenarios = State(initialValue: Array(allScenarios.shuffled().prefix(5)))
    }
    
    // دالة لتحديث النقاط بناءً على الاختيار
    func updateScores(optionIndex: Int) {
        switch optionIndex {
        case 0:
            marketingScore += 20
        case 1:
            businessScore += 20
        case 2:
            customerScore += 20
        case 3:
            teamScore += 20
        default:
            break
        }
    }

    // دالة لحساب النسبة المئوية الدقيقة لكل مجال
    func calculatePercentage(score: Int, maxScore: Int) -> Int {
        guard maxScore > 0 else { return 0 }
        return Int((Double(score) / Double(maxScore)) * 100)
    }

    // دالة لتحليل نوع الشخصية بناءً على النقاط
    func determinePersonality() -> String {
        let scores = [marketingScore, businessScore, customerScore, teamScore]
        let maxScore = scores.max() ?? 0
        switch maxScore {
        case marketingScore:
            return "Creative Entrepreneur"  // مبدع
        case businessScore:
            return "Analytical Entrepreneur" // تحليلي
        case customerScore:
            return "Conservative Entrepreneur" // محافظ
        case teamScore:
            return "Team-Oriented Entrepreneur" // ريادي مع تركيز على الفريق
        default:
            return "Undefined"
        }
    }

    var body: some View {
        VStack {
            // مستطيل السيناريو مع شريط التقدم
            ZStack(alignment: .top) {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0.9)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(width: 393, height: 317)
                    .cornerRadius(8)

                    Text("Scenario \(currentScenario): \(selectedScenarios[currentScenario - 1].question)")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                    .padding()
                }

                ZStack(alignment: .trailing) {
                    ProgressView(value: CGFloat(currentScenario) * progressStep, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(6)

                    Text("\(currentScenario)/\(totalScenarios)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.trailing, 8)
                }
                .frame(width: 393, height: 60)
                .padding(.top, 10)
            }

            // قائمة الخيارات مع نصوص مختلفة
            VStack(spacing: 16) {
                let options = selectedScenarios[currentScenario - 1].options
                ForEach(0..<options.count, id: \.self) { index in
                    HStack {
                        Circle()
                            .stroke(Color.gray, lineWidth: 2)
                            .background(selectedOption == index ? Circle().fill(Color.blue) : Circle().fill(Color.clear))
                            .frame(width: 24, height: 24)

                        Button(action: {
                            selectedOption = index
                            updateScores(optionIndex: index) // تحديث النقاط بناءً على الخيار
                        }) {
                            Text(options[index])
                                .font(.system(size: 16))
                                .bold(true)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(width: 310, height: 30)
                                .padding()
                                .background(selectedOption == index ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding(.top, 20)

            // أزرار التحكم (Back و Next)
            HStack {
                Button(action: {
                    if currentScenario > 1 {
                        currentScenario -= 1
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
                        currentScenario += 1
                    } else {
                        showResultsSheet = true
                    }
                }) {
                    Text(currentScenario == totalScenarios ? "End" : "Next")
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
                    analysisItemView(icon: "target", title: "Marketing", percentage: calculatePercentage(score: marketingScore, maxScore: 100))
                    analysisItemView(icon: "dollarsign.circle", title: "Business", percentage: calculatePercentage(score: businessScore, maxScore: 100))
                    analysisItemView(icon: "heart", title: "Customer", percentage: calculatePercentage(score: customerScore, maxScore: 100))
                    analysisItemView(icon: "person.2", title: "Team", percentage: calculatePercentage(score: teamScore, maxScore: 100))
                }
                .padding(.top, 10)

                // عرض نوع الشخصية
                Text("Personality Type: \(determinePersonality())")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }

    // وظيفة لإنشاء العنصر الفردي
    private func analysisItemView(icon: String, title: String, percentage: Int) -> some View {
        HStack {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .foregroundColor(.purple)
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
            }

            Spacer()

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
