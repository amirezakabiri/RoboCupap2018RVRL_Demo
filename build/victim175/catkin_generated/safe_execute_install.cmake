execute_process(COMMAND "/home/s2/Desktop/RoboCupap2018RVRL_Demo/build/victim175/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/s2/Desktop/RoboCupap2018RVRL_Demo/build/victim175/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
