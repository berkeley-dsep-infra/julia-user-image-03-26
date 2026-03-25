#!/usr/bin/env julia
using Pkg;

Pkg.add.([
    Pkg.PackageSpec(;name="FFTW", version="1.9.0"),
    Pkg.PackageSpec(;name="FastGaussQuadrature", version="1.0.2"),
    Pkg.PackageSpec(;name="ForwardDiff", version="1.0.1"),
    Pkg.PackageSpec(;name="NBInclude", version="2.4.0"),
    Pkg.PackageSpec(;name="Delaunator", version="0.1.2"),
    Pkg.PackageSpec(;name="TriplotRecipes", version="0.1.2"),
    Pkg.PackageSpec(;name="StaticArrays", version="1.9.13"),
    Pkg.PackageSpec(;name="BenchmarkTools", version="1.6.0"),
    Pkg.PackageSpec(;name="Query", version="1.0.0"),
    Pkg.PackageSpec(;name="VegaLite", version="3.3.0"),
    Pkg.PackageSpec(;name="CSVFiles", version="1.0.2"),
    Pkg.PackageSpec(;name="Distributions", version="0.25.120"),
    Pkg.PackageSpec(;name="DataFrames", version="1.7.0"),
    Pkg.PackageSpec(;name="Plots", version="1.40.14"),
    Pkg.PackageSpec(;name="Images", version="0.26.2"),
    Pkg.PackageSpec(;name="PyPlot", version="2.11.6"),
    Pkg.PackageSpec(;name="PyCall", version="1.96.4"),
    Pkg.PackageSpec(;name="Roots", version="2.2.8"),
    Pkg.PackageSpec(;name="Polynomials", version="4.0.21"),
    Pkg.PackageSpec(;name="DifferentialEquations", version="7.16.1"),
    Pkg.PackageSpec(;name="Optim", version="1.13.2"),
    Pkg.PackageSpec(;name="CairoMakie", version="0.14.0"),
    Pkg.PackageSpec(;name="IJulia", version="1.29.0"),
]);

# Precompiling installed packages
Pkg.precompile();
