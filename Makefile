#
# Copyright (C) 2023 Objectos Software LTDA.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Objectos Code
#

## Coordinates
GROUP_ID := br.com.objectos
ARTIFACT_ID := objectos.code
VERSION := 0.1-SNAPSHOT
MODULE := $(ARTIFACT_ID)

## Resolution dir (required)
RESOLUTION_DIR := work/resolution

## Deps versions
SLF4J_VERSION := 1.7.36
TESTNG_VERSION := 7.7.1

# Delete the default suffixes
.SUFFIXES:

#
# Default target
#

.PHONY: all
all: test

#
# code@clean
#

## basedir
BASEDIR := .

include make/tools.mk
include make/deps.mk
include make/resolver.mk
include make/clean.mk
$(eval $(call CLEAN_TASK,,))

#
# code@compile
#

## javac --release option
JAVA_RELEASE = 21

## --enable-preview ?
ENABLE_PREVIEW = 1

## resolution trigger
RESOLUTION_REQS := Makefile

include make/compile.mk
$(eval $(call COMPILE_TASK,,))

#
# code@test-compile
#

## test compile deps
TEST_COMPILE_DEPS := $(COMPILE_MARKER)
TEST_COMPILE_DEPS += $(RESOLUTION_DIR)/org.testng/testng/$(TESTNG_VERSION)

include make/test-compile.mk
$(eval $(call TEST_COMPILE_TASK,,))

#
# code@test
#

## www test runtime dependencies
TEST_RUNTIME_DEPS := $(TEST_COMPILE_DEPS)
TEST_RUNTIME_DEPS += $(RESOLUTION_DIR)/org.slf4j/slf4j-nop/$(SLF4J_VERSION)

## test runtime exports
TEST_JAVAX_EXPORTS := objectos.code.internal

include make/test-run.mk
$(eval $(call TEST_RUN_TASK,,))

#
# code@jar
#

include make/jar.mk
$(eval $(call JAR_TASK,,))

#
# code@install
#

include make/install.mk
$(eval $(call INSTALL_TASK,,))
