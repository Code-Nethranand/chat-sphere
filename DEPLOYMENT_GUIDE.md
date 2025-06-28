# Chat-Sphere Deployment Guide

## Prerequisites
- Node.js (v16 or higher)
- MongoDB Atlas account
- Cloudinary account
- Git repository

## Step 1: Prepare Environment Variables

Create a `.env` file in the `backend/` directory with the following variables:

```env
# Server Configuration
PORT=5000
NODE_ENV=production

# MongoDB Connection
MONGODB_URI=your_mongodb_atlas_connection_string

# JWT Secret
JWT_SECRET=your_secure_jwt_secret_key

# Cloudinary Configuration
CLOUDINARY_CLOUD_NAME=your_cloudinary_cloud_name
CLOUDINARY_API_KEY=your_cloudinary_api_key
CLOUDINARY_API_SECRET=your_cloudinary_api_secret
```

## Step 2: Set Up MongoDB Atlas

1. Go to [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Create a free cluster
3. Create a database user with read/write permissions
4. Get your connection string and replace `your_mongodb_atlas_connection_string` in your `.env` file

## Step 3: Set Up Cloudinary

1. Go to [Cloudinary](https://cloudinary.com/)
2. Create a free account
3. Get your cloud name, API key, and API secret
4. Replace the Cloudinary variables in your `.env` file

## Step 4: Choose Deployment Platform

### Option A: Deploy to Railway (Recommended for beginners)

1. **Sign up for Railway**
   - Go to [Railway](https://railway.app/)
   - Sign up with your GitHub account

2. **Connect your repository**
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your Chat-Sphere repository

3. **Configure the deployment**
   - Railway will automatically detect it's a Node.js app
   - Set the root directory to `/backend`
   - Add environment variables in Railway dashboard

4. **Deploy**
   - Railway will automatically build and deploy your app
   - Get your production URL

### Option B: Deploy to Render

1. **Sign up for Render**
   - Go to [Render](https://render.com/)
   - Sign up with your GitHub account

2. **Create a new Web Service**
   - Connect your GitHub repository
   - Set build command: `npm install && npm run build`
   - Set start command: `npm start`
   - Set root directory to `/backend`

3. **Configure environment variables**
   - Add all variables from your `.env` file

4. **Deploy**
   - Render will build and deploy automatically

### Option C: Deploy to Heroku

1. **Install Heroku CLI**
   ```bash
   npm install -g heroku
   ```

2. **Create Heroku app**
   ```bash
   heroku create your-chat-sphere-app
   ```

3. **Add MongoDB addon**
   ```bash
   heroku addons:create mongolab
   ```

4. **Set environment variables**
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set JWT_SECRET=your_jwt_secret
   heroku config:set CLOUDINARY_CLOUD_NAME=your_cloud_name
   heroku config:set CLOUDINARY_API_KEY=your_api_key
   heroku config:set CLOUDINARY_API_SECRET=your_api_secret
   ```

5. **Deploy**
   ```bash
   git push heroku main
   ```

## Step 5: Update Frontend Configuration

After deploying your backend, update the frontend API configuration:

1. **Update API base URL**
   - In `frontend/src/lib/axios.js`, change the base URL to your production backend URL
   - Example: `baseURL: 'https://your-app.railway.app/api'`

2. **Update CORS settings**
   - In `backend/src/index.js`, update the CORS origin to your frontend domain

## Step 6: Deploy Frontend (Optional)

### Option A: Deploy to Vercel

1. **Sign up for Vercel**
   - Go to [Vercel](https://vercel.com/)
   - Sign up with your GitHub account

2. **Import your repository**
   - Click "New Project"
   - Import your Chat-Sphere repository
   - Set root directory to `/frontend`

3. **Configure build settings**
   - Build command: `npm run build`
   - Output directory: `dist`
   - Install command: `npm install`

4. **Add environment variables**
   - Add `VITE_API_URL` with your backend URL

### Option B: Deploy to Netlify

1. **Sign up for Netlify**
   - Go to [Netlify](https://netlify.com/)
   - Sign up with your GitHub account

2. **Import your repository**
   - Click "New site from Git"
   - Choose your repository
   - Set base directory to `frontend`

3. **Configure build settings**
   - Build command: `npm run build`
   - Publish directory: `dist`

## Step 7: Test Your Deployment

1. **Test backend endpoints**
   - Test authentication endpoints
   - Test message endpoints
   - Test WebSocket connections

2. **Test frontend**
   - Test user registration/login
   - Test real-time messaging
   - Test file uploads

## Step 8: Domain and SSL (Optional)

1. **Add custom domain**
   - Configure your domain in your hosting platform
   - Update DNS settings

2. **SSL certificate**
   - Most platforms provide free SSL certificates
   - Enable HTTPS for security

## Troubleshooting

### Common Issues:

1. **CORS errors**
   - Make sure your backend CORS settings include your frontend domain

2. **MongoDB connection issues**
   - Verify your MongoDB Atlas connection string
   - Check if your IP is whitelisted in MongoDB Atlas

3. **Environment variables**
   - Ensure all environment variables are set in your hosting platform
   - Check for typos in variable names

4. **Build errors**
   - Check if all dependencies are in `package.json`
   - Verify Node.js version compatibility

## Security Considerations

1. **Environment variables**
   - Never commit `.env` files to Git
   - Use strong, unique secrets

2. **MongoDB security**
   - Use strong database passwords
   - Restrict IP access in MongoDB Atlas

3. **JWT secrets**
   - Use cryptographically secure random strings
   - Rotate secrets periodically

## Monitoring and Maintenance

1. **Set up logging**
   - Monitor application logs
   - Set up error tracking (e.g., Sentry)

2. **Database backups**
   - Enable automatic backups in MongoDB Atlas
   - Test restore procedures

3. **Performance monitoring**
   - Monitor response times
   - Set up alerts for downtime

## Cost Optimization

1. **Free tier limits**
   - Be aware of free tier limitations
   - Monitor usage to avoid unexpected charges

2. **Database optimization**
   - Use appropriate indexes
   - Monitor query performance

Your Chat-Sphere application should now be successfully deployed and accessible online! 