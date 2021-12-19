library(BioCro)
# parameters inputs
#################################################################################
load("./parameters/miscanthus_giganteus_initial_state.rdata")
load("./parameters/miscanthus_giganteus_logistic_parameters.rdata")
load("./parameters/miscanthus_giganteus_ss_logistic_modules.rdata")
load("./parameters/miscanthus_giganteus_deriv_logistic_modules.rdata")

##Deepak prepared the solar radiation into direct and diffuse
weather <- read.csv("Urbana_2006.csv")

##To use the default BioCro solar radiation.
#miscanthus_giganteus_ss_logistic_modules[7]="incident_shortwave_from_ground_par"



growing_season_weather <- get_growing_season_climate(weather, threshold_temperature = 0)
result <- Gro_solver(initial_state =  miscanthus_giganteus_initial_state,
                         parameters = miscanthus_giganteus_logistic_parameters,
                         varying_parameters = growing_season_weather,
                         steady_state_module_names = miscanthus_giganteus_ss_logistic_modules,
                         derivative_module_names = miscanthus_giganteus_deriv_logistic_modules, verbose = FALSE)
plot(result$doy,result$Stem)
