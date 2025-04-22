signature MONAD =
sig
  include APPLICATIVE

  val bind : 'a f -> ('a -> 'b f) -> 'b f
end
