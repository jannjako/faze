fun id x = x

fun const x _ = x

fun flip f x y = f y x

infixr 0 $
fun f $ x = f x

infix 0 |>
fun x |> f = f x

infix 0 ||>
fun (x, y) ||> f = f x y

infix 0 |||>
fun (x, y, z) |||> f = f x y z

infix 0 <|
fun f <| x = f x

infix 0 <||
fun f <|| (x, y) = f x y

infix 0 <|||
fun f <||| (x, y, z) = f x y z

infixr 9 >>
fun f >> g = g o f

infixr 9 <<
fun f << g = f o g

exception InvalidArg of string

fun invalidArg s = raise InvalidArg s
