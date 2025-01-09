using DifferentialEquations
using MAT
using Statistics: mean

function kuramotoEdge(history_src, theta_dst, coupling)
    return coupling * sin(history_src - theta_dst)
end

function kuramotoNetwork!(dtheta, theta, h, p, t)
    Kcoupling_matrix, delay_matrix, omega, N = p
    for i in 1:N
        dtheta[i] = omega
        for j in 1:N
            if Kcoupling_matrix[i, j] != 0
                delayed_source = h(p, t - delay_matrix[i, j])[j]
                dtheta[i] += kuramotoEdge(delayed_source, theta[i], Kcoupling_matrix[i, j])
            end
        end
    end
    return nothing
end

function loadNetwork(filename)
    file = matopen(filename)
    coupling_matrix = read(file, "C")
    distance_in_m = read(file, "D") .* 1e-3
    close(file)
    return coupling_matrix, distance_in_m
end

function runSimulation(matrix_source_file, mean_time_delay, omega, K, tspan)
    coupling_matrix, distance_in_m = loadNetwork(matrix_source_file)
    N = size(coupling_matrix, 1)
    delay_matrix = distance_in_m ./ mean(distance_in_m) .* mean_time_delay
    kcoupling_matrix = K .* coupling_matrix
    p = (kcoupling_matrix, delay_matrix, omega, N)

    theta0 = 1 .* ones(N) .+ 0.1 .* randn(N)
    thetacopy = copy(theta0)
    h(p, x) = thetacopy

    prob = DDEProblem(kuramotoNetwork!, theta0, h, tspan, p; constant_lags = vec(delay_matrix))
    show(prob)
    alg = MethodOfSteps(Tsit5())
    sol = solve(prob, alg)
    return sol
end

function runSimulation(couplingMatrix, timedelayMatrix, omega, tspan)
    N = size(couplingMatrix, 1)
    p = (couplingMatrix, timedelayMatrix, omega, N)

    theta0 = 1 .* ones(N) .+ 0.1 .* randn(N)
    h(p, x) = ones(N).*1.0

    prob = DDEProblem(kuramotoNetwork!, theta0, h, tspan, p; constant_lags = vec(timedelayMatrix))
    show(prob)
    alg = MethodOfSteps(Tsit5())
    sol = solve(prob, alg)
    return sol
end


