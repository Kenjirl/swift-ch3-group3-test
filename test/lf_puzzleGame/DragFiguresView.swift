//
//  DragFiguresView.swift
//  test
//
//  Created by Calogero Friscia on 25/05/26.
//

import SwiftUI
import Combine

struct DragItem:Identifiable {
    
    let id:String = UUID().uuidString
    
    let asset:String
    
}

internal class DragViewModel:ObservableObject {
    
    let dragItems:[DragItem] = [
        
        DragItem(asset: "puzzle_item_1"),
        DragItem(asset: "puzzle_item_2"),
      //  DragItem(asset: "puzzle_item_3"),
      //  DragItem(asset: "puzzle_item_4"),
        
    ]
    
}

struct DragFiguresView: View {
    
    @StateObject private var puzzleVM:DragViewModel = DragViewModel()
    
    var body: some View {
        
        ZStack {
            
            DragBackgroundArea()
            
            DragFiguresArea()
            
        }
        .environmentObject(puzzleVM)
        
    }
}

struct DragFiguresArea:View {
    
    @EnvironmentObject var puzzleVM:DragViewModel
    
    var body: some View {
        
        HStack {
            
            UpperView()
            
            
        }
        
    }
}

struct DragBackgroundArea:View {
    
    var body: some View {
        
        HStack(spacing:0) {
            
            Color.orange
                .ignoresSafeArea()
                  .frame(width:500)
              
              Rectangle()
                  .frame(width: 5)
                    .ignoresSafeArea()
              
            Color.green
                .ignoresSafeArea()
            
            
        }
    }
}

#Preview {
    DragFiguresView()
}

struct UpperView:View {
    
    @EnvironmentObject var puzzleVM:DragViewModel
    
    
    var body: some View {
        
        VStack {
            
            ForEach(puzzleVM.dragItems) { item in
                
                ZStack {
                    DragObject(item: item)
                        .frame(maxWidth: 200, maxHeight: 140)
                    
                    DragObject(item: item,isDragEnabled: true)
                        .frame(maxWidth: 200, maxHeight: 140)
                }
                
            }
            
            
        }
    }
}


struct DragObject:View {
    
    @EnvironmentObject var puzzleVM:DragViewModel
    
    let item:DragItem
    var isDragEnabled:Bool = false
    
    @State private var isDragSuccess:Bool?
    
    @State private var scaleEffect:CGFloat = 0.5
    
    @State private var xOffset:CGFloat = 0
    @State private var yOffset:CGFloat = 0
    
    var body: some View {
        
            // RoundedRectangle(cornerRadius: 20)
             Image(item.asset)
                 .resizable()
                 .scaledToFit()
                 .clipShape(RoundedRectangle(cornerRadius: 15))
                 
                 .opacity(isDragEnabled ? 1.0 : 0.5)
                 .overlay(alignment: .topTrailing, content: {
                     if isDragSuccess == true {
                         Image(systemName: "circle.fill")
                             .foregroundStyle(Color.green)
                     } else if isDragSuccess == false {
                         Image(systemName: "circle.fill")
                             .foregroundStyle(Color.red)
                         
                     } else { }
                 })
                 .overlay(alignment: .bottom, content: {
                     if isDragEnabled {
                         Text("x: \(xOffset) y: \(yOffset)")
                     }
                 })
                 .scaleEffect(x: isDragEnabled ? scaleEffect : 1, y: isDragEnabled ? scaleEffect : 1)
                 .offset(x:xOffset,y:yOffset)
        
                 //.position(x:xOffset,y:yOffset)
                 .gesture(drag,isEnabled: isDragEnabled)
                 .disabled(isDragSuccess == true)
                 
                 .onAppear {
                     
                     if isDragEnabled {
                         
                         self.xOffset = 300
                         self.yOffset = 0
                     }
    
                     
                     
                 }
               
        
    }
    
    // --- gesture logic
    
    private var drag: some Gesture {
        
           DragGesture()
               .onChanged { value in
                   
                   self.isDragSuccess = isDragSuccess != true ? nil : isDragSuccess
                   
                   xOffset = value.location.x
                   yOffset = value.location.y
                   
                   withAnimation(.easeInOut(duration: 0.5)) {
                       scaleEffect = 1.0
                   }
//                   let currentX = value.location.x
//                   
//                   if currentX >= 0 &&
//                        currentX < localVM.swipeEndPoint {
//                       
//                       withAnimation {
//                           localVM.positionX = value.location.x
//                           
//                       }
//                   }
//                   
//                   if localVM.sidetextOpacity > 0.0 &&
//                        localVM.sidetextOpacity <= 1.0 { localVM.sidetextOpacity -= 0.01 }
                   
                    }
               .onEnded { value in
                   // adjust offset. If the user move even a little the icon will be moved completely to the start or the end
                 let xCondition = xOffset >= -50 && xOffset <= 50
                 let yCondition = yOffset >= -25 && yOffset <= 25
                   
                  if xCondition && yCondition {
                       withAnimation {
                          xOffset = 0
                           yOffset = 0
                           self.isDragSuccess = true
                          // self.isDragEnabled.toggle()
                      }
                  } else {
                      
                      withAnimation {
                         xOffset = 300
                          yOffset = 0
                          self.isDragSuccess = false
                          scaleEffect = 0.5
                         // self.isDragEnabled.toggle()
                     }
                      
                  }
                   
//                   let endPosition = value.location.x
//                   
//                   switch localVM.swipeMove {
//                   case .toRight:
//                       localVM.dragToRigh(userEndPoint: endPosition)
//                   case .toLeft:
//                       localVM.dragToLeft(userEndPoint: endPosition)
//                   }
//                   
//                   withAnimation {
//                       localVM.sidetextOpacity = 1.0
//                   }

               }
       }
}
