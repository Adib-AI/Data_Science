# Oil Price

#Pada file ini menggunakan dua model machine learning,
  * K-Means (For Clustering Data)
  * Linear Regression
  * Random Forest (n_estimators = 100, max depth = 4)


Hasil data predict kedua algortima,
  * MSE Linear Regression : 28340.0
  * Random Forest : prediksi yang cukup jauh dari data sebenarnya

Hipotesis kemungkinan cukup buruknya model yang dihasilkan :
  * Penggunaan metode modus dan mean yang tidak cocok untuk mengisi data bersifat NaN
  * Mehasilkan nilai bias dari penggunan dua metode diatas
  
Saran :
  * Bisa menggunakan metode lain untuk memperbaiki data
