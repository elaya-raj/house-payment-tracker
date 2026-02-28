# Deploy to GitHub Pages – Step by step

Follow these steps to host your House Payment Tracker on GitHub and enable real-time sharing.

---

## Step 1: Create the GitHub repository

1. Go to [github.com/new](https://github.com/new)
2. **Repository name:** `house-payment-tracker` (or any name you prefer)
3. **Description:** House payment tracker for contractors (optional)
4. Choose **Public**
5. **Do NOT** check "Add a README" – we're pushing existing code
6. Click **Create repository**

---

## Step 2: Push your code to GitHub

Open Terminal and run:

```bash
cd /Users/eraj/house-payment-app

git init
git add .
git commit -m "Initial commit: House Payment Tracker"
git branch -M main
git remote add origin https://github.com/elaya-raj/house-payment-tracker.git
git push -u origin main
```

**Note:** Replace `house-payment-tracker` with your repo name if you used a different one.

If prompted for credentials, use your GitHub username and a [Personal Access Token](https://github.com/settings/tokens) (not your password).

---

## Step 3: Enable GitHub Pages

1. In your repo, go to **Settings** → **Pages**
2. Under **Source**, select **Deploy from a branch**
3. Under **Branch**, select `main` and `/ (root)`
4. Click **Save**

Your app will be live at:
**https://elaya-raj.github.io/house-payment-tracker/**

(It may take 1–2 minutes to deploy.)

---

## Step 4: Set up Firebase for real-time sharing

1. Go to [console.firebase.google.com](https://console.firebase.google.com)
2. Click **Create a project** → name it "House Tracker" → Continue
3. Click **Build** → **Realtime Database** → **Create Database**
4. Choose location: **asia-south1** (Mumbai) or nearest
5. Start in **test mode** → Enable
6. Go to **Project Settings** (gear icon) → **General**
7. Scroll to "Your apps" → click **</>** (Web)
8. App nickname: "House Tracker" → Register
9. Copy the `firebaseConfig` object

---

## Step 5: Add Firebase config to your app

1. Open `firebase-config.js` in your project
2. Replace `null` with your config (paste the object from Firebase):

```javascript
const FIREBASE_CONFIG = {
  apiKey: "AIza...",
  authDomain: "your-project.firebaseapp.com",
  databaseURL: "https://your-project-default-rtdb.firebaseio.com",
  projectId: "your-project",
  storageBucket: "your-project.appspot.com",
  messagingSenderId: "123...",
  appId: "1:123..."
};
```

3. Set Firebase security rules:
   - Go to **Realtime Database** → **Rules**
   - Replace with:

```json
{
  "rules": {
    "rooms": {
      "$roomId": {
        ".read": true,
        ".write": true
      }
    }
  }
}
```

4. Click **Publish**

---

## Step 6: Push the updated config and deploy

```bash
cd /Users/eraj/house-payment-app
git add firebase-config.js
git commit -m "Add Firebase config for real-time sync"
git push
```

**Security note:** Firebase `apiKey` in frontend code is normal and safe. Access is controlled by Realtime Database rules. Only people with a room link can read/write that room.

---

## Step 7: Use real-time sharing

1. Open **https://elaya-raj.github.io/house-payment-tracker/**
2. Import your data (Import CSV/JSON → select `initial_data.json`)
3. Click **Create shared tracker**
4. Copy the share link and send it to the other person
5. Both of you can add payments – changes sync in real time

---

## Summary

| Step | What you did |
|------|--------------|
| 1 | Created GitHub repo |
| 2 | Pushed code |
| 3 | Enabled GitHub Pages |
| 4 | Created Firebase project |
| 5 | Added Firebase config + rules |
| 6 | Pushed config, app is live |
| 7 | Create shared tracker & share link |

Your app: **https://elaya-raj.github.io/house-payment-tracker/**
