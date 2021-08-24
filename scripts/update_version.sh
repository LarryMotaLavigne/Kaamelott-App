update_build_version(){
  set -e
  perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.$2.$3.$4.$5.$6.$7.($8+1)/e' pubspec.yaml
}

update_patch_version(){
  set -e
  perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.$2.$3.$4.$5.($6+1).("+1")/e' pubspec.yaml
}

update_minor_version(){
  set -e
  perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.$2.$3.($4+1).(".0+1")/e' pubspec.yaml
}

update_major_version(){
  set -e
  perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.($2+1).(".0.0+1")/e' pubspec.yaml
}

commit_push_and_tag(){
  [-v "$GITLAB_ACCESS_TOKEN"] && echo "Missing environment variable GITLAB_ACCESS_TOKEN, please provide it in Gitlab secrets" && exit 1;
  git config --global user.email "${GITLAB_USER_EMAIL}"
  git config --global user.name "${GITLAB_USER_NAME}"
  git config --global push.default simple
  git config remote.ci-origin.url >&- || git remote add ci-origin https://oauth2:${GITLAB_ACCESS_TOKEN}@gitlab.com/${CI_PROJECT_PATH}
  git checkout -b ${CI_COMMIT_BRANCH}

  version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`
  git commit -m "[ci skip] Bump version to $version" pubspec.yaml
  git push ci-origin HEAD:${CI_COMMIT_BRANCH}

  git tag -a "$version" -m "Auto release"
  git push ci-origin $version

}

get_version(){
  echo `grep 'version: ' pubspec.yaml | sed 's/version: //' | awk -F'+' '{print $1}'`
}

get_build_version(){
  echo `grep 'version: ' pubspec.yaml | sed 's/version: //' | awk -F'+' '{print $2}'`
}


"$@"