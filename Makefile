.PHONY:site
site:
	JEKYLL_ENV=production bundle exec jekyll build --trace

.PHONY:serve
serve:
	JEKYLL_ENV=development bundle exec jekyll serve --verbose --watch --trace

.PHONY:release
release: site
	cp .htaccess _site
	cd _site; rsync --delete -PaAXz . $(USER)@$(WEB_SERVER):$(SITE_PATH)
