# coil_simulation
Matlab-based software to simulation B1 field for several geometries of coils.

There are 2 options:
- circular distribution of elements around a cylinder - circular_array.m
- planar distribution of the elements - planar_array.m

When you run the script you will be asked to define the radius along X axis and Y axis. In addition, you can define the initial position of your element. For circular_array define initial positions to 0 for all axes. 

You will need to define the field request area along X, Y and Z. For example if you what only the plane XZ for Y=0, define the Y axis request as initial=0, final=0, precision=1; When defining a request for a single plane  the dimensions of both axis need to be equal, for example if you define XZ plane request for Y=0: 
- Xinitial=-10;Xfinal=10;Precision=1;
- Yinitial=0;Yfinal=0;Precision=1;
- Zinitial=0;Zfinal=20;Precision=1;

For planar array:
- use image_slice_B1.m to plot the resultant field.
- use plot_planar_array.m to plot the array.

For circular array:
- use image_slice_SNR_B1.m to plot the resultant field.
- use plot_array.m to plot the array.

Biblio
- https://www.dropbox.com/s/6u3wtb14pr3tq38/COHEN-ADAD_9780123969736.pdf?dl=0
