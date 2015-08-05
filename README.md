# coil_simulation
Matlab-based software to simulation B1 field for several geometries of coils.

First run planar_array.m
  - You will be asked to provide the number of elements and to define each one of them (size and position)
  - You will have to define the space where you what to do your filed calculation
  - The computed field will be save in a .mat file which contains B1,Bx,By,Bz componenets with the corresponding axis.

In order to plot the B1 field use plot_field_xz_img(B1,tpy,xp,zp), where B1 is the field, tpy is the y-axis slice.

