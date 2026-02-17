#!/bin/bash

# Script untuk test build web secara lokal sebelum deploy ke GitHub Pages

echo "🔧 Starting Flutter web build test..."

# Step 1: Clean previous build
echo "📦 Cleaning previous build..."
flutter clean

# Step 2: Get dependencies
echo "📥 Installing dependencies..."
flutter pub get

# Step 3: Build web with base-href
echo "🚀 Building web for GitHub Pages..."
flutter build web --base-href "/portfolify/"

# Step 4: Check if build was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful!"
    echo "📁 Build artifacts are in: build/web/"
    echo ""
    echo "To test locally, run:"
    echo "  cd build/web"
    echo "  python3 -m http.server 8080"
    echo ""
    echo "Then open: http://localhost:8080"
    echo ""
    echo "Or use Node.js:"
    echo "  cd build/web"
    echo "  npx serve"
    echo ""
else
    echo ""
    echo "❌ Build failed! Please check the errors above."
    exit 1
fi
