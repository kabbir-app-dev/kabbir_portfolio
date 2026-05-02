'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "921d0eb5786f8fc9554c2fd374248dcf",
"assets/AssetManifest.bin.json": "7c558548dade0fa330245a900d8aa251",
"assets/AssetManifest.json": "8bad0f4e9a8bd63228abd3cec5853e84",
"assets/assets/images/bb_1.webp": "798110a752b4a406bb42419ed9ae7f1d",
"assets/assets/images/bb_2.webp": "05b3c876889131f88a6b6759a40ebd57",
"assets/assets/images/bb_3.webp": "72ad679fea8a32b2098c6feb57095ac3",
"assets/assets/images/bb_th.png": "83cdee7d973cafb5986cb3460d75c76c",
"assets/assets/images/mp_1.webp": "75e4c5c82c7d0d6ee8a6db25e018befb",
"assets/assets/images/mp_2.webp": "182e8fbe3d0ae99875ca82d57a86c06b",
"assets/assets/images/mp_3.webp": "44ac34f1fbc613bf3f7270c96815755b",
"assets/assets/images/mp_th.png": "227cc4c3b756457f7808a1874f0feb53",
"assets/assets/images/sh_1.png": "2c6575a809d83bf33d97f19815c2c03f",
"assets/assets/images/sh_2.png": "667d932ff35eb3483689064b05b4348d",
"assets/assets/images/sh_3.png": "31818a1bde8df21c0b91a2955e90d70a",
"assets/assets/images/sh_4.png": "7fb0e5a0a3e9135a86171f3d42a21541",
"assets/assets/images/sh_5.png": "f6436204cdfdef27f26ea251bd99aa75",
"assets/assets/images/sh_6.png": "4c5887b84102ed24dfb50e8b6bbddffa",
"assets/assets/images/sh_th.png": "57f8e87f6f7bd1c916711b58f4c97153",
"assets/assets/logos/android.png": "ff8d5307c9856c57b753a16b4621e530",
"assets/assets/logos/animation.png": "101709d2a9708800aea7eebc56f82a41",
"assets/assets/logos/chat.png": "320dbb8621eb9287cf8e3ef7f6983249",
"assets/assets/logos/cicd.png": "03b58355331709c009833585462cad8c",
"assets/assets/logos/cube.png": "ed7bf4e51fe835cf4aef1b74f1f3178c",
"assets/assets/logos/dart.png": "827ad8382451bed999b2c2967740296f",
"assets/assets/logos/design.png": "7058a533f326f82faef1d23759b1e396",
"assets/assets/logos/firebase.png": "15bef1078f0dcfd05d4dc5eb256bf169",
"assets/assets/logos/flutter.png": "2fa58e1115cbd404709e8e74fd8ae11d",
"assets/assets/logos/git.png": "3069f78348e60677be6b539cf4d0a517",
"assets/assets/logos/ios.png": "b3f55c746666271e57b73523ad3ed7b7",
"assets/assets/logos/notification.png": "ee959e3925c13dad8985498d78d9333a",
"assets/assets/logos/payment.png": "51bb74fd9746f0169bc1a019a9df4a93",
"assets/assets/logos/rest_api.png": "3a3ad7fc2ee906e07c4fe4f18fb753f6",
"assets/assets/logos/security.png": "c015f0d805306a762cc43e7d6fff4de4",
"assets/assets/logos/testing.png": "50b07296db4e3b2933c620c19ff0e02c",
"assets/assets/logos/video_call.png": "ae206bc827f6e21e4db4199582ef95da",
"assets/FontManifest.json": "d8652212239359d3adbbdfb111000caf",
"assets/fonts/MaterialIcons-Regular.otf": "2b32065a5afaf95fc395b447b7afa76c",
"assets/images/bb_1.webp": "798110a752b4a406bb42419ed9ae7f1d",
"assets/images/bb_2.webp": "05b3c876889131f88a6b6759a40ebd57",
"assets/images/bb_3.webp": "72ad679fea8a32b2098c6feb57095ac3",
"assets/images/bb_th.png": "83cdee7d973cafb5986cb3460d75c76c",
"assets/images/mp_1.webp": "75e4c5c82c7d0d6ee8a6db25e018befb",
"assets/images/mp_2.webp": "182e8fbe3d0ae99875ca82d57a86c06b",
"assets/images/mp_3.webp": "44ac34f1fbc613bf3f7270c96815755b",
"assets/images/mp_th.png": "227cc4c3b756457f7808a1874f0feb53",
"assets/images/sh_1.png": "2c6575a809d83bf33d97f19815c2c03f",
"assets/images/sh_2.png": "667d932ff35eb3483689064b05b4348d",
"assets/images/sh_3.png": "31818a1bde8df21c0b91a2955e90d70a",
"assets/images/sh_4.png": "7fb0e5a0a3e9135a86171f3d42a21541",
"assets/images/sh_5.png": "f6436204cdfdef27f26ea251bd99aa75",
"assets/images/sh_6.png": "4c5887b84102ed24dfb50e8b6bbddffa",
"assets/images/sh_th.png": "57f8e87f6f7bd1c916711b58f4c97153",
"assets/logos/android.png": "ff8d5307c9856c57b753a16b4621e530",
"assets/logos/animation.png": "101709d2a9708800aea7eebc56f82a41",
"assets/logos/chat.png": "320dbb8621eb9287cf8e3ef7f6983249",
"assets/logos/cicd.png": "03b58355331709c009833585462cad8c",
"assets/logos/cube.png": "ed7bf4e51fe835cf4aef1b74f1f3178c",
"assets/logos/dart.png": "827ad8382451bed999b2c2967740296f",
"assets/logos/design.png": "7058a533f326f82faef1d23759b1e396",
"assets/logos/firebase.png": "15bef1078f0dcfd05d4dc5eb256bf169",
"assets/logos/flutter.png": "2fa58e1115cbd404709e8e74fd8ae11d",
"assets/logos/git.png": "3069f78348e60677be6b539cf4d0a517",
"assets/logos/ios.png": "b3f55c746666271e57b73523ad3ed7b7",
"assets/logos/notification.png": "ee959e3925c13dad8985498d78d9333a",
"assets/logos/payment.png": "51bb74fd9746f0169bc1a019a9df4a93",
"assets/logos/rest_api.png": "3a3ad7fc2ee906e07c4fe4f18fb753f6",
"assets/logos/security.png": "c015f0d805306a762cc43e7d6fff4de4",
"assets/logos/testing.png": "50b07296db4e3b2933c620c19ff0e02c",
"assets/logos/video_call.png": "ae206bc827f6e21e4db4199582ef95da",
"assets/NOTICES": "e520e2bdad80565b96c52817a6d68b8b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/dev_icons/fonts/devicon.ttf": "eb29517242b5a2d2845d59b46359848e",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "706b13a761d261d759c0a8d557ccfdcb",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "46be639d952abe98effde36da35e7701",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "48b92e8451309fdcb73d294f0f6e9830",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "586957c50eb3fa5c4114f0732e602566",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "02cb270f556b72938bb0172a1d61f312",
"/": "02cb270f556b72938bb0172a1d61f312",
"main.dart.js": "1e7e1e182a2ea9f0d65b3ffd8dd28b3b",
"manifest.json": "a2cba101a2140c6f50aa833936acde3f",
"version.json": "55cb3751a4bf0702d7a97d0c7beb0504"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
