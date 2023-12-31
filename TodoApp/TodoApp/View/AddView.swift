//
//  AddView.swift
//  TodoApp
//
//  Created by Chihiro Asanoma on 2023/07/13.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var textFieldText : String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                    .cornerRadius(10)
                Button {
                    saveButtonTapped()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                }

            }.padding(16)
        }.navigationTitle("Add an Item")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonTapped(){
        if textIsValid(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your todo item should contain at least 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
