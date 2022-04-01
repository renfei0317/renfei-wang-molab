//
//  ContentView.swift
//  Photopicker
//
//  Created by Renfei on 2022/3/31.
//

import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
       let frist = UserDefaults.standard.bool(forKey:"Frist")
        if frist == false {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
        }
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

struct ContentView: View {
    @State var showImagePicker:Bool = false
    @State var image = UIImage(named: "Avatar")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var imageArray:Array<String>?
   
    func loadImage() {
        
        let imageSaver = ImageSaver()
        for value in imageArray! {
            imageSaver.writeToPhotoAlbum(image: UIImage(named: value)!)
        }
        UserDefaults.standard.set(true, forKey: "Frist")
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Button(action: {
                imageArray = ["pic1","pic2","pic3",
                              "pic4","pic5","pic6",
                              "pic7","Avatar2"];
                sourceType = .photoLibrary
                showImagePicker.toggle()
            }) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(isPresented: $showImagePicker, selectedImage: $image, sourceType: $sourceType)
            }
            VStack(alignment: .leading, spacing:10) {
                Text("Renfei")
                    .foregroundColor(Color.black)
                    .bold()
                    .font(Font.system(size: 30))
                Text("Add profile pics")
                    .foregroundColor(Color.black)
            }
            
            .onChange(of: imageArray) { newValue in
                loadImage()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        
        ContentView()
        
    }
}

struct ImagePickerView:UIViewControllerRepresentable{
    @Binding var isPresented:Bool
    @Binding var selectedImage:UIImage
    @Binding var sourceType: UIImagePickerController.SourceType
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator:NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
        
        var parent:ImagePickerView
        init(parent:ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage{
                self.parent.selectedImage = selectedImage
                
                self.parent.isPresented = false
            }
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.allowsEditing = false
        controller.sourceType = sourceType
        controller.delegate = context.coordinator
        return controller
    }
}
