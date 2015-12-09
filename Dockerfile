# docker rmi -f stackengine/apitest:latest
# docker build --force-rm=true --no-cache=true -q -t stackengine/apitest:latest . | tee /tmp/build.log 2>&1
# docker save $(grep 'Successfully built' /tmp/build.log | grep -o '[a-z0-9]\{12\}') > apitest.tar && gzip -9
# RUN API TESTER
# docker run -ti --rm -v /home/vagrant/stackengine:/work -e REPO=/work stackengine/apitest:latest python /work/controller-doc/scripts/generate_api_docs.py --debug
# RUN DOC BUILDER
# docker run -ti --rm -v /home/vagrant/src/github.com/stackengine/controller-doc:/work -e REPO=/work -w /work/docs stackengine/apitest:latest ./build.sh
FROM python:3.4.3-wheezy
MAINTAINER Jesse Ahrens "jesse@stackengine.com"
RUN mkdir -p /work
RUN pip3 install httplib2
RUN pip3 install PyYAML
RUN pip3 install urllib3
RUN pip3 install Sphinx
VOLUME ["/work"]
