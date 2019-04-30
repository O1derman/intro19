#!/bin/awk -f

BEGIN {
        prac_map[""] = 0
        osoby_map[""] = 0
        parents = 0
        osoby[""] = 0
        prac[""] = 0
        num_of_prac = 0
        num_of_osob = 0
        checked[""] = 0
        checked_bool = 0
        x_bool = 0
        y_bool = 0
        tree[""] = 0
        print_bool[""] = 0
}

function do_osoby(){
        num_of_osob += 1
        id = $osoby_map["id"]
        name = $osoby_map["name"]
        phone = $osoby_map["phone"]
        email = $osoby_map["email"]
        department = $osoby_map["department"]

        osoby[id ".name"] = name
        osoby[id ".phone"] = phone
        osoby[id ".email"] = email
        osoby[id ".department"] = department
}

function do_prac(){
        num_of_prac += 1
        id = $prac_map["id"]    
        name = $prac_map["name"]        
        parent = $prac_map["parent"]    
        people = $prac_map["people"]    

        prac[id ".name"] = name
        prac[id ".parent"] = parent
        prac[id ".people"] = people
}

function do_cfg(map)
{       for (i = 1; i < NF + 1; i++){
                map[$i] = i
        }
}

{
        if (FILENAME == "pracoviste.cfg"){
                do_cfg(prac_map)
        }
 else if (FILENAME == "osoby.cfg"){
                do_cfg(osoby_map)
        }
        else if (FILENAME == "pracoviste.in"){
                do_prac()
        }
        else if (FILENAME == "osoby.in"){
                do_osoby()
        }


}

function print_tree(x){
        if(print_bool[x] != "true"){
        print_bool[x] = "true"
        if(prac[x ".parent"] == prac[x+1 ".name"]){
                parents += 1
                print_tree(x+1)
                }
        print "node " x "{"
        print "name " prac[x ".name"]
        split(prac[x ".people"], u, ";")
        for(h in u){
                tru = 0
                for(l = 1; l < num_of_osob+1; l++){
                        split(osoby[l ".department"], c, ";")
                        for (a in c){
                                if (h == c[a]){
                                        tru = 1}
                                }
                        }
                
                if(tru = 1){
                print "func " u[h]}
                else{
                print "link{"
                print "ref 111"
                        }
        }
        for(l = 1; l < num_of_osob+1; l++){
                split(osoby[l ".department"], departments, ";")
                for(h in departments){
                if(departments[h] == x && h==1){
                        print "person " l "{"
                        print "name " osoby[l ".name"]
                        print "phone " osoby[l ".phone"]
                        print "email " osoby[l ".email"]
                        print "}"
                }
                else{
                        if(departments[h] == x){
                                print "link {"
                                print "ref 000"
                                print "}"
                                }
                        }
        }}
        }
}
END {
        for (x = 1; x < num_of_prac+1; x++){
                print_tree(x) 
                for(f = 0; f < parents; f++){
                print "}"
                }
        }
}
