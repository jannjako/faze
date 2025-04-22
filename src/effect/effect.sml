structure PrimEffect : PRIM_EFFECT  =
struct

  datatype 'a effect = Effect of (unit -> 'a)

  type 'a f = 'a effect

  fun fmap f (Effect g) = Effect (fn () => f (g ()))

  fun pure x = Effect (fn () => x)

  fun apply (Effect f) (Effect g) = Effect (fn () =>
    let
      val f' = f ()
      val g' = g ()
    in
      f' g'
    end
  )

  fun bind (Effect x) f =
    f (x ())

  fun printEff s = pure $ TextIO.print s

  fun printnEff s = pure $ TextIO.print $ s ^ "\n"

  val inputLineEff =
    case TextIO.inputLine TextIO.stdIn of
        SOME s' => pure s'
      | NONE => pure ""

  fun runEff (Effect e) = e ()
end

(* Operators *)
infix 4 <$>
fun f <$> x = PrimEffect.fmap f x

infix 4 <*>
fun f <*> x = PrimEffect.apply f x

infix 4 *>
fun x *> y = (const id <$> y) <*> x

infix 4 <*
fun x <* y = (const id <$> x) <*> y

infix 6 >>=
fun x >>= f = PrimEffect.bind x f
