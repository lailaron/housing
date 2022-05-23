@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  app startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and APP_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\app.jar;%APP_HOME%\lib\ktor-serialization-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-gson-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-server-netty-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-server-host-common-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-server-core-jvm-1.6.8.jar;%APP_HOME%\lib\kotlinx-coroutines-jdk8-1.5.2-native-mt.jar;%APP_HOME%\lib\ktor-http-cio-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-http-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-network-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-utils-jvm-1.6.8.jar;%APP_HOME%\lib\ktor-io-jvm-1.6.8.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.5.2-native-mt.jar;%APP_HOME%\lib\kotlin-stdlib-jdk8-1.6.10.jar;%APP_HOME%\lib\guava-30.1.1-jre.jar;%APP_HOME%\lib\springdoc-openapi-data-rest-1.6.0.jar;%APP_HOME%\lib\springdoc-openapi-ui-1.6.0.jar;%APP_HOME%\lib\springdoc-openapi-kotlin-1.6.0.jar;%APP_HOME%\lib\kotlin-stdlib-jdk7-1.6.10.jar;%APP_HOME%\lib\spring-data-rest-core-3.6.0.jar;%APP_HOME%\lib\springdoc-openapi-hateoas-1.6.0.jar;%APP_HOME%\lib\springdoc-openapi-webmvc-core-1.6.0.jar;%APP_HOME%\lib\springdoc-openapi-common-1.6.0.jar;%APP_HOME%\lib\swagger-integration-2.1.11.jar;%APP_HOME%\lib\swagger-core-2.1.11.jar;%APP_HOME%\lib\swagger-models-2.1.11.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.13.0.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.13.0.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.13.0.jar;%APP_HOME%\lib\jackson-databind-2.13.0.jar;%APP_HOME%\lib\jackson-annotations-2.13.0.jar;%APP_HOME%\lib\webjars-locator-core-0.45.jar;%APP_HOME%\lib\jackson-core-2.13.0.jar;%APP_HOME%\lib\jackson-module-kotlin-2.13.0.jar;%APP_HOME%\lib\kotlin-reflect-1.6.10.jar;%APP_HOME%\lib\kotlinx-serialization-json-jvm-1.3.0.jar;%APP_HOME%\lib\kotlinx-serialization-core-jvm-1.3.0.jar;%APP_HOME%\lib\kotlin-stdlib-1.6.10.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.6.10.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\checker-qual-3.8.0.jar;%APP_HOME%\lib\error_prone_annotations-2.5.1.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\spring-hateoas-1.4.0.jar;%APP_HOME%\lib\spring-data-commons-2.6.0.jar;%APP_HOME%\lib\spring-plugin-core-2.0.0.RELEASE.jar;%APP_HOME%\lib\json-path-2.6.0.jar;%APP_HOME%\lib\slf4j-api-1.7.36.jar;%APP_HOME%\lib\config-1.4.1.jar;%APP_HOME%\lib\jansi-2.4.0.jar;%APP_HOME%\lib\netty-codec-http2-4.1.74.Final.jar;%APP_HOME%\lib\alpn-api-1.1.3.v20160715.jar;%APP_HOME%\lib\netty-transport-native-kqueue-4.1.74.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.74.Final.jar;%APP_HOME%\lib\gson-2.9.0.jar;%APP_HOME%\lib\swagger-ui-4.1.3.jar;%APP_HOME%\lib\annotations-13.0.jar;%APP_HOME%\lib\netty-codec-http-4.1.74.Final.jar;%APP_HOME%\lib\netty-handler-4.1.74.Final.jar;%APP_HOME%\lib\netty-codec-4.1.74.Final.jar;%APP_HOME%\lib\netty-transport-classes-kqueue-4.1.74.Final.jar;%APP_HOME%\lib\netty-transport-classes-epoll-4.1.74.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.74.Final.jar;%APP_HOME%\lib\netty-transport-4.1.74.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.74.Final.jar;%APP_HOME%\lib\netty-resolver-4.1.74.Final.jar;%APP_HOME%\lib\netty-common-4.1.74.Final.jar;%APP_HOME%\lib\spring-tx-5.3.13.jar;%APP_HOME%\lib\evo-inflector-1.3.jar;%APP_HOME%\lib\spring-webmvc-5.3.13.jar;%APP_HOME%\lib\spring-boot-autoconfigure-2.6.1.jar;%APP_HOME%\lib\spring-web-5.3.13.jar;%APP_HOME%\lib\swagger-annotations-2.1.11.jar;%APP_HOME%\lib\classgraph-4.8.116.jar;%APP_HOME%\lib\commons-lang3-3.12.0.jar;%APP_HOME%\lib\netty-tcnative-classes-2.0.48.Final.jar;%APP_HOME%\lib\spring-boot-2.6.1.jar;%APP_HOME%\lib\spring-context-5.3.13.jar;%APP_HOME%\lib\spring-aop-5.3.13.jar;%APP_HOME%\lib\spring-beans-5.3.13.jar;%APP_HOME%\lib\spring-expression-5.3.13.jar;%APP_HOME%\lib\spring-core-5.3.13.jar;%APP_HOME%\lib\spring-jcl-5.3.13.jar;%APP_HOME%\lib\json-smart-2.4.7.jar;%APP_HOME%\lib\jakarta.xml.bind-api-2.3.2.jar;%APP_HOME%\lib\jakarta.validation-api-2.0.2.jar;%APP_HOME%\lib\accessors-smart-2.4.7.jar;%APP_HOME%\lib\jakarta.activation-api-1.2.1.jar;%APP_HOME%\lib\snakeyaml-1.28.jar;%APP_HOME%\lib\asm-9.1.jar


@rem Execute app
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %APP_OPTS%  -classpath "%CLASSPATH%" housing.HousingAppKt %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable APP_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%APP_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
