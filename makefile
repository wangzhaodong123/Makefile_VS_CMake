#OPENCV
INCLUDE_OPENCV = $(shell pkg-config --cflags opencv)
LIBDIR_OPENCV = $(shell pkg-config --libs opencv)

#eigen3
INCLUDE_EIGEN = -I /usr/include/eigen3

#PCL
INCLUDE_PCL = -I /usr/include/pcl-1.7
LIBDIR_PCL = -lpcl_common -lpcl_octree -lpcl_io -lpcl_common -lpcl_octree 

#BOOST
LIBDIR_BOOST = -lboost_thread -lboost_date_time -lboost_iostreams -lboost_serialization -lboost_system -lboost_filesystem

#OPENNI
INCLUDE_OPENNI = -I /usr/include/ni
LIBDIR_OPENNI = -lOpenNI

#VTK
INCLUDE_VTK = -I/usr/include/vtk-5.8
LIBDIR_VTK = /usr/lib/libvtkViews.so.5.8.0 /usr/lib/libvtkInfovis.so.5.8.0 \
	     /usr/lib/libvtkWidgets.so.5.8.0 /usr/lib/libvtkHybrid.so.5.8.0 \
	     /usr/lib/libvtkParallel.so.5.8.0 /usr/lib/libvtkVolumeRendering.so.5.8.0 \
	     /usr/lib/libvtkRendering.so.5.8.0 /usr/lib/libvtkGraphics.so.5.8.0 \
	     /usr/lib/libvtkImaging.so.5.8.0 /usr/lib/libvtkIO.so.5.8.0 \
	     /usr/lib/libvtkFiltering.so.5.8.0 /usr/lib/libvtkCommon.so.5.8.0 \
	     /usr/lib/libvtksys.so.5.8.0 
#G2O
INCLUDE_G2O = -I /usr/local/include/g2o
LIBDIR_G2O = /usr/local/lib/libg2o_core.so /usr/local/lib/libg2o_types_sba.so \
	/usr/local/lib/libg2o_solver_csparse.so /usr/local/lib/libg2o_csparse_extension.so \
	/usr/local/lib/libg2o_stuff.so
	
all:joinMap

joinMap:joinMap.o
	g++ -std=c++11 -Wno-deprecated -o joinMap joinMap.o $(LIBDIR_PCL) $(LIBDIR_OPENCV) $(LIBDIR_BOOST) $(LIBDIR_OPENNI) $(LIBDIR_VTK) $(LIBDIR_G2O)
joinMap.o:joinMap.cpp
	g++ -std=c++11 -Wno-deprecated -c joinMap.cpp $(INCLUDE_OPENCV) $(INCLUDE_EIGEN) $(INCLUDE_PCL) $(INCLUDE_VTK) $(INCLUDE_OPENNI) $(INCLUDE_G2O)
clean:
	rm -f *.o joinMap