.PHONY: apply-patch

all: apply-patch

boost_1_45_0.tar.gz:
	curl -L "http://downloads.sourceforge.net/project/boost/boost/1.45.0/boost_1_45_0.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.45.0%2Fboost_1_45_0.tar.gz%2Fdownload&ts=1484019287&use_mirror=jaist" \
		-o $@

boost_1_45_0: boost_1_45_0.tar.gz
	tar xzf boost_1_45_0.tar.gz

apply-patch: boost_1_45_0 boost_1_45_0.patch
	patch -u -p1 -d boost_1_45_0 < boost_1_45_0.patch

install: boost_1_45_0
	cd boost_1_45_0 && \
		./bootstrap.sh && \
		./bjam && ./bjam install
