local
  open Prim.Effect
in
  val eff = (printEff "hello") *> (printEff "world")

  val _ = runEff eff
end
