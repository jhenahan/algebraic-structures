{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "algebraic-structures";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [ base ];
  homepage = "https://github.com/jhenahan/algebraic-structures";
  description = "Generic algebraic structure hierarchy";
  license = stdenv.lib.licenses.bsd3;
}
