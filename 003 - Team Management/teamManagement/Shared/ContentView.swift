//
//  ContentView.swift
//  Shared
//
//  Created by Dactrtr on 11-08-20.
//

import SwiftUI

var teamOne = [
    Members(title: "Designer", color: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), tasks: "14"),
    Members(title: "Developer", color: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), tasks: "3"),
    Members(title: "Designer", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), tasks: "31"),
]
var studioData = [
    Studio(isOpen: false,color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "Street Spiders", letter: "S", members: teamOne, teamLead: "Peter Parker"),
    Studio(isOpen: false,color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), name: "Dope Dogs", letter: "D", members: teamOne, teamLead: "Poochie Dog"),
    Studio(isOpen: true,color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), name: "Juici Jaspers", letter: "J", members: teamOne, teamLead: "Mike Orange"),
]

struct ContentView: View {
    @State var studios = studioData
    var body: some View {
        GeometryReader { pos in
            ZStack {
                VStack(alignment: .center, spacing: 8.0) {
                    
                    ForEach(studios.indices, id:\.self) { index in
                        
                        GeometryReader { geo in
                            cardMenu(isOpen: $studios[index].isOpen, name: studios[index].name, color: studios[index].color, letter: studios[index].letter, members: studios[index].members, teamLead: studios[index].teamLead)
                                .offset(y: studios[index].isOpen ? -geo.frame(in: .global).minY : 0)

                        }
                        .frame(maxHeight: studios[index].isOpen ? .infinity : CGFloat(180))
                        .zIndex( studios[index].isOpen ? 1 : 0)
                    }
                }
                .frame(maxWidth:.infinity, maxHeight: .infinity)
            }
            .background(Color("background"))
        }
        .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct cardMenu: View {
    
    @Binding var isOpen : Bool
    var name : String
    var color : UIColor
    var letter : String
    var members : [Members]
    var teamLead : String
    
    @State var cardState = CGSize.zero
    
    var body: some View {
        ZStack{
            VStack {
                circleHeader(isOpen: $isOpen, color: color, letter: letter, name: name)
                Text(name)
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .opacity(isOpen ? 0 : 1)
            }
            .onTapGesture{
                withAnimation(.spring()){
                    self.isOpen.toggle()
                }
            }
            ZStack {
                cardContent(isOpen: $isOpen, members: members, teamLead: teamLead)
                    .offset(y: cardState.height)
                    .gesture(
                        DragGesture().onChanged{ value in
                            self.cardState = value.translation
                            if self.cardState.height < 0 {
                                self.cardState.height = 0
                            }
                        }
                        .onEnded { value in
                            if self.cardState.height > 100{
                                withAnimation(.spring()){
                                    isOpen.toggle()
                                }
                            }
                            self.cardState = .zero
                        }
                )
                bottomMenu()
                    .position(x: screen.width/2,y: isOpen ? screen.height-40: screen.height+200)
            }
            
        }
        .frame(height: isOpen ? screen.height: 180)
        .frame(maxWidth:.infinity)
    }
}

let screen = UIScreen.main.bounds

struct Studio: Identifiable{
    var id = UUID()
    var isOpen : Bool
    var color : UIColor
    var name : String
    var letter: String
    var members : [Members]
    var teamLead : String
    
}
struct Members : Identifiable{
    var id = UUID()
    var title : String
    var color : UIColor
    var tasks : String
}


struct circleHeader: View {
    @Binding var isOpen : Bool
    var color : UIColor
    var letter : String
    var name : String
    var body: some View {
        ZStack (alignment: isOpen ? .top : .center){
            Color(color)
            Color(.white)
                .frame(width: 100, height: 100)
                .mask(
                    Image("dots")
                )
                .scaleEffect(2)
                .position(x: isOpen ? 260:80,y: isOpen ? 80:80)
                .opacity(0.4)
            Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
                .frame(width: 120,height:120)
                .mask(
                    Image("lines-1")
                    
                )
                .scaleEffect(2.5)
                .offset(x:isOpen ? -120: 0, y: isOpen ? 40: 80)
                .opacity(0.3)
                .blendMode(.luminosity)
            Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
                .mask(
                    Image("lines-2")
                        .scaleEffect(isOpen ? 2.5: 2)
                        .frame(alignment: isOpen ? .center:.top)
                )
                .frame(width: isOpen ? CGFloat(180) : CGFloat(80), height: isOpen ? CGFloat(50) : CGFloat(80))
                .offset(x: isOpen ? 140 : 20, y: isOpen ? 30 : -20)
                .blendMode(.difference)
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .mask(
                    Image("lines-1")
                        .scaleEffect(2.5)
                        .frame(alignment: .top)
                )
                .offset(x: isOpen ? 100:0)
                .blendMode(.colorBurn)
            Text(letter)
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .opacity(isOpen ? 0:1)
            VStack {
                HStack {
                    Text(name)
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .kerning(0.8)
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .opacity(isOpen ? 0.9 : 0)
                    Spacer()
                }
                .padding(.horizontal,isOpen ? CGFloat(32) : 0)
                .padding(.top, isOpen ? CGFloat(48) : 0)
            }
        }
        .frame(maxWidth:isOpen ? .infinity : CGFloat(120), maxHeight: isOpen ? .infinity : CGFloat(120))
        .clipShape(RoundedRectangle(cornerRadius:isOpen ? 16:64, style: isOpen ? .continuous: .circular))
    }
}

struct cardContent: View {
    
    @Binding var isOpen : Bool
    var members : [Members]
    var teamLead : String
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Rectangle()
                .frame(width: 60, height: 6)
                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                .cornerRadius(3.0)
                .opacity(0.1)
            HStack {
                
                Text(teamLead)
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    .padding(.leading, 16)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 16.0) {
                    ForEach(members.indices, id:\.self){ index in
                        VStack(alignment: .leading, spacing:0) {
                            ZStack{
                                
                                Image(members[index].title)
                                    .resizable()
                                Color(members[index].color)
                                    .opacity(0.5)
                                    .blendMode(.darken)
                                
                            }
                            .frame(width: 180, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            Text(members[index].title)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                .padding(.top,24)
                            Group {
                                Text(members[index].tasks).font(.system(size: 16, weight: .bold, design: .rounded))
                                    + Text(" tasks").font(.system(size: 16, weight: .semibold, design: .rounded))
                            }
                            .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .padding(.top,2)
                            
                        }
                    }
                }
                .padding(.horizontal,16)
            }
            VStack(alignment: .leading) {
                Text("Activity List")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding(.bottom,24)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                ScrollView(.vertical, showsIndicators: false){
                    activityItem(description: "Activity done at 16:00 with some sort of black sourcery", hour: "16:00", avatar: "avatar-")
                    Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
                        .frame(width: 240, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .opacity(0.4)
                        .padding(.leading, 96)
                    activityItem(description: "Did you get that sourcery instead of sorcery, yup that's DOS", hour: "13:37", avatar: "avatar-2")
                }
            }
            .padding(16)
            Spacer()
            
        }
        .padding(.top,8)
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .offset(y: isOpen ? 128: screen.size.height+500)
        
            
    }
}

struct activityItem: View {
    var description : String
    var hour : String
    var avatar : String
    var body: some View {
        HStack(spacing: 32) {
            Image("avatar-1")
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(description)
                    .font(.system(size:16,weight:.regular, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                Text(hour)
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
            }
        }
    }
}

struct bottomMenu: View {
    var body: some View {
        HStack(spacing: 32) {
            Image(systemName: "house")
            Image(systemName: "folder")
            Image(systemName: "bubble.right.fill")
            Image(systemName: "envelope")
            Image(systemName: "person.crop.circle")
        }
        .padding(.bottom,16)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        .frame(height: 88)
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(24)
        .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 12, x: 0, y: 5)
    }
}
