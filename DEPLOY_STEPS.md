# Langkah-langkah Deploy ke GitHub Pages

## Prasyarat
- Repository GitHub: `richardparulian/portfolify` (sesuaikan dengan nama Anda)
- GitHub Actions sudah enabled
- Git terinstall di komputer

---

## Step 1: Setup GitHub Repository (WAJIB Dilakukan Sekali)

### 1.1 Enable GitHub Pages
1. Buka repository di GitHub
2. Pergi ke **Settings** → **Pages**
3. Pada "Source", pilih **GitHub Actions** (bukan "Deploy from a branch")
4. Klik **Save**

### 1.2 Enable Workflow Permissions
1. Pergi ke **Settings** → **Actions** → **General**
2. Scroll ke bawah sampai "Workflow permissions"
3. Pilih **Read and write permissions**
4. Checklist: "Allow GitHub Actions to create and approve pull requests"
5. Klik **Save**

---

## Step 2: Test Build Lokal

Sebelum push, test build lokal untuk memastikan tidak ada error:

### Jalankan script test:
```bash
chmod +x test-build.sh
./test-build.sh
```

Atau manual:
```bash
flutter clean
flutter pub get
flutter build web --base-href "/portfolify/"
```

### Test hasil build:
```bash
cd build/web
python3 -m http.server 8080
```
Lalu buka: `http://localhost:8080`

Jika semua OK, lanjut ke Step 3.

---

## Step 3: Push ke GitHub

Workflow sudah diperbaiki! Sekarang push perubahan:

```bash
git add .
git commit -m "Fix GitHub Pages deployment workflow"
git push origin main
```

---

## Step 4: Monitor Deployment

### 4.1 Cek Workflow
1. Buka repository di GitHub
2. Pergi ke tab **Actions**
3. Lihat workflow "Deploy to GitHub Pages" berjalan
4. Klik pada workflow run untuk melihat detail

### 4.2 Expected Duration
- Flutter setup: ~1-2 menit (pertama kali)
- Install dependencies: ~1 menit
- Build web: ~2-3 menit
- Deploy: ~1 menit

**Total:** ~5-7 menit

### 4.3 Cek Hasil
Setelah workflow berhasil:
1. Pergi ke Settings → Pages
2. URL akan muncul di bagian atas, misalnya:
   - `https://richardparulian.github.io/portfolify/`
3. Buka URL tersebut di browser

---

## Troubleshooting

### ❌ Workflow Failed: "Resource not accessible by integration"
**Solusi:** Ikuti langkah 1.2 di atas untuk enable workflow permissions.

### ❌ Workflow Failed: "flutter: command not found"
**Solusi:** Flutter action gagal setup. Cek:
- Workflow sudah menggunakan `subosito/flutter-action@v2`
- Flutter version di-set ke `3.24.0`

### ❌ Build Failed: "Could not resolve dependencies"
**Solusi:** Run `flutter clean` dan `flutter pub get` lokal dulu, pastikan semua dependencies terinstall.

### ❌ Website 404
**Solusi:**
1. Cek Settings → Pages apakah sudah enabled
2. Pastikan "Source" di-set ke "GitHub Actions"
3. Pastikan base-href di workflow sesuai dengan nama repository

### ❌ Images/Assets tidak muncul
**Solusi:**
1. Pastikan folder `assets/` ada di root project
2. Cek `pubspec.yaml` assets configuration
3. Pastikan images ada di lokasi yang benar

---

## Manual Trigger Deployment

Jika ingin trigger deployment tanpa push:

1. Buka GitHub repository
2. Pergi ke tab **Actions**
3. Pilih workflow "Deploy to GitHub Pages"
4. Klik tombol **Run workflow** (hijau di sebelah kanan)
5. Pilih branch `main`
6. Klik **Run workflow** (tombol hijau)

---

## Cek Status Workflow di Terminal

Gunakan GitHub CLI (jika terinstall):

```bash
gh run list --repo richardparulian/portfolify
```

Lihat detail workflow:
```bash
gh run view <run-id>
```

---

## Tips

### 1. Base-Href
Base-href harus sesuai dengan nama repository:
- Repository: `username/portfolify` → `/portfolify/`
- Repository: `username.github.io` → `/`

### 2. Branch Name
Workflow trigger pada push ke branch `main`. Jika branch Anda bernama `master`, edit file `.github/workflows/deploy.yml`:
```yaml
on:
  push:
    branches: [ master ]  # ubah dari main ke master
```

### 3. Flutter Version
Flutter 3.24.0 sudah terverifikasi compatible dengan project ini. Jika ingin upgrade, ubah di workflow:
```yaml
flutter-version: '3.27.0'  # atau versi terbaru
```

---

## Catatan Penting

### Files yang perlu dicommit:
- ✅ `.github/workflows/deploy.yml` (sudah diperbaiki)
- ✅ `GITHUB_PAGES_SETUP.md` (dokumentasi)
- ✅ `DEPLOY_STEPS.md` (file ini)
- ✅ `test-build.sh` (script testing)

### Files yang tidak perlu di-commit:
- `build/` folder (akan di-generate otomatis)
- `.dart_tool/` folder
- `.flutter-plugins-dependencies` (di-generate otomatis)

---

## Next Steps

Setelah deployment berhasil:

1. ✅ Buka website di `https://username.github.io/portfolify/`
2. ✅ Test semua links dan functionality
3. ✅ Test di mobile responsive (gunakan DevTools browser)
4. ✅ Test light/dark mode toggle
5. ✅ Test scroll navigation
6. ✅ Test semua sections (Home, About, Services, Portfolio, Contact)

---

## Support

Jika masih mengalami masalah:

1. Lihat log di GitHub Actions untuk detail error
2. Test build lokal terlebih dahulu
3. Cek GitHub Pages status: https://www.githubstatus.com/
4. Buka issue di GitHub repository
