# Real-time sharing setup

To share the tracker with someone and see updates in real time, follow these steps.

## 1. Host the app online

The app must be on a web URL (not `file://`) for sharing to work.

### Option A: GitHub Pages (free)

1. Create a GitHub account if you don't have one.
2. Create a new repository (e.g. `house-payment-tracker`).
3. Upload all files: `index.html`, `firebase-config.js`, `firebase-config.example.js`, `initial_data.json`.
4. Go to **Settings → Pages** → Source: **Deploy from a branch** → Branch: `main` → Save.
5. Your app will be at: `https://YOUR_USERNAME.github.io/house-payment-tracker/`

### Option B: Netlify Drop (free, no account needed)

1. Go to [app.netlify.com/drop](https://app.netlify.com/drop)
2. Drag and drop the `house-payment-app` folder.
3. You'll get a URL like `https://random-name.netlify.app`

## 2. Set up Firebase (free)

1. Go to [console.firebase.google.com](https://console.firebase.google.com)
2. Click **Create a project** → name it (e.g. "House Tracker") → Continue.
3. In the project, click **Build** → **Realtime Database** → **Create Database**.
4. Choose a location (e.g. `asia-south1` for India) → Start in **test mode** for now.
5. Go to **Project Settings** (gear icon) → **General** → scroll to "Your apps".
6. Click **</>** (Web) → register app → copy the config object.
7. Open `firebase-config.js` and replace `null` with your config:

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

8. In Firebase Console → **Realtime Database** → **Rules**, use:

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

(Anyone with a room link can read/write that room. The room ID is random, so it's hard to guess.)

## 3. Use real-time sharing

1. Open your hosted app URL.
2. Click **Create shared tracker**.
3. Copy the share link and send it to the other person.
4. Both of you can add/edit payments – changes appear in real time.

## Notes

- **Local mode** (no Firebase): The app still works offline with `firebase-config.js` set to `null`. Data stays on your device.
- **With Firebase**: Data syncs to the cloud. Both you and the person you share with see the same data.
- The share link contains a unique room ID. Only people with the link can access that tracker.
