{ stdenv, fetchFromGitHub, perl, cmake, ninja, vala_0_40, pkgconfig, gobjectIntrospection, glib, gtk3, gnome3, gettext }:

stdenv.mkDerivation rec {
  name = "granite-${version}";
  version = "5.0";

  src = fetchFromGitHub {
    owner = "elementary";
    repo = "granite";
    rev = version;
    sha256 = "015hkclcxirssg7a8s6mkns5xdk77m1jnkshlyfdw041nzyc5jh1";
  };

  cmakeFlags = [
    "-DINTROSPECTION_GIRDIR=share/gir-1.0/"
    "-DINTROSPECTION_TYPELIBDIR=lib/girepository-1.0"
  ];

  nativeBuildInputs = [
    cmake
    gettext
    gobjectIntrospection
    ninja
    perl
    pkgconfig
    vala_0_40
  ];
  buildInputs = [
    glib
    gnome3.libgee
    gtk3
  ];

  meta = with stdenv.lib; {
    description = "An extension to GTK+ used by elementary OS";
    longDescription = "An extension to GTK+ that provides several useful widgets and classes to ease application development. Designed for elementary OS.";
    homepage = https://github.com/elementary/granite;
    license = licenses.lgpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ vozz worldofpeace ];
  };
}
