signature APPLICATIVE =
sig
  include FUNCTOR

  val pure : 'a -> 'a f

  val apply : ('a -> 'b) f -> 'a f -> 'b f   
end
