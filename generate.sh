echo "Please enter some lowercase entity name you want to generate a component structure for: "
read model_name
model_lowcase=$model_name
models_name="${model_name}s"
echo "Please enter the same Pascalcased entity name: "
read model
rm -rf data.json
echo "{\"model\":\"$model\",\"model_lowcase\":\"$model_lowcase\"}" > data.json
mkdir -p app/pages/$model
mkdir -p app/pages/$model/components/
mkdir -p app/pages/$model/services/
cat data.json | mustache - _generic/components/model.html.mustache > app/pages/$model/components/$model_name.html
cat data.json | mustache - _generic/components/models.html.mustache > app/pages/$model/components/$models_name.html
cat data.json | mustache - _generic/components/model.ts.mustache > app/pages/$model/components/$model_name.ts
cat data.json | mustache - _generic/components/models.ts.mustache > app/pages/$model/components/$models_name.ts
cat data.json | mustache - _generic/services/model.service.ts.mustache > app/pages/$model/services/$model_name.service.ts
