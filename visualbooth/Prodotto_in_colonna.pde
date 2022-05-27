class ProdottoC extends Product{

  int input1[];
  int input2[];
  int Matrix[][];
  int result[];
  int N;
  
  ProdottoC(int arr1[],int arr2[],int n){
    super(arr1,arr2,n);
    Matrix=new int[n][2*n];
    input1=arr1;
    input2=arr2;
    N=n;
    avvia();
  }
  
  void avvia(){
    Matrix=moltiplicazione();
    result=getRisulta();
  }
  
}
