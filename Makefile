HOME=$(shell pwd)
VERSION="0.3.1"
RELEASE="1"

all: build

clean:
	rm -rf ./rpmbuild
	mkdir -p ./rpmbuild/SPECS/ ./rpmbuild/SOURCES/
	mkdir -p ./SPECS ./SOURCES

build: clean
	cp -r ./SPECS/* ./rpmbuild/SPECS/ || true
	rpmbuild -ba SPECS/geostream.spec \
	--define "ver ${VERSION}" \
	--define "rel ${RELEASE}" \
	--define "_topdir %(pwd)/rpmbuild" \
	--define "_builddir %{_topdir}" \
	--define "_rpmdir %{_topdir}" \
	--define "_srcrpmdir %{_topdir}" \
