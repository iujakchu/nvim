return {
   s("todo", t "//TODO: ", i(0)),
   s(
      "modtest",
      fmt(
         [[
            #[cfg(test)]
            mod tests{{
                use super::*;
                #[test]
                fn {}(){{
                    {}
                }}
            }}
         ]],
         ins_generate()
      )
   ),
   s(
      "amain",
      fmt(
         [[
            async fn main(){}{{
                {}
            }}
         ]],
         ins_generate()
      )
   ),
   s(
      "main",
      fmt(
         [[
            fn main(){}{{
                {}
            }}
         ]],
         ins_generate()
      )
   ),
   s(
      "test",
      fmt(
         [[
            #[test]
            fn {}(){{
                {}
            }}
         ]],
         ins_generate()
      )
   ),
}
