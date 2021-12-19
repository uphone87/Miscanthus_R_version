# use branch direct_radiation_input
library(BioCro)

# parameters and weather inputs

load("miscanthus_giganteus_initial_state.rdata")
load("miscanthus_giganteus_logistic_parameters.rdata")
load("growing_season_weather.rdata")
load("miscanthus_giganteus_ss_logistic_modules.rdata")
load("miscanthus_giganteus_deriv_logistic_modules.rdata")


result <- Gro_solver(initial_state =  miscanthus_giganteus_initial_state,
                     parameters = miscanthus_giganteus_logistic_parameters,
                     varying_parameters = growing_season_weather,
                     steady_state_module_names = miscanthus_giganteus_ss_logistic_modules,
                     derivative_module_names = miscanthus_giganteus_deriv_logistic_modules, verbose = TRUE)