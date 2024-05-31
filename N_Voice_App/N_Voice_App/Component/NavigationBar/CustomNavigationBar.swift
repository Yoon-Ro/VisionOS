//
//  CustomNavigationBar.swift
//  N_Voice_App
//
//  Created by Yoon Ro on 2024-05-30.
//

import SwiftUI

struct CustomNavigationBar: View {
    let isDisplayLeftBtn: Bool
    let isDisplayRightBtn: Bool
    
    let leftBtnAction: () -> Void
    let rightBtnAction: () -> Void
    let rightBtnType: NavigationBtnType
    
    init(
        isDisplayLeftBtn: Bool = true,
        isDisplayRightBtn: Bool = true,
        leftBtnAction: @escaping () -> Void = {},
        rightBtnAction: @escaping () -> Void = {},
        rightBtnType: NavigationBtnType = .edit) {
        self.isDisplayLeftBtn = isDisplayLeftBtn
        self.isDisplayRightBtn = isDisplayRightBtn
        self.leftBtnAction = leftBtnAction
        self.rightBtnAction = rightBtnAction
        self.rightBtnType = rightBtnType
    }
    
    
    var body: some View {
            
        HStack{
            if isDisplayLeftBtn{
                Button( action: leftBtnAction, label: { Image(systemName: "arrow.left")})
            }
            Spacer()
            
            if isDisplayRightBtn{
                Button( action: rightBtnAction, label: {
                    if rightBtnType == .close {
                        Image(systemName: "xmark")
                    } else { Text(rightBtnType.rawValue)}
                })
            }
        }.frame(height: 20).padding(20)
        
    }
}

#Preview {
    CustomNavigationBar()
}
