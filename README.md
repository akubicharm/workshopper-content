# OpenShift workshops content

Workshop content designed to be used by the [Workshopper tool](https://github.com/osevg/workshopper).

## Using this content

Either use the content directly by pointing at this repository

```
https://raw.githubusercontent.com/osevg/workshopper-content/master/
```

or host locally as static content, e.g. on OpenShift using the PHP S2I builder

```
$ oc new-app php~https://github.com/osevg/workshopper-content.git
```

and use that url to feed Workshopper with content.



## デプロイ方法
tools/content_deploy.sh スクリプトの変数を必要に応じて編集。
OpenShift にログインご、content_deploy.sh を実行
