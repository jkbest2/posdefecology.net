using Distributions
using DynamicHMC
using LogDensityProblems
using TransformVariables
using Random

struct Schaefer{F}
    r::F
    K::F
end
(s::Schaefer)(p) = p + s.r * p * (1 - p / s.K)

struct SchaeferProblem{T}
    p0::Vector{T}
    p1::Vector{T}
    σ::T
end
function (sp::SchaeferProblem)(θ)
    ll = zero(θ.r)
    ll += logpdf(Normal(100.0, 50.0), θ.K)
    ll += logpdf(LogNormal(log(0.1) - 0.1^2 / 2, 0.1), θ.r)
    schaefer = Schaefer(θ.r, θ.K)
    errdist = LogNormal(-sp.σ^2 / 2, sp.σ)
    for idx in eachindex(sp.p0)
        res = schaefer(sp.p0[idx]) / sp.p1[idx]
        ll += logpdf(errdist, res)
    end
    ll
end

schaefer = Schaefer(0.1, 100.0)
σ = 0.1
errdist = LogNormal(σ^2 / 2, σ)
p0 = 100rand(30)
p1 = zeros(100)
for idx in eachindex(p0)
    p1[idx] = schaefer(p0[idx])
end

sprob = SchaeferProblem(p0, p1, σ)

sprob((r = 0.1, K = 100.0))
t = as((r = asℝ₊, K = asℝ₊))
ℓ = TransformedLogDensity(t, sprob)

∇ℓ = ADgradient(:ForwardDiff, ℓ)

## Fails for non-finiteness somewhere?
post = mcmc_with_warmup(Random.GLOBAL_RNG, ∇ℓ, 100_000;
                        initialization = (q = [0.1, 100.0],),
                        reporter = NoProgressReport())

histogram2d(first.(post.chain), last.(post.chain), bins = 100)

using Optim

optimize(θ -> -sprob((r = θ[1], K = θ[2])), [0.1, 100.0])

struct Rosenbrock{T}
    a::T
    b::T
end
(rosen::Rosenbrock)(θ) = -(rosen.a - θ.x)^2 - rosen.b * (θ.y - θ.x^2)^2

rosen = Rosenbrock(1.0, 10.0)
rosen_t = as((x = asℝ, y = asℝ))
rosen_ll = TransformedLogDensity(rosen_t, rosen)
∇rosen_ll = ADgradient(:ForwardDiff, rosen_ll)
rosen_post = mcmc_with_warmup(Random.GLOBAL_RNG, ∇rosen_ll, 10_000;
                              reporter = NoProgressReport())

histogram2d(first.(rosen_post.chain), last.(rosen_post.chain), bins = 100)

RNG = Random.GLOBAL_RNG

results = DynamicHMC.mcmc_keep_warmup(RNG, ∇rosen_ll, 0; reporter = NoProgressReport())
steps = DynamicHMC.mcmc_steps(results.sampling_logdensity, results.final_warmup_state)
Q = results.final_warmup_state.Q

# a single update step
Q, tree_stats = DynamicHMC.mcmc_next_step(steps, Q)

grid = range(-1.5, 3.5; length = 101)

# extract the position
Q.q

DynamicHMC.Diagnostics.leapfrog_trajectory(∇rosen_ll, Q.q, -5:5)
