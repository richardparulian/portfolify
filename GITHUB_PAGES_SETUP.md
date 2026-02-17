# GitHub Pages Setup Guide for Portfolify

## Checklist Sebelum Deploy

### 1. GitHub Pages Settings
✅ Masuk ke repository di GitHub
✅ Pergi ke Settings → Pages
✅ Set "Source" ke **GitHub Actions** (bukan "Deploy from a branch")
✅ Klik Save

### 2. Workflow Permissions
✅ Masuk ke Settings → Actions → General
✅ Scroll ke "Workflow permissions"
✅ Pilih **Read and write permissions**
✅ Checklist "Allow GitHub Actions to create and approve pull requests"
✅ Klik Save

### 3. Verifikasi Repository Name
Pastikan base-href di workflow sesuai dengan nama repository:
- Repository: `portfolify`
- Base-href: `/portfolify/` (sudah benar)

### 4. Perbaiki Workflow (jika masih gagal)

Ada beberapa perbaikan yang bisa dilakukan pada workflow file:

#### A. Tambahkan Flutter pub get
Workflow saat ini tidak menjalankan `flutter pub get` sebelum build.

#### B. Tambahkan cache untuk dependencies
Untuk mempercepat build dan menghindari download ulang.

#### C. Pastikan Flutter SDK compatibility
Flutter 3.24.0 dengan SDK ">=3.0.0 <4.0.0" seharusnya compatible.

---

## Troubleshooting Steps

### Cek Workflow Run
1. Masuk ke **Actions** tab di GitHub
2. Klik pada failed workflow terbaru
3. Lihat log error pada step yang gagal

### Error Umum dan Solusi

#### Error 1: "Resource not accessible by integration"
**Penyebab:** Workflow permissions tidak di-set ke "Read and write"
**Solusi:** Ikuti langkah #2 di atas

#### Error 2: "flutter: command not found"
**Penyebab:** Flutter action gagal setup
**Solusi:** Tambahkan step untuk cache Flutter

#### Error 3: "Failed to build"
**Penyebab:** Dependencies tidak terinstall
**Solusi:** Tambahkan `flutter pub get` sebelum build

#### Error 4: 404 saat deploy
**Penyebab:** Base-href tidak sesuai atau Pages tidak enabled
**Solusi:** Cek setting Pages dan base-href

---

## Workflow yang Diperbaiki

Copy konten ini ke `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.0'
          channel: 'stable'
          cache: true

      - name: Install dependencies
        run: flutter pub get

      - name: Build Web
        run: flutter build web --base-href "/portfolify/"

      - name: Upload Pages artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: build/web

  deploy:
    runs-on: ubuntu-latest
    needs: build
    permissions:
      pages: write
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

---

## Test Deployment

### Manual Trigger
1. Pergi ke Actions tab
2. Pilih "Deploy to GitHub Pages" workflow
3. Klik "Run workflow" → "Run workflow" (button hijau)

### Cek Hasil Deploy
Setelah berhasil:
1. Pergi ke Settings → Pages
2. Lihat URL di bagian atas (biasanya: `https://username.github.io/portfolify/`)
3. Buka URL tersebut

---

## Catatan Penting

### Base-Href
Pastikan base-href sesuai dengan format:
- Repository: `username/portfolify` → base-href: `/portfolify/`
- Repository: `username.github.io` → base-href: `/`

### Branch Name
Workflow hanya trigger saat push ke branch `main`. Jika branch Anda bernama `master`, ubah:
```yaml
on:
  push:
    branches: [ main ]  # Ganti ke master jika perlu
```

### Cache
Cache pada workflow akan:
- Mempercepat build time
- Menghindari download ulang Flutter SDK
- Menghindari download ulang dependencies

---

## Debug Tips

### 1. Enable Debug Logging
Di workflow, tambahkan env:
```yaml
env:
  ACTIONS_STEP_DEBUG: true
  ACTIONS_RUNNER_DEBUG: true
```

### 2. Cek Build Output
Jika build gagal, lihat log step "Build Web" untuk detail error.

### 3. Test Locally
Sebelum push, test build locally:
```bash
flutter clean
flutter pub get
flutter build web
```

Jika berhasil, folder `build/web` akan tergenerate.
