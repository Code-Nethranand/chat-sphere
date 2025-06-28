#!/bin/bash

echo "🚀 Starting Chat-Sphere Deployment..."

# Check if .env file exists in backend
if [ ! -f "backend/.env" ]; then
    echo "❌ Error: backend/.env file not found!"
    echo "Please create backend/.env file with your environment variables"
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
npm install --prefix backend
npm install --prefix frontend

# Build frontend
echo "🔨 Building frontend..."
npm run build --prefix frontend

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Frontend build successful!"
else
    echo "❌ Frontend build failed!"
    exit 1
fi

echo "🎉 Build completed successfully!"
echo ""
echo "Next steps:"
echo "1. Deploy to your chosen platform (Railway, Render, Heroku, etc.)"
echo "2. Set environment variables in your hosting platform"
echo "3. Update CORS settings if needed"
echo "4. Test your deployment"
echo ""
echo "See DEPLOYMENT_GUIDE.md for detailed instructions" 