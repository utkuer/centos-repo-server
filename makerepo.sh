#!/bin/bash
yum -y install createrepo  yum-utils
reposync -g -l -d -m --repoid=base --newest-only --download-metadata --download_path=/repo/www/html/repos/
reposync -g -l -d -m --repoid=centosplus --newest-only --download-metadata --download_path=/repo/www/html/repos/
reposync -g -l -d -m --repoid=extras --newest-only --download-metadata --download_path=/repo/www/html/repos/
reposync -g -l -d -m --repoid=updates --newest-only --download-metadata --download_path=/repo/www/html/repos/
createrepo -g /repo/www/html/repos/base/comps.xml /repo/www/html/repos/base/  
createrepo -g /repo/www/html/repos/base/comps.xml /repo/www/html/repos/centosplus/
createrepo -g /repo/www/html/repos/base/comps.xml /repo/www/html/repos/extras/  
createrepo -g /repo/www/html/repos/base/comps.xml /repo/www/html/repos/updates/ 
