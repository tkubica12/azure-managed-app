#!/bin/bash
rm app.zip
zip app.zip createUiDefinition.json mainTemplate.json
git add -A
git commit -m auto
git push
