# Template generated code from trgen 0.16.4
JAR = antlr4-4.10.1-complete.jar
CLASSPATH = $(JAR)\;.
.SUFFIXES: .g4 .java .class
.java.class:
	javac -cp $(CLASSPATH) $*.java
ANTLRGRAMMARS ?= $(wildcard *.g4)
GENERATED = EOParser.java EOLexer.java 
SOURCES = $(GENERATED) \
    Program.java \
    ErrorListener.java
default: antlr4-4.10.1-complete.jar classes
antlr4-4.10.1-complete.jar:
	curl https://repo1.maven.org/maven2/org/antlr/antlr4/4.10.1/antlr4-4.10.1-complete.jar -o ./antlr4-4.10.1-complete.jar
classes: $(GENERATED) $(SOURCES:.java=.class)
clean:
	rm -f *.class
	rm -f *.interp
	rm -f *.tokens
	rm -f $(GENERATED)
	rm -f $(JAR)
	rm -f EOBaseListener.java EOListener.java
run:
	java -classpath $(CLASSPATH) Program $(RUNARGS)
EOParser.java : EO.g4
	java -jar $(JAR) -encoding utf-8  $<
EOLexer.java : EO.g4
	java -jar $(JAR) -encoding utf-8  $<
test:
	java -classpath $(CLASSPATH) Program -file test.in -tokens -tree
