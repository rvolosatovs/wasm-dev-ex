# First impression

Cloned an HTTP "hello world" and it got it working pretty quick.

Unfortunately, the command suggested in the docs does not work with latest Wasmtime release, but the fix was found in the issue https://github.com/sunfishcode/hello-wasi-http/issues/5#issuecomment-1906570649

```
$ cargo component build
$ wasmtime serve -Scommon --addr '[::]:3000' target/wasm32-wasi/debug/app.wasm
```

```
$ curl localhost:3000  
Hello, wasi:http/proxy world!
```
