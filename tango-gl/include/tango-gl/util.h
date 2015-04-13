/*
 * Copyright 2014 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef TANGO_GL_GL_UTIL_H_
#define TANGO_GL_GL_UTIL_H_
#define GLM_FORCE_RADIANS

#define GL_VERTEX_PROGRAM_POINT_SIZE 0x8642

#include <stdlib.h>
#include <jni.h>
#include <android/log.h>
#include <GLES2/gl2.h>
#include <GLES2/gl2ext.h>

#include "glm/glm.hpp"
#include "glm/gtc/matrix_transform.hpp"
#include "glm/gtc/quaternion.hpp"
#include "glm/gtc/type_ptr.hpp"
#include "glm/gtx/matrix_decompose.hpp"

#define LOG_TAG "tango_jni_example"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)

#ifndef M_PI
#define M_PI 3.1415926f
#endif

#define RADIAN_2_DEGREE 57.2957795f
#define DEGREE_2_RADIANS 0.0174532925f

namespace tango_gl {
namespace util {
  void CheckGlError(const char* operation);

  GLuint CreateProgram(const char* vertex_source,
                       const char* fragment_source);

  glm::quat ConvertRotationToOpenGL(const glm::quat& rotation);
  glm::vec3 ConvertPositionToOpenGL(const glm::vec3& position);

  void DecomposeMatrix(const glm::mat4& transform_mat,
                              glm::vec3& translation,
                              glm::quat& rotation,
                              glm::vec3& scale);
  glm::vec3 GetTranslationFromMatrix(const glm::mat4& transform_mat);

  float Clamp(float value, float min, float max);
  void PrintMatrix(const glm::mat4& matrix);
  void PrintVector(const glm::vec3& vector);

  glm::vec3 LerpVector(const glm::vec3& x, const glm::vec3& y, float a);
  float DistanceSquared(const glm::vec3& v1, const glm::vec3& v2);
}  // namespace util
}  // namespace tango_gl
#endif  // TANGO_GL_RENDERER_GL_UTIL
