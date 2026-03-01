// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDYea41Lufbr82VG7g8I21U2yx1hptNt04",
  authDomain: "house-tracker-2.firebaseapp.com",
  databaseURL: "https://house-tracker-2-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "house-tracker-2",
  storageBucket: "house-tracker-2.firebasestorage.app",
  messagingSenderId: "145773530767",
  appId: "1:145773530767:web:472e3cb2132428c792aafa",
  measurementId: "G-5SZY9ZBLS4"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
