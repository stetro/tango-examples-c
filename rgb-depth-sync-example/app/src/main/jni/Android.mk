#
# Copyright 2014 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)
PROJECT_ROOT_FROM_JNI:= ../../../../..
PROJECT_ROOT:= $(call my-dir)/../../../../..

include $(CLEAR_VARS)
LOCAL_MODULE    := librgb_depth_sync_example

LOCAL_SHARED_LIBRARIES := tango_client_api
LOCAL_CFLAGS    := -std=c++11

LOCAL_C_INCLUDES := $(PROJECT_ROOT)/tango-service-sdk/include/ \
                    $(PROJECT_ROOT)/tango-gl/include \
                    $(PROJECT_ROOT)/third-party/glm/

LOCAL_SRC_FILES := camera_texture_drawable.cc \
                   color_image.cc \
                   depth_image.cc \
                   jni_interface.cc \
                   rgb_depth_sync_application.cc \
                   scene.cc \
                   util.cc \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/bounding_box.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/camera.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/conversions.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/cube.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/drawable_object.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/frustum.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/grid.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/line.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/mesh.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/shaders.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/trace.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/transform.cpp \
                   $(PROJECT_ROOT_FROM_JNI)/tango-gl/util.cpp
                   
LOCAL_LDLIBS    := -llog -lGLESv3 -L$(SYSROOT)/usr/lib
include $(BUILD_SHARED_LIBRARY)
$(call import-add-path, $(PROJECT_ROOT))
$(call import-module,tango_client_api)
