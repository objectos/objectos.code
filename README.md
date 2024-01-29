# Objectos Code

Objectos Code is a Java library for generating Java source code.

It provides a [string template processor](https://openjdk.org/jeps/430) and a facility for generating an import declaration list.

The following Java program:

```java
// obtain the Code instance
Code code = Code.of();

// names for the generated type
String packageName = "com.example";
String simpleName = "HelloWorld";

// imports will be relative to the 'com.example' pkg
ImportList importList = code.importList(packageName);

// the name for the java.util.List type
ClassName LIST = ClassName.of(List.class);

// the template for our generated type
String result = code."""
  package \{packageName};
  \{importList}
  public class \{simpleName} {
    public static void main(String[] args) {
      \{LIST}<String> lines = \{LIST}.of("Hello", "Objectos Code!");
      for (var line : lines) {
        System.out.println(line);
      }
    }
  }
  """;

System.out.println(result);
```

Prints the following:

```java
package com.example;

import java.util.List;

public class HelloWorld {
  public static void main(String[] args) {
    List<String> lines = List.of("Hello", "Objectos Code!");
    for (var line : lines) {
      System.out.println(line);
    }
  }
}
```

## Alpha quality

Please note that this is a work in progress and the latest release is marked as alpha quality.

In particular, the exported API might change substantially between releases.

## Instalation

Objectos Code requires JDK 21 with preview features enabled.

You need to build it from source.

TBD

## License

Copyright (C) 2014-2024 [Objectos Software LTDA](https://www.objectos.com.br)

Licensed under the Apache License, Version 2.0.