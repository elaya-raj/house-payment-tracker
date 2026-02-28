# House Payment Tracker

A simple web app to track transfer costs to contractors building your house.

## How to use

1. **Open the app**: Double-click `index.html` to open it in your browser.

2. **Load your existing data**: Click **Import CSV / JSON** and select `initial_data.json` (your Excel data has been exported here).

3. **Add new payments**: Fill in Date, Amount, and Transfer Detail, then click **Add**.

4. **Export**: Click **Export CSV** to download your data (e.g. for backup or opening in Excel).

## Real-time sharing

To share with someone (e.g. family, contractor) so you both see updates instantly:

1. **Deploy to GitHub** – see **DEPLOY.md** for full step-by-step instructions
2. **Set up Firebase** (free) – included in DEPLOY.md
3. Click **Create shared tracker** and share the link

Both of you can add payments – changes sync in real time.

## Data storage

- **Local mode** (default): Data is stored in your browser. No account or setup needed.
- **Shared mode** (with Firebase): Data syncs to the cloud so everyone with the link sees the same data.

## Import from Excel

- **Option A**: Use `initial_data.json` (already created from your Excel).
- **Option B**: In Excel, go to File → Save As → CSV UTF-8, then import the CSV file.
