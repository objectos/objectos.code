#
# Copyright (C) 2014-2024 Objectos Software LTDA.
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
# pom template
#

# $(1) = group id
# $(2) = artifact id
# $(3) = version
# $(4) = description
# $(5) = deps
define POM_TMPL
<?xml version="1.0" encoding="UTF-8"?>
<!--

    Copyright (C) 2014-2024 Objectos Software LTDA.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

-->
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">

	<modelVersion>4.0.0</modelVersion>
	
	<groupId>$(1)</groupId>
	<artifactId>$(2)</artifactId>
	<version>$(3)</version>
	<name>$(1):$(2)</name>

	<description>
	$(4)
	</description>

	<url>https://www.objectos.com.br/</url>

	<inceptionYear>2014</inceptionYear>

	<licenses>
		<license>
			<name>The Apache License, Version 2.0</name>
			<url>https://www.apache.org/licenses/LICENSE-2.0</url>
			<distribution>repo</distribution>
		</license>
	</licenses>

	<scm>
		<connection>scm:git:git://github.com/objectos/objectos.code.git</connection>
		<developerConnection>scm:git:ssh://git@github.com/objectos/objectos.code.git</developerConnection>
		<url>https://github.com/objectos/objectos.code</url>
		<tag>HEAD</tag>
	</scm>

	<organization>
		<name>Objectos Software LTDA</name>
		<url>https://www.objectos.com.br/</url>
	</organization>

	<developers>
		<developer>
			<id>objectos</id>
			<name>Objectos Software LTDA</name>
			<email>opensource@objectos.com.br</email>
			<organization>Objectos Software LTDA</organization>
			<organizationUrl>https://www.objectos.com.br/</organizationUrl>
		</developer>
	</developers>
	
</project>
endef

#
# mk-pom function
#

mk-pom = $(call POM_TMPL,$(GROUP_ID),$(ARTIFACT_ID),$(VERSION),$(DESCRIPTION))
