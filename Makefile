build:
	jupyter-book build explanationSpace

publish:
	ghp-import -n -p -f explanationSpace/_build/html	

pull_overleaf:
	git pull overleaf master

push_overleaf:
	git push overleaf master

gitall:
	git add .
	@read -p "Enter commit message: " message; 	git commit -m "$$message"
	git push
	git push overleaf master

black:
	python -m black .