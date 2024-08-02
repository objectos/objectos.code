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
VERSION := 0.5-SNAPSHOT

## Deps versions
SLF4J_NOP := org.slf4j/slf4j-nop/1.7.36
TESTNG := org.testng/testng/7.9.0

# Delete the default suffixes
.SUFFIXES:

#
# code
#

.PHONY: all
all: test

## use JDK 22
JAVA_HOME := /opt/jdk-22

include make/java-core.mk

#
# code@clean
#

include make/common-clean.mk

#
# code@compile
#

## javac --release option
JAVA_RELEASE := 22

## --enable-preview ?
ENABLE_PREVIEW := 1

## resolution trigger
RESOLUTION_REQS := Makefile

include make/java-compile.mk

#
# code@test-compile
#

## test compile deps
TEST_COMPILE_DEPS := $(TESTNG)

include make/java-test-compile.mk

#
# code@test
#

## test main class
TEST_MAIN := objectos.code.RunTests

## www test runtime dependencies
TEST_RUNTIME_DEPS := $(SLF4J_NOP)

## test modules
TEST_ADD_MODULES := org.testng

## test --add-reads
TEST_ADD_READS := objectos.code=org.testng

## test runtime exports
TEST_ADD_EXPORTS := objectos.code/objectos.code.internal=org.testng

include make/java-test.mk

#
# code@jar
#

include make/java-jar.mk

#
# code@pom
#

## pom.xml description
DESCRIPTION := Objectos Way allows you to build full-stack web applications using only Java. 

#
# code@install
#

include make/java-install.mk
