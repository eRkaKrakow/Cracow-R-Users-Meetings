
test <-
simulate(PLATfit, kt.lookback = last_year - structural_break_year + 1,
         gc.order = c(2,1,0), nsim = 200, h = forecast_length)
test$rates['25',,] %>% matplot(type = 'l')

prediction_PLAT_stoch[1:200,1,] %>% t %>% matlines(type = 'l', col = 'black',lty =2)
