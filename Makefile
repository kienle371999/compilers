source_project = project.vc

start-project:
	rm -rf search.java search.class result.txt
	jflex hello-world.jflex
	javac search.java
	java search $(source_project)