{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "sarabun";
  version = "0-unstable-2018-08-24";

  src = fetchFromGitHub {
    owner = "cadsondemak";
    repo = "sarabun";
    rev = "854cdbc6afa002ff8c2ce6aa7b86f99c7f71c9eb";
    sha256 = "jcSQ72WK0GucZPgG7IQKrKzCOEbGgbQVl21RIKSF6A0=";
  };

  outputs = [
    "out"
    "doc"
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $doc/sarabun $out/share/fonts/truetype
    cp -r $src/OFL.txt $src/docs/* $doc/sarabun
    cp $src/fonts/*.ttf $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = {
    homepage = "https://cadsondemak.github.io/sarabun/";
    description = "Slightly-condensed looped Thai and sans serif Latin typeface for communications";
    longDescription = ''
      The most popular typeface from the 13 fonts from SIPA Thailand’s National
      fonts project. Sarabun was designed by Suppakit Chalermlarp to be a
      serious text face. Great choice for a long reading formal text. This font
      was selected by the royal Thai government to be the official typeface for
      documentation purpose. It was also adopted by many private organizations
      to be used as a communication font. Sarabun has a slightly condensed
      proportion which fits perfectly with Thai legibility. It also carries a
      neutral Thai traditional loop design which can easily fit in with any
      occasion. Probably one of the most today’s familiar Thai loop typefaces.
    '';
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [ toastal ];
  };
}
