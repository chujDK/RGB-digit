# 数码管段选
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN F14} [get_ports DP[0]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN N14} [get_ports DP[1]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN J13} [get_ports DP[2]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN G13} [get_ports DP[3]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN F13} [get_ports DP[4]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN G14} [get_ports DP[5]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN M13} [get_ports DP[6]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN H14} [get_ports DP[7]]

# 数码管位选
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN P14} [get_ports AN[0]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN K13} [get_ports AN[1]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN J14} [get_ports AN[2]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN M17} [get_ports AN[3]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN C11} [get_ports AN[4]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN D10} [get_ports AN[5]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN C10} [get_ports AN[6]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN C9 } [get_ports AN[7]]

# Duration In
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN T6} [get_ports Duration[3]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN V7} [get_ports Duration[2]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN R8} [get_ports Duration[1]]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN U9} [get_ports Duration[0]]

# 晶振
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN E3} [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk]

# LED
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN U6} [get_ports Green]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN R5} [get_ports Yellow]
set_property -dict {IOSTANDARD LVCMOS18 PACKAGE_PIN U7} [get_ports Red]
