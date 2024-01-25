# First impression

First steps are not obvious, I had to find https://wasmcloud.com/docs/tour/hello-world link at the end of the paragraph on installation page (where I also had to select my OS).
Really wish there was a button somewhere on the landing page to take me there.

```
$ wash new actor -t hello hello
$ wash build

# First try
$ wash app deploy wadm.yml

Failed to connect to NATS 127.0.0.1:4222
No credentials file was provided, you may need one to connect.

Caused by:
    IO error: Connection refused (os error 61)

# After checking the docs, second try
$ wash up
$ wash app deploy wadm.yml

invalid manifest source: wadm.yml

# After checking the docs again, reading the YAML, third try
$ wash build -o json
# copy-paste the long path string...
$ vim wadm.yml
# find the line to change, change it
$ wash app deploy wadm.yml

invalid manifest source: wadm.yml
```

At this point, I gave up, because after 3 tries it just did not work

Later, I discovered that this process not just did not work, but also has messed up my Git repository. I was not even able to `git add ./wasmcloud` from the root:

```
error: 'wasmcloud/' does not have a commit checked out
fatal: adding files failed
```

People not familiar with Git will have no idea how to fix this, but I had to `rm -rf ./wasmcloud/.git` manually
