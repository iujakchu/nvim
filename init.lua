local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

require "jak"
--TODO: test loc
