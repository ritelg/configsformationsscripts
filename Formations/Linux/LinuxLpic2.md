# Formation LPIC2 - Linux

1. [Compression](#compression)

## Compression
* Compression :
* gzip, bzip2,
* tar
	* Compression :
		* -c compression
		* -f resultat dans un fichier
		* tar -cf test.tar test/
		* Formats :
			* -j : bz2
			* -J : xz
			* -z : gz : Le plus performant
		* -v verbose
		* tar -cvzf test.tar.gz test/
	* Decompression
		* -x decompresser
		* tar -xf test.tar
		* tar -xvzf test.tar.gz