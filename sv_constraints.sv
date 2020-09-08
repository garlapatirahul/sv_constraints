class base_seq extends from uvm_seqqunce

`uvm_object_utils(base_Seq)

rand int x,y,z;
rand int arr[10];
int q[$] = `{1,2,7};
rand bit bq[$];
int a;
constraint c_unique { unique {x,y,z};
                      unique {arr};
                      unique {x,y,arr};
                      unique{x,y,q}; }
                      
constraint c_foreach { 
                      foreach (arr[i]) arr[i] inside {[0:15]};
                      q.size inside {[5:10]};
                      foreach(q[i]) {
                      if(i>0) q[i] > q[i-1];
                      }
}

constraint c_sum {
                  bq_size inside {[10:20]};
                  (bq.sum with (int'(item))) == 7;
                  (a.sum with ((item.index < 3)?item:0) ==10;                  
                  }
              
x dist  {[0:10]:=20, [11:40]:=30, [41:50]:/20};
constraint c_func { z <= f(x);}
                   repeat(1000)
                     begin
                       randcase
                        10:a=2; 
                        20:a=4;
                        30:a=5;
                       endcase
enclass 

