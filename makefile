INCLUDES = $(shell pkg-config --cflags opencv)
INCLUDES_EIGEN3 = -I /usr/include/eigen3
INLCUDES_G2O = -I /usr/local/include/g2o

LIBDIRS = $(shell pkg-config --libs opencv)
G2O_LIBS = /usr/local/lib/libg2o_core.so /usr/local/lib/libg2o_types_sba.so \
	/usr/local/lib/libg2o_solver_csparse.so /usr/local/lib/libg2o_csparse_extension.so \
	/usr/local/lib/libg2o_stuff.so 

all:Feature_Direct_VO

Feature_Direct_VO:Feature_Direct_VO.o
	g++ -std=c++11 -o Feature_Direct_VO Feature_Direct_VO.o $(G2O_LIBS) $(LIBDIRS) 
Feature_Direct_VO.o:Feature_Direct_VO.cpp
	g++ -std=c++11 -c Feature_Direct_VO.cpp $(INCLUDES) $(INCLUDES_EIGEN3) $(INCLUDE_G2O)
clean:
	rm -f *.o Feature_Direct_VO
