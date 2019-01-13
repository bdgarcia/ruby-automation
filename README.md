# ruby-automation

## Front end testing
En el archivo **/test/google/search.rb** hay un ejemplo de test de front end sencillo, que consiste en realizar una busqueda en google y esperar un término en la página de resultados.
En este ejemplo se puede observar como se utilizan los pageobjects con **SitePrism**, como se pueden hacer assertions, y algunas sentencias basicas para navegar con selenium en ruby

## Backend request
En el archivo **/test/google/request.rb** se puede ver como armar un requests sencillo, y como comparar el codigo del resultado una vez obtenida la respuesta en un objeto, imprimiendo un poco mas de detalle en la consola al momento de ejecución

## Factory
En **/test/factories.rb** se puede ver como implementar factories, en este caso se producen users de la clase /test/models/user.rb, si bien no esta instanciado en ningun ejemplo por el momento, hacerlo seria muy sencillo y se pueden ver ejemplos acá: https://devhints.io/factory_bot

## Jenkins
El job de integración con jenkins puede verse en el Jenkinsfile situado en el root del repositorio
