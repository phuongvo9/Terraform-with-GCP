

gcloud source repos create REPO_DEMO

#Clone the new repository into your Cloud Shell session
gcloud source repos clone REPO_DEMO

#Push to the Cloud Source Repository
cd REPO_DEMO
echo 'Hello World!' > myfile.txt

git config --global user.email "phuong.vo@gcloud.com"
git config --global user.name "Phuong Vo"

git add myfile.txt
git commit -m "First file using Cloud Source Repositories" myfile.txt

git push origin master

# Browse files in the Google Cloud Source repository

