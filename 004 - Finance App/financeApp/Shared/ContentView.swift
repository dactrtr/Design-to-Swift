import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                header()
                balance()
                slider()
                listCard()
            }
            .offset(y: 32)
            .background(
                ZStack {
                    Color(#colorLiteral(red: 0.1794851124, green: 0.1355969608, blue: 0.4115017056, alpha: 1))
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3266624808, green: 0.3416977525, blue: 0.5977458358, alpha: 1)),Color(#colorLiteral(red: 0.2024041116, green: 0.1632801294, blue: 0.4641083479, alpha: 1)).opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                        .offset(x:-230,y: -150)
                        .opacity(0.5)
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3266624808, green: 0.3416977525, blue: 0.5977458358, alpha: 1)),Color(#colorLiteral(red: 0.2155890465, green: 0.1667975187, blue: 0.4885843396, alpha: 1)).opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                        .offset(x:230,y: -400)
                        .opacity(0.3)
                }
            )
            HStack(spacing:40){
                menuIcon(icon: "house", isOpen: true)
                menuIcon(icon: "chart.pie", isOpen: false)
                menuButton()
                menuIcon(icon: "creditcard", isOpen: false)
                menuIcon(icon: "person", isOpen: false)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 88)
            .background(RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .foregroundColor(.white))
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}
// MARK: preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: MENU
struct menu: View {
    var body: some View {
        HStack(spacing:6){
            VStack(spacing: 6){
                Circle()
                    .frame(width: 4, height: 4)
                Circle()
                    .frame(width: 4, height: 4)
            }
            VStack(spacing: 6){
                Circle()
                    .frame(width: 4, height: 4)
                Circle()
                    .frame(width: 4, height: 4)
                    
            }
            
        }
        .foregroundColor(.white)
        
    }
}
// MARK: HEADER
struct header: View {
    var body: some View {
        HStack {
            menu()
            Spacer()
            ZStack(alignment: .topTrailing) {
                Image(systemName: "bell")
                    .font(.system(size: 24, weight: .regular, design: .rounded))
                Text("30")
                    .font(.system(size: 10, weight: .bold, design: .rounded))
                    .padding(2)
                    .background(Color(.green))
                    .clipShape(RoundedRectangle(cornerRadius: 24)
                    )
            }
            .foregroundColor(.white)
        }
        .padding()
    }
}
// MARK: BALANCE
struct balance: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("BALANCE")
                .font(.system(size: 12, weight: .semibold, design: .rounded))
            HStack(alignment:.bottom, spacing: 0) {
                Text("$ 1,203")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                Text(".59")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .opacity(0.5)
            }
            
        }
        .foregroundColor(.white)
        .padding(.bottom,56)
    }
}
//MARK: SLIDER
struct slider: View {
    var body: some View {
        HStack{
            Color(.white)
                .frame(width: 24, height: 6)
                .clipShape(RoundedRectangle(cornerRadius: 24))
            Color(.white)
                .frame(width: 6, height: 6)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .opacity(0.5)
            Color(.white)
                .frame(width: 6, height: 6)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .opacity(0.5)
        }
        .padding(.bottom,16)
    }
}
// MARK: TRANSACTION SEARCH
struct transactionSearch: View {
    var body: some View {
        HStack{
            Text("Transactions")
                .font(.system(size: 24, weight: .medium, design: .rounded))
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 24, weight: .medium, design: .rounded))
        }
        .padding()
        .foregroundColor(.white)
    }
}
// MARK: ITEM SERVICE
struct itemService: View {
    var title : String
    var first : Bool
    var icon : String
    var value : String
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size:24))
                .frame(width: 24, height: 24)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3266624808, green: 0.3416977525, blue: 0.5977458358, alpha: 1)),Color(#colorLiteral(red: 0.2692086101, green: 0.2299803793, blue: 0.5111849308, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            VStack(alignment: .leading, spacing:6){
                Text(title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                Text("Jan 25, 2021")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .opacity(0.3)
            }
            .foregroundColor(.white)
            Spacer()
            HStack(alignment: .bottom, spacing: 0){
                Text(value)
                    .font(.system(size: first ? 32 : 20, weight: .bold, design: .rounded))
                Text(".00")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .opacity(0.5)
                
            }
            .foregroundColor(.white)
        }
    }
}
// MARK: ITEM LOAN
struct itemLoan: View {
    var body: some View {
        HStack{
            Image("avatar1")
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            VStack(alignment: .leading, spacing:6){
                Text("Samantha")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                Text("Jan 25, 2021")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .opacity(0.3)
            }
            .foregroundColor(.white)
            Spacer()
            HStack(alignment: .bottom, spacing: 0){
                Text("-$190")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text(".00")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .opacity(0.5)
                
            }
            .foregroundColor(.white)
        }
    }
}
// MARK: REMINDER CARD
struct reminderCard: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "bell.fill")
                Text("reminder")
                    .textCase(.uppercase)
                Spacer()
            }
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            HStack(spacing: 16){
                Image("avatar2")
                    .resizable()
                    .scaledToFit()
                    .frame(width:56, height: 56)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                VStack(alignment: .leading){
                    HStack(alignment: .bottom,spacing:0){
                        Group{
                            Text("Send Renata")
                                .padding(.trailing,8)
                            Text("$75")
                        }
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        Text(".00")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .opacity(0.3)
                    }
                    Text("Spli Bill for Mokan Sate")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .opacity(0.3)
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3266624808, green: 0.3416977525, blue: 0.5977458358, alpha: 1)),Color(#colorLiteral(red: 0.2692086101, green: 0.2299803793, blue: 0.5111849308, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}
// MARK: MENU ICON
struct menuIcon: View {
    var icon : String
    var isOpen : Bool
    var body: some View {
        VStack(spacing:8) {
            Image(systemName: icon)
                .font(.system(size: 21, weight: .bold, design: .rounded))
                .foregroundColor(Color(#colorLiteral(red: 0.3533671498, green: 0.3088843524, blue: 0.5807082653, alpha: 1)))
            Circle()
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.8320393562, blue: 0.4334189892, alpha: 1)))
                .frame(width:6, height:6)
                .opacity(isOpen ? 1 : 0)
        }
    }
}
// MARK: MENU BUTTON
struct menuButton: View {
    var body: some View {
        Image(systemName: "plus")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .foregroundColor(.white)
            .frame(width: 56, height: 56)
            .background(Circle()
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.8320393562, blue: 0.4334189892, alpha: 1))))
            .offset(y:-32)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0.8320393562, blue: 0.4334189892, alpha: 1)).opacity(0.7), radius: 10, x: 0.0, y: 8)
    }
}
// MARK: LIST CARD
struct listCard: View {
    var body: some View {
        VStack{
            Color(.white)
                .frame(width: 48, height: 6)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .opacity(0.3)
                .padding(.top,8)
            transactionSearch()
            VStack (spacing: 16) {
                itemService(title: "Fitness", first: true, icon: "bolt.fill", value: "-$190")
                itemLoan()
                itemService(title: "Apple", first: false, icon: "applelogo", value: "-$9")
                reminderCard()
                
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color(#colorLiteral(red: 0.2438170016, green: 0.1901391447, blue: 0.4836845398, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.5), radius: 50, x: 0, y:-1)
    }
}
