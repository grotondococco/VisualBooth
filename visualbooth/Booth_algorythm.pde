class Product{
private
  int array1[],array2[];//i due operandi
  int N;//numero di bit
  boolean segno,booty;
  int bit_sign;
  int risulta[];
  boolean b;
  int Booth_arra[];
  int Bit_arra[];

public
  Product(int arr1[],int arr2[],int n){
    Booth_arra=new int[N];
    Bit_arra=new int[N];
    array1=new int[n];
    array1=arr1;
    array2=new int[n];
    array2=arr2;
    N=n;
  }
  
  int[][] moltiplicazione(){ //<>//
    int Matrice[][]=new int[N][2*N];
    for(int i=0;i<N;i++){
      for(int j=0;j<2*N;j++){
        Matrice[i][j]=0;
      }
    }
    
    int arra[]=new int[N];
    for(int i=0;i<N;i++){
      arra[i]=array1[i];
    }
    arra=conversione(arra);
   
    for(int i=0;i<N;i++){
      if(array2[N-1-i]==1 || array2[N-1-i]==2){
        for(int j=0;j<N;j++){
            Matrice[i][2*N-1-i-j]=array1[N-1-j];
            if(j>=0 && (j<=N-1-i)){
              if(array1[0]==1 && booty==true){
                Matrice[i][j]=1;
              }
            }
        }
        if(array2[N-1-i]==2){
          Matrice[i]=leftShift(Matrice[i]);
        }
      }
      else if(array2[N-i-1]==-1 || array2[N-i-1]==-2){
        for(int j=0;j<N;j++){
          if(j>=0 && (j<=N-1-i) && b==false){
            if(array1[0]==0){
              Matrice[i][j]=1;
            }
          }
          Matrice[i][2*N-1-i-j]=arra[N-1-j];
        }
        if(array2[N-i-1]==-2){
          Matrice[i]=leftShift(Matrice[i]);
        }
      }
    }
    
    somma(Matrice,1,Matrice[0],Matrice[1]);
    return Matrice;
  }
  
  void somma(int Matrice[][],int a,int add1[],int add2[]){
    if(a==N-1){
      add1=addLast(add1,Matrice[N-1]);
      risulta=new int[2*N];
      risulta=add1;
      return;
    }
    int carriage[]=new int[2*N+1];
    carriage[2*N]=0;
    int result[]=new int[2*N];
    if(a==1){
      for(int i=0;i<2*N;i++) result[i]=0;
    }
    for(int i=2*N-1;i>=0;i--){
      if(add1[i]==add2[i] && add1[i]==0 && carriage[i+1]==0){
        result[i]=0;
        carriage[i]=0;
      }
      else if((add1[i]!=add2[i] && carriage[i+1]==0) || (add1[i]==0 && add2[i]==0 && carriage[i+1]==1)){
        result[i]=1;
        carriage[i]=0;
      }
      else if((add1[i]!=add2[i] && carriage[i+1]==1) || (add1[i]==add2[i] && add1[i]==1 && carriage[i+1]==0)){
        result[i]=0;
        carriage[i]=1;
      }
      else {
        result[i]=1;
        carriage[i]=1;
      }
    }
    a++;
    somma(Matrice,a,result,Matrice[a]);
  }
  
  int[] addLast(int add1[],int add2[]){//ridondante però almeno funziona
    int carriage[]=new int[2*N+1];
    carriage[2*N]=0;
    int result[]=new int[2*N];
    for(int i=0;i<2*N;i++) result[i]=0;
    for(int i=2*N-1;i>=0;i--){
      if(add1[i]==add2[i] && add1[i]==0 && carriage[i+1]==0){
        result[i]=0;
        carriage[i]=0;
      }
      else if((add1[i]!=add2[i] && carriage[i+1]==0) || (add1[i]==0 && add2[i]==0 && carriage[i+1]==1)){
        result[i]=1;
        carriage[i]=0;
      }
      else if((add1[i]!=add2[i] && carriage[i+1]==1) || (add1[i]==add2[i] && add1[i]==1 && carriage[i+1]==0)){
        result[i]=0;
        carriage[i]=1;
      }
      else {
        result[i]=1;
        carriage[i]=1;
      }
    }
    return result;
  }
  
  
 //<>//
  
  int[] conversione(int[] riga){
    int counter=0;
    b=false;
    for(int i=0;i<N;i++){
      if(riga[i]==1) counter++;
    }
    if(counter==0){
      b=true;
    }
    for(int i=0;i<N;i++){
      if(riga[i]==0) riga[i]=1;
      else riga[i]=0;
    }
    for(int i=N-1;i>=0;i--){
      if(riga[i]==1) riga[i]=0;
      else{
        riga[i]=1;
        return riga;
      }
    }
    return riga;
  }
  
  int[] getRisulta(){
    return risulta;
  }
  
  void Booth(){

    int booth_arr[]=new int[N];
    for(int i=N-1;i>=0;i--){
      if(i==N-1){
        if(array2[i]==0){
          booth_arr[i]=0;
        }
        if(array2[i]==1){
          booth_arr[i]=-1;
        }
      }
      else if(array2[i]==array2[i+1]){
        booth_arr[i]=0;
      }
      else if(array2[i]==1 && array2[i+1]==0){
          booth_arr[i]=-1;
      }
      else if(array2[i]==0 && array2[i+1]==1){
          booth_arr[i]=1;
      }
    }
    bit_sign=array2[0];
    Booth_arra=booth_arr;
    array2=booth_arr;
  }
  
  int[] getBooth(){
    return Booth_arra;
  }
  
   void openBooth(){
     segno=true;
     booty=true;
   }
   
   void closeBooth(){
     booty=false;
     segno=false;
   }
   
   void bitPair(){
     int bitarra[]=new int[N];
     for(int i=0;i<N;i++) bitarra[i]=0;
     for(int i=N-1;i>=0;i=i-2){
       if(i!=0){
         if(array2[i]==0 && (array2[i-1]==-1 || array2[i-1]==1)){
           bitarra[i]=2*array2[i-1];
         }
         else if(array2[i]==1 && array2[i-1]==-1){
           bitarra[i]=-1;
         }
         else if(array2[i]==-1 && array2[i-1]==1){
           bitarra[i]=1;
         }
         else{
           bitarra[i]=array2[i];
         }
       }
       else{
         bitarra[i]=array2[i];
       }
     }

     Bit_arra=bitarra;
     array2=bitarra;
   }
   
   int[] leftShift(int[] riga){
     int copia[]=new int[2*N];
     copia[2*N-1]=0;
     for(int i=2*N-2;i>=0;i--){
       copia[i]=riga[i+1];
     }
     return copia;
   }
   
   int[] getBitarra(){
     return Bit_arra;
   }
  
}
