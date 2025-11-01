import pandas as pd
import matplotlib.pyplot as plt

# CSV okumak
coloumn_name_users = ['user_id', 'name', 'surname', 'email', 'phone_number', 'city']
df_users = pd.read_csv("/Users/onurtezel/postgres_public_users_2.csv", names=coloumn_name_users)

coloumn_name_receipts = ['receipt_id','user_id','total_amount','payment_method','store_name','store_category','items_json','tax_amount']
df_receipts = pd.read_csv("/Users/onurtezel/postgres_public_receipts.csv", names=coloumn_name_receipts)

# --- 1) Şehirlere göre kullanıcı sayısı
city_counts = df_users['city'].value_counts()
x_pos = range(1, len(city_counts)+1)
plt.figure(figsize=(8,5))
plt.bar(x_pos, city_counts.values, color='skyblue')
plt.xticks(x_pos, city_counts.index, rotation=45)
plt.title('Şehirlere Göre Kullanıcı Sayısı')
plt.xlabel('Şehir')
plt.ylabel('Kullanıcı Sayısı')
plt.tight_layout()
plt.show()

# --- 2) Mağazalara göre toplam harcama
store_total = df_receipts.groupby('store_name')['total_amount'].sum().sort_values(ascending=False)
x_pos = range(1, len(store_total)+1)
plt.figure(figsize=(8,5))
plt.bar(x_pos, store_total.values, color='orange')
plt.xticks(x_pos, store_total.index, rotation=45)
plt.title('Mağazalara Göre Toplam Harcama')
plt.xlabel('Mağaza')
plt.ylabel('Toplam Tutar')
plt.tight_layout()
plt.show()

# --- 3) Ödeme yöntemine göre ortalama fiş tutarı
payment_avg = df_receipts.groupby('payment_method')['total_amount'].mean()
x_pos = range(1, len(payment_avg)+1)
plt.figure(figsize=(6,4))
plt.bar(x_pos, payment_avg.values, color='green')
plt.xticks(x_pos, payment_avg.index)
plt.title('Ödeme Yöntemine Göre Ortalama Fiş Tutarı')
plt.xlabel('Ödeme Yöntemi')
plt.ylabel('Ortalama Tutar')
plt.tight_layout()
plt.show()

# --- 4) Kullanıcı başına toplam harcama
user_total = df_receipts.groupby('user_id')['total_amount'].sum().sort_index()
x_pos = range(1, len(user_total)+1)
plt.figure(figsize=(8,5))
plt.bar(x_pos, user_total.values, color='purple')
plt.xticks(x_pos, user_total.index)
plt.title('Kullanıcı Başına Toplam Harcama')
plt.xlabel('User ID')
plt.ylabel('Toplam Harcama')
plt.tight_layout()
plt.show()
