CLEANUP=rm -rf output/blog output/tag output/authors.html output/categories.html output/tags.html

all:
	@pelican content
	@$(CLEANUP)

deploy:
	@rm -rf output
	@SITEURL='https://lukas.im' pelican content -d
	@$(CLEANUP)
	@rsync -c --archive output/ -e ssh serenity.kurz.pw:Container/lukas.im/data/www/ --delete --progress