//
//  ContentView.swift
//  dataModel
//
//  Created by MAC on 02/02/21.
//  Copyright © 2021 MAC. All rights reserved.
//

import SwiftUI

struct ProductModel : Identifiable{
    let id : Int
    let namaProduk : String
    let fotoProduk : String
    let hargaProduk : Int
    let lokasi : String
    let ratingCount : Int
    let jumlahRating : Int
    
    init(id: Int, namaProduk : String,fotoProduk : String,hargaProduk: Int,lokasi : String,ratingCount: Int,jumlahRating: Int){
        
        self.id = id
        self.namaProduk = namaProduk
        self.fotoProduk = fotoProduk
        self.hargaProduk = hargaProduk
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
}

struct ContentView: View {
    
    let data : [ProductModel] = [
        ProductModel(id: 1, namaProduk: "Polygon", fotoProduk: "s1", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 2, namaProduk: "Polygon", fotoProduk: "s2", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 3, namaProduk: "Polygon", fotoProduk: "s3", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 4, namaProduk: "Polygon", fotoProduk: "s4", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 5, namaProduk: "Polygon", fotoProduk: "s5", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 6, namaProduk: "Polygon", fotoProduk: "s6", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 7, namaProduk: "Polygon", fotoProduk: "s7", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56),
        ProductModel(id: 8, namaProduk: "Polygon", fotoProduk: "s8", hargaProduk: 2000000, lokasi: "Kab.Banyuwangi", ratingCount: 3, jumlahRating: 56)
    ]
    
    @State var jumlahkeranjang: Int = 0
    
    var body: some View {
        //        Product()
        NavigationView {
            ScrollView {
                ForEach(data) { row in
                    VStack(spacing:10) {
                        //baca data binding dari Produk komponent
                        Product(data: row, jumlahproduk: self.$jumlahkeranjang)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Sepeda")
            .navigationBarItems(
                trailing:
                HStack(spacing: 20){
                    Button(action: {print()})
                    {
                        Image(systemName: "person.fill")
                    }
                    //komponent baru untuk menampilkan data ke keranjang
                    keranjangView(jumlah: $jumlahkeranjang)
                    
                }
            )
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct keranjangView : View {
    @Binding var jumlah: Int
    
    var body : some View {
        ZStack{
            Button(action: {print("Oke")}){
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width:20, height:20)
                
            }
            
            Text("\(jumlah)")
                .foregroundColor(Color.white)
                .frame(width:10, height:10)
                .font(.body)
                .padding(5)
                .background(Color.red)
                .clipShape(Circle())
                .offset(x:10,y:-10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product : View {
    
    let data: ProductModel
    //tampung ke binding agar bisa dibaca oleh content view
    @Binding var jumlahproduk: Int
    
    var body : some View {
        VStack(alignment:.leading){
            //foto
            ZStack(alignment:.topTrailing){
                Image(self.data.fotoProduk)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height:250)
                    .clipped()
                
                Button(action: {print("OK")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(Color.red)
                }
            }
            
            Text(self.data.namaProduk)
                .font(.title)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp.\(self.data.hargaProduk)")
                .font(.title)
                .foregroundColor(Color.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            
            
            HStack{
                HStack{
                    
                    ForEach(0..<self.data.ratingCount){
                        items in
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                    
                }
            }
            .padding(.leading)
            .padding(.trailing)
            //buat komponen baru jumlah
            //ambil data binding dari komponen tambahkeranjang
            tambahKeranjang(jumlah: $jumlahproduk)
        }
        .background(Color("warna"))
        .cornerRadius(15)
    }
}

//button tambah keranjang
struct tambahKeranjang : View {
    //buat binding data
    @Binding var jumlah: Int
    
    var body : some View {
        Button(action: {self.jumlah += 1}){
            HStack {
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Tambah ke Keranjang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding()
    }
}
