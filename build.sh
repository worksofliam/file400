mkdir build
gcc -pthread -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -O2 -g -maix64 -I/QOpenSys/pkgs/include -I./source/include -I/QOpenSys/pkgs/include/python3.6m -c source/_db2.c -o build/_db2.o
gcc -pthread -shared /QOpenSys/pkgs/lib/python3.6/config-3.6m/python.exp /QOpenSys/lib/libdb400.a build/_db2.o -o build/_db2.so

gcc -pthread -Wno-unused-result -Wsign-compare -DNDEBUG -g -fwrapv -O3 -Wall -O2 -g -maix64 -I/QOpenSys/pkgs/include -I./source/include -I/QOpenSys/pkgs/include/python3.6m -c source/file400.c -o build/file400.o
gcc -pthread -shared /QOpenSys/pkgs/lib/python3.6/config-3.6m/python.exp /QOpenSys/lib/libiconv.a build/file400.o -o build/file400.so

system "CRTLIB PYTHON3"
system "CRTCMOD MODULE(PYTHON3/RECLEVACC) SRCSTMF('./source/reclevacc.c') SYSIFCOPT(*IFS64IO) LOCALETYPE(*LOCALEUTF) TERASPACE(*YES *TSIFC) STGMDL(*TERASPACE) DTAMDL(*P128)"
system "CRTSRVPGM SRVPGM(PYTHON3/RECLEVACC) EXPORT(*ALL) STGMDL(*TERASPACE)"

# Getting these errors?: 'yum remove libiconv-devel' and restart.
# ld: 0711-317 ERROR: Undefined symbol: .libiconv_open
# ld: 0711-317 ERROR: Undefined symbol: .libiconv
