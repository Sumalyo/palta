add_force {/pwm_top/clk} -radix hex {1 0ns} {0 41665ps} -repeat_every 83330ps
add_force {/pwm_top/pio3} -radix hex {1 100ms} {0 350000000000ps} -repeat_every 500000000000ps
add_force {/pwm_top/pio1} -radix hex {1 100ms} {0 110000000000ps} -repeat_every 20000000000ps
run 1 s