<?php
// Reads the variables sent via POST
$sessionId   = $_POST["sessionId"];  
$serviceCode = $_POST["serviceCode"];  
$text = $_POST["text"];

//This is the first menu screen
if ( $text == "" ) {
$response  = "Welcome to the Reportio Signup \n";
$response .= "1. Press 1 to continue";
}

// Menu for a user who selects '1' from the first menu
// Will be brought to this second menu screen
else if ($text == "1") {
$response  = "Pick a subscription tier from the options below\n";
$response .= "1. TRAFFIC Alerts - Ksh 10 Daily \n";
$response .= "2. SECURITY ALERTS - Ksh 10 Daily\n";
$response .= "3. NEWS Alerts - Ksh 10 Daily\n";
$response .= "4. All the above - Ksh 20 Daily\n";
$response .= "5. Unsubscribe from a service\n";
}

//Menu for a user who selects '1' from the second menu above
// Will be brought to this third menu screen

// FOR TRAFFIC ALERTS
else if ($text == "1*1") {
$response = "You are about to subscribe to TRAFFIC Alerts for KSH 10 Daily\n";
$response .= "Please Enter 1 to confirm \n";
}
else if ($text == "1*1*1") {
$response = "You have successfully subscribed to TRAFFIC alerts for Ksh 10 Daily \n";
$response .= "Enter 1 to Exit \n";
$response .= "Enter 0 to subscribe to more groups";
}
else if ($text == "1*1*1*1") {
$response = "END";
}
else if ($text == "1*1*1*0") {
    $response  = "Pick another subscription tier from the options below\n";
    $response .= "1. SECURITY ALERTS - Ksh 10 Daily\n";
    $response .= "2. NEWS Alerts - Ksh 10 Daily\n"; 
}

// for group 1 in submenu 1
else if ($text == "1*1*1*0*1") {
    $response = "You are about to subscribe to SECURITY Alerts for KSH 10 Daily\n";
    $response .= "Please Enter 1 to confirm \n";
}
else if ($text == "1*1*1*0*1*1") {
    $response = "You have successfully subscribed to NEWS alerts for Ksh 10 Daily \n";
    $response .= "Enter 1 to exit \n";
    $response .= "Enter 0 to subscribe to more groups";
    }
    else if ($text == "1*1*1*0*1*1*1") {
    $response = "END";
    }
    else if ($text == "1*1*1*0*1*1*0") {
        $response .= "1.Subscribe to NEWS Alerts - Ksh 10 Daily\n";
    }
    else if ($text == "1*1*1*0*1*1*0*1") {
        $response = "You have successfully subscribed to NEWS alerts for Ksh 10 Daily \n";
        $response .= "Enter 1 to Exit \n";
    }
    else if ($text == "1*1*1*0*1*1*0*1") {
        $response .= "END";
    }

    // For group 2 in submenu 1
    else if ($text == "1*1*1*0*2") {
        $response = "You are about to subscribe to NEWS Alerts for KSH 10 Daily\n";
        $response .= "Please Enter 1 to confirm \n";
    }
    else if ($text == "1*1*1*0*2*1") {
        $response = "You have successfully subscribed to NEWS alerts for Ksh 10 Daily \n";
        $response .= "Enter 1 to exit \n";
        $response .= "Enter 0 to subscribe to more groups";
        }
        else if ($text == "1*1*1*0*2*1*1") {
        $response = "END";
        }
        else if ($text == "1*1*1*0*2*1*0") {
            $response .= "1.Subscribe to SECURITY Alerts - Ksh 10 Daily\n";
        }
        else if ($text == "1*1*1*0*2*1*0*1") {
            $response = "You have successfully subscribed to SECURITY alerts for Ksh 10 Daily \n";
            $response .= "Enter 1 to Exit \n";
        }
        else if ($text == "1*1*1*0*2*1*0*1") {
            $response .= "END";
        }


        // FOR SECURITY ALERTS 
else if ($text == "1*2") {
    $response = "You are about to subscribe to SECURITY Alerts for KSH 10 Daily\n";
    $response .= "Please Enter 1 to confirm \n";
    }
    else if ($text == "1*2*1") {
    $response = "You have successfully subscribed to SECURITY alerts for Ksh 10 Daily \n";
    $response .= "Enter 1 to Exit \n";
    $response .= "Enter 0 to subscribe to more groups";
    }
    else if ($text == "1*2*1*1") {
    $response = "END";
    }
    else if ($text == "1*2*1*0") {
        $response  = "Pick another subscription tier from the options below\n";
        $response .= "1. TRAFFIC Alerts - Ksh 10 Daily\n";
        $response .= "2. NEWS Alerts - Ksh 10 Daily\n"; 
    }
    
    // for group 1 in submenu 2
    else if ($text == "1*2*1*0*1") {
        $response = "You are about to subscribe to TRAFFIC Alerts for KSH 10 Daily\n";
        $response .= "Please Enter 1 to confirm \n";
    }
    else if ($text == "1*2*1*0*1*1") {
        $response = "You have successfully subscribed to TRAFFIC alerts for Ksh 10 Daily \n";
        $response .= "Enter 1 to exit \n";
        $response .= "Enter 0 to subscribe to more groups";
        }
        else if ($text == "1*2*1*0*1*1*1") {
        $response = "END";
        }
        else if ($text == "1*2*1*0*1*1*0") {
            $response .= "1.Subscribe to NEWS Alerts - Ksh 10 Daily\n";
        }
        else if ($text == "1*2*1*0*1*1*0*1") {
            $response = "You have successfully subscribed to NEWS alerts for Ksh 10 Daily \n";
            $response .= "Enter 1 to Exit \n";
        }
        else if ($text == "1*2*1*0*1*1*0*1") {
            $response .= "END";
        }
    
        // For group 2 in submenu 2
        else if ($text == "1*2*1*0*2") {
            $response = "You are about to subscribe to NEWS Alerts for KSH 10 Daily\n";
            $response .= "Please Enter 1 to confirm \n";
        }
        else if ($text == "1*2*1*0*2*1") {
            $response = "You have successfully subscribed to NEWS alerts for Ksh 10 Daily \n";
            $response .= "Enter 1 to exit \n";
            $response .= "Enter 0 to subscribe to more groups";
            }
            else if ($text == "1*2*1*0*2*1*1") {
            $response = "END";
            }
            else if ($text == "1*2*1*0*2*1*0") {
                $response .= "1.Subscribe to TRAFFIC Alerts - Ksh 10 Daily\n";
            }
            else if ($text == "1*2*1*0*2*1*0*1") {
                $response = "You have successfully subscribed to TRAFFIC alerts for Ksh 10 Daily \n";
                $response .= "Enter 1 to Exit \n";
            }
            else if ($text == "1*2*1*0*2*1*0*1") {
                $response .= "END";
            }


            // FOR NEWS ALERTS
else if ($text == "1*3") {
    $response = "You are about to subscribe to NEWS Alerts for KSH 10 Daily\n";
    $response .= "Please Enter 1 to confirm \n";
    }
    else if ($text == "1*3*1") {
    $response = "You have successfully subscribed to NEWS alerts for Ksh 10 Daily \n";
    $response .= "Enter 1 to Exit \n";
    $response .= "Enter 0 to subscribe to more groups";
    }
    else if ($text == "1*3*1*1") {
    $response = "END";
    }
    else if ($text == "1*3*1*0") {
        $response  = "Pick another subscription tier from the options below\n";
        $response .= "1. TRAFFIC Alerts - Ksh 10 Daily\n";
        $response .= "2. SECURITY Alerts - Ksh 10 Daily\n"; 
    }
    
    // for group 1 in submenu 2
    else if ($text == "1*3*1*0*1") {
        $response = "You are about to subscribe to TRAFFIC Alerts for KSH 10 Daily\n";
        $response .= "Please Enter 1 to confirm \n";
    }
    else if ($text == "1*3*1*0*1*1") {
        $response = "You have successfully subscribed to TRAFFIC alerts for Ksh 10 Daily \n";
        $response .= "Enter 1 to exit \n";
        $response .= "Enter 0 to subscribe to more groups";
        }
        else if ($text == "1*3*1*0*1*1*1") {
        $response = "END";
        }
        else if ($text == "1*3*1*0*1*1*0") {
            $response .= "1.Subscribe to SECURITY Alerts - Ksh 10 Daily\n";
        }
        else if ($text == "1*3*1*0*1*1*0*1") {
            $response = "You have successfully subscribed to SECURITY alerts for Ksh 10 Daily \n";
            $response .= "Enter 1 to Exit \n";
        }
        else if ($text == "1*3*1*0*1*1*0*1") {
            $response .= "END";
        }
    
        // For group 2 in submenu 2
        else if ($text == "1*3*1*0*2") {
            $response = "You are about to subscribe to SECURITY Alerts for KSH 10 Daily\n";
            $response .= "Please Enter 1 to confirm \n";
        }
        else if ($text == "1*3*1*0*2*1") {
            $response = "You have successfully subscribed to SECURITY alerts for Ksh 10 Daily \n";
            $response .= "Enter 1 to exit \n";
            $response .= "Enter 0 to subscribe to more groups";
            }
            else if ($text == "1*3*1*0*2*1*1") {
            $response = "END";
            }
            else if ($text == "1*3*1*0*2*1*0") {
                $response .= "1.Subscribe to TRAFFIC Alerts - Ksh 10 Daily\n";
            }
            else if ($text == "1*2*1*0*2*1*0*1") {
                $response = "You have successfully subscribed to TRAFFIC alerts for Ksh 10 Daily \n";
                $response .= "Enter 1 to Exit \n";
            }
            else if ($text == "1*2*1*0*2*1*0*1") {
                $response .= "END";
            }

            // SUBSCRIBE TO ALL 
            else if ($text == "1*4") {
                $response = "You are about to subscribe to ALL Alerts for KSH 20 Daily\n";
                $response .= "Please Enter 1 to confirm \n";
                }
                else if ($text == "1*4*1") {
                    $response = "You have successfully subscribed to ALL alerts for Ksh 20 Daily \n";
                    $response .= "Enter 1 to Exit \n";
                    }

                    
            // UNSUBSCRIBE
            else if ($text == "1*5") {
                $response = "Please choose the subscription you would like to STOP\n";
                $response .= "1. TRAFFIC Alerts \n";
                $response .= "2. NEWS Alerts\n";
                $response .= "3. SECURITY Alerts\n";
                $response .= "4. CANCEL \n";
                }

                // Remove from Traffic
                else if ($text == "1*5*1") {
                $response = "YOu are about to unsubscrie from TRAFFIC Alerts\n";
                $response .= "Enter 1 to confirm \n";
                $response .= "Enter 0 to cancel";
                }
                else if ($text == "1*5*1*1") {
                    $response = "You have been unsubscribed from TRAFFIC Alerts";
                    }
                else if ($text == "1*5*1*0") {
                $response = "END";
                }
              
                  // Remove from News
                  else if ($text == "1*5*2") {
                    $response = "YOu are about to unsubscrie from NEWS Alerts\n";
                    $response .= "Enter 1 to confirm \n";
                    $response .= "Enter 0 to cancel";
                    }
                    else if ($text == "1*5*2*1") {
                        $response = "You have been unsubscribed from NEWS Alerts";
                        }
                    else if ($text == "1*5*2*0") {
                    $response = "END";
                    }

                      // Remove from Security 
                else if ($text == "1*5*3") {
                    $response = "YOu are about to unsubscrie from SECURITY Alerts\n";
                    $response .= "Enter 1 to confirm \n";
                    $response .= "Enter 0 to cancel";
                    }
                    else if ($text == "1*5*3*1") {
                        $response = "You have been unsubscribed from SECURITY Alerts";
                        }
                    else if ($text == "1*5*3*0") {
                    $response = "END";
                    }

                      // Remove from ALL
                else if ($text == "1*5*4") {
                    $response = "YOu are about to unsubscrie from ALL Alerts\n";
                    $response .= "Enter 1 to confirm \n";
                    $response .= "Enter 0 to cancel";
                    }
                    else if ($text == "1*5*1*1") {
                        $response = "You have been unsubscribed from ALL Alerts";
                        }
                    else if ($text == "1*5*4*0") {
                    $response = "END";
                    }

                      // CANCEL
                else if ($text == "1*5*0") {
                    $response = "END\n";
                    
                    }
                    

//echo response
header('Content-type: text/plain');
echo $response
?>