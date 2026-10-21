# Mesul Müdür Atama – mobil PWA

**Türkiye / Denizli Eczacı Odası için hazırlanmış, yüklenebilir mobil web uygulamasıdır.**

## Kurulum ve internet yayınlama

Bu klasörü HTTPS ile yayımlayın. GitHub Pages için repoda **Settings > Pages > Build and deployment > Source = GitHub Actions** seçip Pages iş akışını çalıştırın. Site adresi `https://omervar.github.io/mesul-mudur/` olur (Pages aktif edilip yayınlandığında).

- **Android**: Chrome üzerinden siteyi açın. `⋮ > Uygulamayı yükle` veya `Ana ekrana ekle`.
- **iPhone**: Safari üzerinden siteyi açın. `Paylaş > Ana Ekrana Ekle`.
- **Bilgisayar**: Chrome/Edge menüsünden `Uygulamayı yükle`.

Uygulama, `serbest eczaneler.csv` ve `mesul müdür eczacılar.csv` listelerini her cihazda içeri aktarabilir. İki sayfalık PDF, yazdırma menüsü üzerinden oluşturulur. Kaydetme seçiliyse kayıtlar cihazda saklanır. Başlangıçta merkezi senkronizasyon **açık değildir**.

## Kurumsal bulut eşitlemesini bağlama (isteğe bağlı)

T.C. kimlik numaraları ve kişisel veriler içerir. **CSV, atama kayıtları veya logo dosyalarını asla herkese açık GitHub deposuna yüklemeyin.**

1. Kuruma ait Supabase projesi oluşturun; Avrupa bölgesi, MFA ve erişim yetkilendirmesini kurumun veri politikasına göre kurun.
2. `supabase_setup.sql` dosyasını SQL Editor'de çalıştırın. Row Level Security aktif olur; her kullanıcı sadece kendi veri kümesini görebilir.
3. Supabase Authentication üzerinden yalnızca yetkili hesap oluşturun; gerekiyorsa genel kullanıcı kaydını kapatın.
4. `cloud-config.js` dosyasına **Project URL** ve *publishable/anon key* girin (asla service_role gizli anahtarı değil). Siteyi tekrar yayımlayın.
5. Her cihazda **aynı e-posta ve şifreyle** giriş yapın; ilk cihazda listeleri yükleyip **Buluta kaydet** deyin. Diğer cihazda **Buluttan getir** deyin.

**Sınır:** Bu sürümde aynı hesaba bağlı birden çok cihaz birbirini otomatik anlık dinlemez; her cihazda işlem öncesi “Buluttan getir” ile güncel kayıt alınmalıdır. Tek hesaplı sürüm, birbirinden bağımsız personel rolleri sunmaz. Kurumsal ortama almadan önce erişim, saklama, KVKK ve çakışan eşzamanlı kayıt akışları ayrıca değerlendirilmelidir.

## Yerel önizleme

Klasör içinden `python -m http.server 8000` ve `http://localhost:8000` adresini açın. Service worker kurulumu HTTPS veya localhost ister.

## Güvenlik

Herkese açık depo yalnızca program kodu barındırır; kimlik numaraları ve kayıtlar dağıtım paketinin içinde yoktur. Uygulama HTML'den PDF üretir, SMS veya e-imza özelliği barındırmaz. Aday adı ve tarih çakışması için uyarı verir ama hukuki uygunluk kontrolü yapmaz. Bulut hizmeti açılmadan cihazlar arasında veri paylaşımı olmaz.