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

    system "./autogen.sh"
    system "./configure", "--enable-libraries",
                          "--enable-shared",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
