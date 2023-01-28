'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"assets/AssetManifest.json": "905cbee0b738cf1419f50553156bf27b",
"assets/assets/abbas.jpg": "afb5094f533f6fd4217a2b95ef7ff5be",
"assets/assets/abbas1.jpg": "725e02c2d1dd51211c3e8cd9d0d5d89d",
"assets/assets/ahmed.png": "137dc5a2d95e246f93dea17a1ffd8557",
"assets/assets/bary.jpeg": "a8f0c762645b93ecd1e77f6c41b5530d",
"assets/assets/bary1.jpg": "810055e64c630c673dde705b823c96f1",
"assets/assets/doctor.png": "52b16185f3e39a73959bc292def18ba0",
"assets/assets/doctor_1.png": "6d3550b615ac00eb558978b4318ede92",
"assets/assets/doctor_3.png": "16733ed548147699b50ea69ced5b72a1",
"assets/assets/doctor_4.png": "12a79947c97041cb700a0cf4aea77d76",
"assets/assets/doctor_face.jpg": "4382eb9301a159e64f1f821077ca930f",
"assets/assets/fonts/Urbanist-Regular.ttf": "696d3a6a1d46afbcb1f754f347fa3758",
"assets/assets/grapy-check-up-results-on-tablet-with-stethoscope-and-pills.png": "070bb13222dde134f8d00ebceaa28a4a",
"assets/assets/heartbeat.png": "ff1fc2658dd83f6d43e1a158217feb6b",
"assets/assets/ibra.jpg": "d002eee7d63c91c7eabc65c64ef2b1a8",
"assets/assets/ibra.png": "796d151efd63d961e5b294ef843df18a",
"assets/assets/icons/1024.png": "554557e909a1e8fdae047b8914115b97",
"assets/assets/icons/back.svg": "73c5d6291e6ddbdba9a1c019ecf7c144",
"assets/assets/icons/chart.svg": "22ef512f26a7820e5f74597555727216",
"assets/assets/icons/discover.svg": "67a0f842fbd49d4571276cf1610d77f5",
"assets/assets/icons/headphone.svg": "e236325e165eca0b6b4619844aa03bf6",
"assets/assets/icons/heart.svg": "041708ffde446a2b9235a69027503edc",
"assets/assets/icons/icons8-heart-disease-64.png": "328a3ffb524fc8916e46852235a4f8b8",
"assets/assets/icons/ic_launcher.zip": "a338c5d03fec155f754af45d078b2dbb",
"assets/assets/icons/ic_launcher_adaptive_fore.png": "bd8f5c6207586d1902933073b07da9c2",
"assets/assets/icons/logo.png": "125c02ca6ac2d35a31c0a53c8fc14fa9",
"assets/assets/icons/play_store_512.png": "ac628d2cadbeaab10cc40af5cc5f48f7",
"assets/assets/icons/profile.svg": "6f37fc5da3f36225b53c55e9b53b9b9f",
"assets/assets/icons/res/mipmap-anydpi-v26/ic_launcher.xml": "7e00b32ff1668cc97c7166ee10b1fc88",
"assets/assets/icons/res/mipmap-hdpi/ic_launcher.png": "d6e64d803df8cf5dbb1486478c0842a4",
"assets/assets/icons/res/mipmap-hdpi/ic_launcher_adaptive_back.png": "28bc4336e2b6049ec46bddb8928607e7",
"assets/assets/icons/res/mipmap-hdpi/ic_launcher_adaptive_fore.png": "51a81b1891755563facec4f4a5d0f7bc",
"assets/assets/icons/res/mipmap-mdpi/ic_launcher.png": "402916438e820ebf7bdbd163c7e10b5c",
"assets/assets/icons/res/mipmap-mdpi/ic_launcher_adaptive_back.png": "9d3d4b529957cad70b95a133f93ce429",
"assets/assets/icons/res/mipmap-mdpi/ic_launcher_adaptive_fore.png": "5f2a7e48eb959eb9e55418f407468424",
"assets/assets/icons/res/mipmap-xhdpi/ic_launcher.png": "b69d316532040817fa437dd3062bb6e0",
"assets/assets/icons/res/mipmap-xhdpi/ic_launcher_adaptive_back.png": "fd09214d130c97ce3f9ad699a3150fcb",
"assets/assets/icons/res/mipmap-xhdpi/ic_launcher_adaptive_fore.png": "7b416f3e50470e992dc35851a32b0993",
"assets/assets/icons/res/mipmap-xxhdpi/ic_launcher.png": "4666fa91fa37f53419803d362cc86b83",
"assets/assets/icons/res/mipmap-xxhdpi/ic_launcher_adaptive_back.png": "08178d2e7a4fbe8e4a31454cd1fa8434",
"assets/assets/icons/res/mipmap-xxhdpi/ic_launcher_adaptive_fore.png": "bd8f5c6207586d1902933073b07da9c2",
"assets/assets/icons/res/mipmap-xxxhdpi/ic_launcher.png": "a2c28bc35a170215e01a8ad7a05879bc",
"assets/assets/icons/res/mipmap-xxxhdpi/ic_launcher_adaptive_back.png": "65cf757eb2e83a3ed1570fa9b3cae037",
"assets/assets/icons/res/mipmap-xxxhdpi/ic_launcher_adaptive_fore.png": "3aba416e5ee0f218676f26880d0c341f",
"assets/assets/icons/search.svg": "add7bb5b0d889df0338c97f61e6988b5",
"assets/assets/icons/tape.svg": "376cabd50c8ce4f4ee72af26ccbec1ac",
"assets/assets/images/38ac4708": "358cfdfa9656759c12b66e39ed1d30b3",
"assets/assets/images/aast.png": "835e7d95e1dc5c65d77a72539595005e",
"assets/assets/images/attendance.png": "7241e362e367f5b893d904bbc039dc5e",
"assets/assets/images/check.png": "1a483cc6f3e389a4faa784bb7396173f",
"assets/assets/images/doctor-with-stethoscope-listening-huge-heart-beat-ischemic-heart-disease.zip": "d58a1ba66ca17c1b594040b72b2963f4",
"assets/assets/images/e73f6ef6": "63b1ec2badc663bc20384b156c31957f",
"assets/assets/images/ECG-placement.jpg": "3b4ec09999ea9c92cc41811330cbb91b",
"assets/assets/images/heart.png": "358cfdfa9656759c12b66e39ed1d30b3",
"assets/assets/images/juicy-heart-with-cardiogram.png": "d3876b891ad2ed75da49f868be73540b",
"assets/assets/images/logo.jpg": "63b1ec2badc663bc20384b156c31957f",
"assets/assets/images/logo.png": "1d454d63f471f875ddd4eaf2bb18006d",
"assets/assets/pics/appShots.png": "62057c0bca73078f3a8c21ec4092effd",
"assets/assets/pics/backgroun2.png": "83abc691172a3bd10489535af62ae716",
"assets/assets/pics/background1.png": "ba8316d83ca556a6024e1b9cfa811193",
"assets/assets/pics/pic1.png": "2ed675cd9f7d7f8c4e0133bc2fe00ce5",
"assets/assets/pics/pic2.jpg": "96e392e47a1f3ffa98a025bfacd1b918",
"assets/assets/pics/Vector-1.svg": "ed77738e99ce0c6dd09a85a3fd30ca61",
"assets/assets/pics/Vector.svg": "ac77abadf1bd5488f4d4c5a767912791",
"assets/assets/pics/VectorSmallBottom.svg": "bb69464fe94858d040283d6daed582d6",
"assets/assets/pics/VectorSmallTop.svg": "65e5919107084bb06e362ee35b8d1b24",
"assets/assets/profile.jpg": "0c5c026703bc14a4ec4e557c0735308e",
"assets/assets/sami.png": "68a0f5dc60344a01f957e53cd9cf078a",
"assets/assets/samy.jpg": "37e881789737ad0caef52c9d954c27f0",
"assets/assets/user.png": "0770252ca09af76850741f2cb2e5c06a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "43a6111b110fc22c98e3619e50d6acdc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/gender_picker/assets/images/female.png": "93c67e67ee8656ee2f13b917a815ec0a",
"assets/packages/gender_picker/assets/images/male.png": "b544146a8e95908f097fe86343f9140b",
"assets/packages/gender_picker/assets/images/other.png": "4b5edfe11e630dbd98a09e04b2e35269",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6fa010d5e0eb7cc704ea32d1164125f5",
"/": "6fa010d5e0eb7cc704ea32d1164125f5",
"main.dart.js": "1672a475e3fae47394ad12236fa7e237",
"manifest.json": "f63a20af6a672cf093c1bcb2bba34af6",
"version.json": "99430ff9bdc23dada1cda192958135d4"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
