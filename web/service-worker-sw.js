importScripts('https://s3-eu-west-1.amazonaws.com/static.wizrocket.com/js/sw_webpush.js');

// var firebaseConfig = {
//     apiKey: "AIzaSyDEd5xEiPV8XumHx_32RqVTYqw_8qGT_Cg",
//     authDomain: "rock-webber-technologies.firebaseapp.com",
//     databaseURL: "https://rock-webber-technologies-default-rtdb.europe-west1.firebasedatabase.app",
//     projectId: "rock-webber-technologies",
//     storageBucket: "rock-webber-technologies.appspot.com",
//     messagingSenderId: "605936979831",
//     appId: "1:605936979831:web:7f2001945863829e451b72",
//     measurementId: "G-4PWC5LPPJL"
//   };

// firebase.initializeApp(firebaseConfig);

// const messaging = firebase.messaging();

// messaging.onBackgroundMessage(function(payload) {
//   console.log('[firebase-messaging-sw.js] Received background message ', payload);
//   const notificationTitle = payload.notification.title;
//   const notificationOptions = {
//     body: payload.notification.body,
//     icon: '/firebase-logo.png'
//   };

//   return self.registration.showNotification(notificationTitle, notificationOptions);
// });