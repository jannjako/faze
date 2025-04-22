signature PRIM_EFFECT =
sig
  include MONAD

  type 'a effect

  val printEff : string -> unit effect

  val printnEff : string -> unit effect

  val inputLineEff : string effect

  val runEff : 'a effect -> 'a
end
