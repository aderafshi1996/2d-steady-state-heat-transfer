 program p6		
    implicit none
    	real,parameter::lx=1,ly=1
        integer,parameter::Nx=20,Ny=20
     real::Dx,Dy	
		integer::i,j,iter
        
real,dimension (0:Nx,0:Ny)::T
	Dx=lx/Nx
        Dy=ly/Ny
	
        DO i=0,Nx	
	DO j=0,Ny
       T(i,j)=0
       end do
       end do
   
     DO j=0,Ny
       T(0,j)=0
       T(Nx,j)=0
       end do
       

     DO i=0,Nx
   
       T(i,0)=100
       T(i,Ny)=100
       end do
       

       DO iter=1,1000
         DO i=1,Nx-1
           DO j=1,Ny-1
             T(i,j)=(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))/4
             end do
             end do
             end do
 
         

open(12,file='result.plt')
write(12,*) 'variables= X, Y, T'
write(12,*) 'zone i= ', Nx+1, 'j=', Ny+1


Do j=0,Ny
    do i=0,Nx
        write(12,*) i*Dx, j*Dy, T(i,j)
    end do
End Do

     end program    