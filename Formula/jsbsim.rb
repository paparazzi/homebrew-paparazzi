require 'formula'

class Jsbsim < Formula
  homepage "http://jsbsim.sourceforge.net"
  url "git://git.code.sf.net/p/jsbsim/code", :revision => "c4f7f7ce33aac0b0787a2df20acb05eeab6776b3"
  #sha1 ""
  version "1.0-c4f747"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build
  depends_on "pkgconfig"
  #depends_on "tcl"



  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    inreplace ["src/Makefile.am",
               "src/initialization/Makefile.am",
               "src/input_output/Makefile.am",
               "src/math/Makefile.am",
               "src/models/Makefile.am",
               "src/models/atmosphere/Makefile.am",
               "src/models/flight_control/Makefile.am",
               "src/models/propulsion/Makefile.am",
               "src/simgear/Makefile.am",
               "src/simgear/magvar/Makefile.am",
               "src/simgear/misc/Makefile.am",
               "src/simgear/props/Makefile.am",
               "src/simgear/xml/Makefile.am",
               "src/simgear/structure/Makefile.am"],
      "includedir = @includedir@/JSBSim", "includedir = @includedir@"

    system "./autogen.sh"
    system "./configure", "--enable-libraries",
                          "--enable-shared",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
