# First impression

I've pretty-much just copy-pasted the example from `axum` docs and then written a Dockerfile - even if I didn't know how to do that, there are thousands of examples on the almighty Internet within my reach to help me.

```
$ docker build -t app .
$ docker run --rm -it -p 3000:3000 app
```

```
$ curl localhost:3000
Hello, Docker!
```
