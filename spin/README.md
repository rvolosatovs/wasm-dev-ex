# First impression

First try, did not look at the docs, but did see the `spin new` and `spin up` on the website, they stand out:
```
$ spin new
You don't have any templates yet. Would you like to install the default set? yes
Copying remote template source
Installing template redis-rust...
Installing template static-fileserver...
Installing template http-grain...
Installing template http-swift...
Installing template http-php...
Installing template http-c...
Installing template redirect...
Installing template http-rust...
Installing template http-go...
Installing template http-zig...
Installing template http-empty...
Installing template redis-go...
Installed 12 template(s)

+------------------------------------------------------------------------+
| Name                Description                                        |
+========================================================================+
| http-c              HTTP request handler using C and the Zig toolchain |
| http-empty          HTTP application with no components                |
| http-go             HTTP request handler using (Tiny)Go                |
| http-grain          HTTP request handler using Grain                   |
| http-php            HTTP request handler using PHP                     |
| http-rust           HTTP request handler using Rust                    |
| http-swift          HTTP request handler using SwiftWasm               |
| http-zig            HTTP request handler using Zig                     |
| redirect            Redirects a HTTP route                             |
| redis-go            Redis message handler using (Tiny)Go               |
| redis-rust          Redis message handler using Rust                   |
| static-fileserver   Serves static files from an asset directory        |
+------------------------------------------------------------------------+
Pick a template to start your application with: http-rust (HTTP request handler using Rust)
Enter a name for your new application: echo
Description: devex evaluation
HTTP base: /echo
HTTP path: /...
$ cd echo
$ spin build
Executing the build command for component echo: cargo build --target wasm32-wasi --release
...
Successfully ran the build command for the Spin components.
$ spin up
Logging component stdio to ".spin/logs/"

Serving http://127.0.0.1:3000
Available Routes:
  echo: http://127.0.0.1:3000/echo (wildcard)
{"host": "127.0.0.1:3000", "user-agent": "curl/8.4.0", "accept": "*/*", "spin-path-info": "", "spin-full-url": "http://127.0.0.1:3000/echo", "spin-matched-route": "/echo/...", "spin-base-path": "/echo", "spin-raw-component-route": "/...", "spin-component-route": "", "spin-client-addr": "127.0.0.1:50968"}
```

Works out-of-the-box, I was successful with a Wasm-based HTTP server successfully handling a request within 1 minute of first time using `spin`
- I didn't need to read the docs
- I didn't need to write any code

Later, I found out I could have just done:
```
spin new -a -t http-rust app
```

Then:
```
$ spin build
$ spin up --listen [::]:3000
```

```
$ curl localhost:3000
Hello, Fermyon
```
