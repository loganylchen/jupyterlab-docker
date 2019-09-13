#=
installIJulia:
- Julia version: 
- Author: logan
- Date: 2019-09-13
=#

import Pkg
Pkg.add("IJulia")
Pkg.build("IJulia")