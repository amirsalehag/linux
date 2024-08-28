# `fio` test
```bash
fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=/test/random_read_write.fio --bs=4k --iodepth=64 --size=1M --readwrite=randrw --rwmixread=75
```

* WARNING: DONT RUN THIS ON PRODUCTION AND NEVER USE YOUR DEVICE NAME AS THE `--filename` PARAMETER.
