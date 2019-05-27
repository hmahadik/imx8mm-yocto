sudo apt-get update && \
sudo apt-get install -y gawk wget git-core diffstat unzip texinfo \
gcc-multilib build-essential chrpath socat libsdl1.2-dev && \
sudo apt-get install -y libsdl1.2-dev xterm sed cvs subversion \
coreutils texi2html docbook-utils python-pysqlite2 help2man gcc \
g++ make desktop-file-utils libgl1-mesa-dev libglu1-mesa-dev \
mercurial autoconf automake groff curl lzop asciidoc u-boot-tools && \
mkdir -p ~/bin && \
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && \
chmod a+x ~/bin/repo && \
export PATH=${PATH}:~/bin && \
mkdir -p fsl-arm-yocto-bsp && \
cd fsl-arm-yocto-bsp && \
repo init -u https://source.codeaurora.org/external/imx/imx-manifest -b imx-linux-sumo -m imx-4.14.78-1.0.0_machinelearning.xml && \
repo sync && \
EULA=1 MACHINE=imx8mmevk DISTRO=fsl-imx-xwayland source ./fsl-setup-release.sh -b bld-xwayland && \
echo "BBLAYERS += \" \${BSPDIR}/sources/meta-imx-machinelearning \"" >> conf/bblayers.conf && \
echo "IMAGE_INSTALL_append += \" armnn\"" >> conf/local.conf && \
echo "IMAGE_INSTALL_append += \" python3-numpy\"" >> conf/local.conf && \
bitbake fsl-image-qt5