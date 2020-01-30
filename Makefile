CLEANUP=rm -rf output/blog output/tag output/authors.html output/categories.html output/tags.html

all:
	@pelican content
	@$(CLEANUP)
	@cp -Ra extra/* output/

deploy:
	@rm -rf output
	@SITEURL='https://lukas.im' pelican content -d
	@$(CLEANUP)
	@cp -Ra extra/* output/
	@rsync -c --archive output/ -e ssh root@web.kurz.pw:/var/sites/lukas.im/ --delete --progress
