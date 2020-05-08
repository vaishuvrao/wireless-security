

#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
set val(ifq)    Queue/DropTail/PriQueue    ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     21                         ;# number of mobilenodes
set val(rp)     AODV                       ;# routing protocol
set val(x)      434                      ;# X dimension of topography
set val(y)      6608                      ;# Y dimension of topography
set val(stop)   60.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out_all_600.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out_all_600.nam w]
$ns namtrace-all $namfile
$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)];#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting  $val(rp) \
                -llType        $val(ll) \
                -macType       $val(mac) \
                -ifqType       $val(ifq) \
                -ifqLen        $val(ifqlen) \
                -antType       $val(ant) \
                -propType      $val(prop) \
                -phyType       $val(netif) \
                -channel       $chan \
                -topoInstance  $topo \
                -agentTrace    ON \
                -routerTrace   ON \
                -macTrace      ON \
                -movementTrace ON
$val(mac) set CWMin_ 64
$val(mac) set CWMax_ 64

#===================================
#        Nodes Definition        
#===================================
#Create 21 nodes
set n0 [$ns node]
$n0 set X_ 630
$n0 set Y_ 293
$n0 set Z_ 0.0
$ns initial_node_pos $n0 20



set n1 [$ns node]
$n1 set X_ 680
$n1 set Y_ 293
$n1 set Z_ 0.0
$ns initial_node_pos $n1 20
$ns node-config -reset


set n2 [$ns node]
$n2 set X_ 730
$n2 set Y_ 293
$n2 set Z_ 0.0
$ns initial_node_pos $n2 20
$ns node-config -reset




set n3 [$ns node]
$n3 set X_ 780
$n3 set Y_ 293
$n3 set Z_ 0.0
$ns initial_node_pos $n3 20
$ns node-config -reset

set n4 [$ns node]
$n4 set X_ 830
$n4 set Y_ 293
$n4 set Z_ 0.0
$ns initial_node_pos $n4 20
$ns node-config -reset



set n5 [$ns node]
$n5 set X_ 880
$n5 set Y_ 293
$n5 set Z_ 0.0
$ns initial_node_pos $n5 20
$ns node-config -reset
$val(mac) set CWMin_ 64
$val(mac) set CWMax_ 64



set n6 [$ns node]
$n6 set X_ 930
$n6 set Y_ 293
$n6 set Z_ 0.0
$ns initial_node_pos $n6 20



set n7 [$ns node]
$n7 set X_ 630
$n7 set Y_ 243
$n7 set Z_ 0.0
$ns initial_node_pos $n7 20


set n8 [$ns node]
$n8 set X_ 680
$n8 set Y_ 243
$n8 set Z_ 0.0
$ns initial_node_pos $n8 20

set n9 [$ns node]
$n9 set X_ 730
$n9 set Y_ 243
$n9 set Z_ 0.0
$ns initial_node_pos $n9 20


set n10 [$ns node]
$n10 set X_ 780
$n10 set Y_ 243
$n10 set Z_ 0.0
$ns initial_node_pos $n10 20





set n11 [$ns node]
$n11 set X_ 830
$n11 set Y_ 243
$n11 set Z_ 0.0
$ns initial_node_pos $n11 20


set n12 [$ns node]
$n12 set X_ 880
$n12 set Y_ 243
$n12 set Z_ 0.0
$ns initial_node_pos $n12 20




set n13 [$ns node]
$n13 set X_ 930
$n13 set Y_ 243
$n13 set Z_ 0.0
$ns initial_node_pos $n13 20


set n14 [$ns node]
$n14 set X_ 630
$n14 set Y_ 193
$n14 set Z_ 0.0
$ns initial_node_pos $n14 20



set n15 [$ns node]
$n15 set X_ 680
$n15 set Y_ 193
$n15 set Z_ 0.0
$ns initial_node_pos $n15 20

set n16 [$ns node]
$n16 set X_ 730
$n16 set Y_ 193
$n16 set Z_ 0.0
$ns initial_node_pos $n16 20



set n17 [$ns node]
$n17 set X_ 780
$n17 set Y_ 193
$n17 set Z_ 0.0
$ns initial_node_pos $n17 20

set n18 [$ns node]
$n18 set X_ 830
$n18 set Y_ 193
$n18 set Z_ 0.0
$ns initial_node_pos $n18 20

set n19 [$ns node]
$n19 set X_ 880
$n19 set Y_ 193
$n19 set Z_ 0.0
$ns initial_node_pos $n19 20


set n20 [$ns node]
$n20 set X_ 930
$n20 set Y_ 193
$n20 set Z_ 0.0
$ns initial_node_pos $n20 20



#===================================
#        Agents Definition        
#===================================
#Setup a UDP connection
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set null9 [new Agent/Null]
$ns attach-agent $n7 $null9
$ns connect $udp0 $null9
$udp0 set packetSize_ 600

#Setup a UDP connection
set udp1 [new Agent/UDP]
$ns attach-agent $n7 $udp1
set null10 [new Agent/Null]
$ns attach-agent $n8 $null10
$ns connect $udp1 $null10
$udp1 set packetSize_ 600

#Setup a UDP connection
set udp2 [new Agent/UDP]
$ns attach-agent $n16 $udp2
set null11 [new Agent/Null]
$ns attach-agent $n9 $null11
$ns connect $udp2 $null11
$udp2 set packetSize_ 600

#Setup a UDP connection
set udp3 [new Agent/UDP]
$ns attach-agent $n9 $udp3
set null12 [new Agent/Null]
$ns attach-agent $n10 $null12
$ns connect $udp3 $null12
$udp3 set packetSize_ 600

#Setup a UDP connection
set udp4 [new Agent/UDP]
$ns attach-agent $n10 $udp4
set null13 [new Agent/Null]
$ns attach-agent $n11 $null13
$ns connect $udp4 $null13
$udp4 set packetSize_ 600

#Setup a UDP connection
set udp5 [new Agent/UDP]
$ns attach-agent $n4 $udp5
set null16 [new Agent/Null]
$ns attach-agent $n11 $null16
$ns connect $udp5 $null16
$udp5 set packetSize_ 600

#Setup a UDP connection
set udp6 [new Agent/UDP]
$ns attach-agent $n13 $udp6
set null14 [new Agent/Null]
$ns attach-agent $n20 $null14
$ns connect $udp6 $null14
$udp6 set packetSize_ 600

#Setup a UDP connection
set udp7 [new Agent/UDP]
$ns attach-agent $n12 $udp7
set null15 [new Agent/Null]
$ns attach-agent $n13 $null15
$ns connect $udp7 $null15
$udp7 set packetSize_ 600

#Setup a UDP connection
set udp8 [new Agent/UDP]
$ns attach-agent $n8 $udp8
set null17 [new Agent/Null]
$ns attach-agent $n15 $null17
$ns connect $udp8 $null17
$udp8 set packetSize_ 600


#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 600
$cbr0 set rate_ 70.0Kb
$cbr0 set random_ null
$ns at 5.0 "$cbr0 start"
$ns at 40.0 "$cbr0 stop"

#Setup a CBR Application over UDP connection
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
$cbr1 set packetSize_ 600
$cbr1 set rate_ 70.0Kb
$cbr1 set random_ null
$ns at 10.0 "$cbr1 start"
$ns at 55.0 "$cbr1 stop"

#Setup a CBR Application over UDP connection
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
$cbr2 set packetSize_ 600
$cbr2 set rate_ 70.0Kb
$cbr2 set random_ null
$ns at 12.0 "$cbr2 start"
$ns at 30.0 "$cbr2 stop"

#Setup a CBR Application over UDP connection
set cbr3 [new Application/Traffic/CBR]
$cbr3 attach-agent $udp3
$cbr3 set packetSize_ 600
$cbr3 set rate_ 70.0Kb
$cbr3 set random_ null
$ns at 20.0 "$cbr3 start"
$ns at 55.0 "$cbr3 stop"

#Setup a CBR Application over UDP connection
set cbr4 [new Application/Traffic/CBR]
$cbr4 attach-agent $udp4
$cbr4 set packetSize_ 600
$cbr4 set rate_ 70.0Kb
$cbr4 set random_ null
$ns at 30.0 "$cbr4 start"
$ns at 45.0 "$cbr4 stop"

#Setup a CBR Application over UDP connection
set cbr5 [new Application/Traffic/CBR]
$cbr5 attach-agent $udp5
$cbr5 set packetSize_ 600
$cbr5 set rate_ 70.0Kb
$cbr5 set random_ null
$ns at 10.0 "$cbr5 start"
$ns at 50.0 "$cbr5 stop"

#Setup a CBR Application over UDP connection
set cbr6 [new Application/Traffic/CBR]
$cbr6 attach-agent $udp6
$cbr6 set packetSize_ 600
$cbr6 set rate_ 70.0Kb
$cbr6 set random_ null
$ns at 5.0 "$cbr6 start"
$ns at 49.0 "$cbr6 stop"

#Setup a CBR Application over UDP connection
set cbr7 [new Application/Traffic/CBR]
$cbr7 attach-agent $udp7
$cbr7 set packetSize_ 600
$cbr7 set rate_ 70.0Kb
$cbr7 set random_ null
$ns at 12.0 "$cbr7 start"
$ns at 30.0 "$cbr7 stop"

#Setup a CBR Application over UDP connection
set cbr8 [new Application/Traffic/CBR]
$cbr8 attach-agent $udp8
$cbr8 set packetSize_ 600
$cbr8 set rate_ 70.0Kb
$cbr8 set random_ null
$ns at 6.0 "$cbr8 start"
$ns at 47.0 "$cbr8 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out_all_600.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
    $ns at $val(stop) "\$n$i reset"
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run
