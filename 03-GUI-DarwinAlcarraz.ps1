###############NOMBRE Y APELLIDO DEL AUTOR: DARWIN ALCARRAZ ####################
TERCER SCRIPT: INTERFAZ GRAFICA DE USUARIO
# 1. CARGAR LIBRERÍAS DE .NET PARA LA GUI

#Lo que hace Add-Type es: Comando que carga un ensamblado (biblioteca de clases) de .NET en la sesión actual de PowerShell.
#Lo que hace -AssemblyName es: Parámetro de Add-Type que especifica el nombre de la biblioteca (DLL) a cargar.
#Lo que hace System.Windows.Forms es: Nombre de la biblioteca que contiene las clases para crear ventanas, botones y controles de interfaz gráfica (GUI).
#lo que hace toda la línea es: Habilitar la capacidad de PowerShell para construir una ventana de Windows (Formulario).
Add-Type -AssemblyName System.Windows.Forms

#Lo que hace Add-Type es: Comando para cargar un ensamblado de .NET.
#Lo que hace -AssemblyName es: Parámetro que especifica el nombre de la biblioteca.
#Lo que hace System.Drawing es: Nombre de la biblioteca que contiene las clases para manejar aspectos visuales como dimensiones (Size), posiciones (Point) y gráficos.
#lo que hace toda la línea es: Habilitar la capacidad de PowerShell para definir el tamaño y la ubicación de los elementos de la GUI.
Add-Type -AssemblyName System.Drawing

# 2. CREACIÓN DEL FORMULARIO PRINCIPAL (LA VENTANA)

#Lo que hace $form es: Asigna el objeto recién creado a esta variable, que representa la ventana principal.
#Lo que hace New-Object es: Comando que crea una nueva instancia de la clase de .NET especificada.
#Lo que hace System.Windows.Forms.Form es: La clase que define el contenedor principal (la ventana) de la interfaz gráfica.
#lo que hace toda la línea es: Crear la ventana (el formulario) donde se añadirán todos los controles.
$form = New-Object System.Windows.Forms.Form

#Lo que hace $form.Text es: Propiedad que define el texto que aparece en la barra de título de la ventana.
#Lo que hace "Input Form" es: El valor literal de la cadena que será el título.
#lo que hace toda la línea es: Establecer el título de la ventana de la GUI como "Input Form".
$form.Text = "Input Form"

#Lo que hace $form.Size es: Propiedad que define las dimensiones del formulario.
#Lo que hace New-Object System.Drawing.Size(500,250) es: Crea un objeto de tamaño, definiendo el ancho (500 píxeles) y el alto (250 píxeles) del formulario.
#lo que hace toda la línea es: Establecer el tamaño de la ventana a 500 píxeles de ancho por 250 píxeles de alto.
$form.Size = New-Object System.Drawing.Size(500,250)

#Lo que hace $form.StartPosition es: Propiedad que define dónde aparecerá la ventana al abrirse.
#Lo que hace "CenterScreen" es: Valor de la enumeración que indica que la ventana debe aparecer centrada en la pantalla del usuario.
#lo que hace toda la línea es: Configurar la ventana para que se abra en el centro de la pantalla.
$form.StartPosition = "CenterScreen"

# 3. CREACIÓN DE ETIQUETAS (LABELS) Y CAJAS DE TEXTO (TEXTBOXES)

# Etiqueta 1
#Lo que hace $textLabel1 es: Asigna el objeto de etiqueta a la variable.
#Lo que hace New-Object System.Windows.Forms.Label es: Crea un elemento de texto estático (no editable) para identificar el campo de entrada.
#lo que hace toda la línea es: Crear la etiqueta para el primer campo de entrada.
$textLabel1 = New-Object System.Windows.Forms.Label
#Lo que hace $textLabel1.Text es: Propiedad que establece el texto visible de la etiqueta.
#lo que hace toda la línea es: Poner el texto "Input 1:" en la primera etiqueta.
$textLabel1.Text = "Input 1:"
#Lo que hace $textLabel1.Left es: Propiedad que establece la coordenada X (posición horizontal) de la etiqueta.
#lo que hace toda la línea es: Colocar la etiqueta a 20 píxeles del borde izquierdo.
$textLabel1.Left = 20
#Lo que hace $textLabel1.Top es: Propiedad que establece la coordenada Y (posición vertical) de la etiqueta.
#lo que hace toda la línea es: Colocar la etiqueta a 20 píxeles del borde superior.
$textLabel1.Top = 20
#Lo que hace $textLabel1.Width es: Propiedad que establece el ancho de la etiqueta.
#lo que hace toda la línea es: Establecer el ancho de la etiqueta a 120 píxeles.
$textLabel1.Width = 120

# Etiqueta 2
#lo que hace toda la línea es: Crear la etiqueta para el segundo campo de entrada.
$textLabel2 = New-Object System.Windows.Forms.Label
#lo que hace toda la línea es: Poner el texto "Input 2:" en la segunda etiqueta.
$textLabel2.Text = "Input 2:"
#lo que hace toda la línea es: Colocar la etiqueta a 20 píxeles del borde izquierdo.
$textLabel2.Left = 20
#lo que hace toda la línea es: Colocar la etiqueta a 60 píxeles del borde superior.
$textLabel2.Top = 60
#lo que hace toda la línea es: Establecer el ancho de la etiqueta a 120 píxeles.
$textLabel2.Width = 120

# Etiqueta 3
#lo que hace toda la línea es: Crear la etiqueta para el tercer campo de entrada.
$textLabel3 = New-Object System.Windows.Forms.Label
#lo que hace toda la línea es: Poner el texto "Input 3:" en la tercera etiqueta.
$textLabel3.Text = "Input 3:"
#lo que hace toda la línea es: Colocar la etiqueta a 20 píxeles del borde izquierdo.
$textLabel3.Left = 20
#lo que hace toda la línea es: Colocar la etiqueta a 100 píxeles del borde superior.
$textLabel3.Top = 100
#lo que hace toda la línea es: Establecer el ancho de la etiqueta a 120 píxeles.
$textLabel3.Width = 120

# Caja de Texto 1
#Lo que hace $textBox1 es: Asigna el objeto de caja de texto a la variable.
#Lo que hace New-Object System.Windows.Forms.TextBox es: Crea un control que permite al usuario ingresar y editar texto.
#lo que hace toda la línea es: Crear el primer campo de texto interactivo.
$textBox1 = New-Object System.Windows.Forms.TextBox
#Lo que hace $textBox1.Left es: Posición horizontal, desplazada para quedar junto a la etiqueta 1.
#lo que hace toda la línea es: Colocar la caja de texto a 150 píxeles del borde izquierdo.
$textBox1.Left = 150
#Lo que hace $textBox1.Top es: Posición vertical, alineada con la etiqueta 1.
#lo que hace toda la línea es: Colocar la caja de texto a 20 píxeles del borde superior.
$textBox1.Top = 20
#Lo que hace $textBox1.Width es: Propiedad que establece el ancho del campo de texto.
#lo que hace toda la línea es: Establecer el ancho de la caja de texto a 200 píxeles.
$textBox1.Width = 200

# Caja de Texto 2
#lo que hace toda la línea es: Crear el segundo campo de texto interactivo.
$textBox2 = New-Object System.Windows.Forms.TextBox
#lo que hace toda la línea es: Colocar la caja de texto a 150 píxeles del borde izquierdo.
$textBox2.Left = 150
#lo que hace toda la línea es: Colocar la caja de texto a 60 píxeles del borde superior, alineada con la etiqueta 2.
$textBox2.Top = 60
#lo que hace toda la línea es: Establecer el ancho de la caja de texto a 200 píxeles.
$textBox2.Width = 200

# Caja de Texto 3
#lo que hace toda la línea es: Crear el tercer campo de texto interactivo.
$textBox3 = New-Object System.Windows.Forms.TextBox
#lo que hace toda la línea es: Colocar la caja de texto a 150 píxeles del borde izquierdo.
$textBox3.Left = 150
#lo que hace toda la línea es: Colocar la caja de texto a 100 píxeles del borde superior, alineada con la etiqueta 3.
$textBox3.Top = 100
#lo que hace toda la línea es: Establecer el ancho de la caja de texto a 200 píxeles.
$textBox3.Width = 200

# 4. INICIALIZAR VALORES

#Lo que hace $defaultValue es: Variable temporal que guarda una cadena vacía.
#lo que hace toda la línea es: Definir una cadena vacía para usarla como valor inicial.
$defaultValue = ""

#Lo que hace $textBox1.Text = $defaultValue es: Establece el contenido inicial del campo de texto.
#lo que hace toda la línea es: Asegurar que el primer campo de texto esté inicialmente vacío.
$textBox1.Text = $defaultValue

#lo que hace toda la línea es: Asegurar que el segundo campo de texto esté inicialmente vacío.
$textBox2.Text = $defaultValue

#lo que hace toda la línea es: Asegurar que el tercer campo de texto esté inicialmente vacío.
$textBox3.Text = $defaultValue

# 5. CREACIÓN Y CONFIGURACIÓN DEL BOTÓN "OK"

#Lo que hace $button es: Asigna el objeto de botón a la variable.
#Lo que hace New-Object System.Windows.Forms.Button es: Crea un control interactivo que el usuario puede hacer clic.
#lo que hace toda la línea es: Crear el botón de acción "OK".
$button = New-Object System.Windows.Forms.Button

#Lo que hace $button.Left es: Posición horizontal.
#lo que hace toda la línea es: Colocar el botón a 360 píxeles del borde izquierdo.
$button.Left = 360

#Lo que hace $button.Top es: Posición vertical, colocándolo debajo de las cajas de texto.
#lo que hace toda la línea es: Colocar el botón a 140 píxeles del borde superior.
$button.Top = 140

#Lo que hace $button.Width es: Ancho del botón.
#lo que hace toda la línea es: Establecer el ancho del botón a 100 píxeles.
$button.Width = 100

#Lo que hace $button.Text es: Texto visible que aparece en el botón.
#lo que hace toda la línea es: Poner el texto "OK" en el botón.
$button.Text = "OK"

# 6. DEFINICIÓN DE LA ACCIÓN (EVENTO CLICK)

#Lo que hace $button.Add_Click({ }) es: Método que adjunta un bloque de código a ejecutar (un "manejador de eventos") cuando el botón es presionado.
#lo que hace toda la línea es: Definir qué sucede cuando el usuario hace clic en el botón "OK".
$button.Add_Click({

    #Lo que hace $form.Tag es: Propiedad del formulario utilizada para almacenar datos arbitrarios (como un mapa o diccionario).
    #Lo que hace @{} es: Crea una estructura de datos tipo Hashtable (clave-valor).
    #lo que hace toda la línea es: Inicializar una estructura de datos temporal para guardar las entradas del usuario.
    $form.Tag = @{

        #Lo que hace Box1 = $textBox1.Text es: Asigna el valor actual del texto del $textBox1 a la clave 'Box1'.
        #lo que hace toda la línea es: Guardar el contenido del primer campo de texto en la clave 'Box1'.
        Box1 = $textBox1.Text

        #lo que hace toda la línea es: Guardar el contenido del segundo campo de texto en la clave 'Box2'.
        Box2 = $textBox2.Text

        #lo que hace toda la línea es: Guardar el contenido del tercer campo de texto en la clave 'Box3'.
        Box3 = $textBox3.Text
    }

    #Lo que hace $form.Close() es: Método que cierra la ventana (el formulario).
    #lo que hace toda la línea es: Cerrar la ventana una vez que los datos han sido guardados.
    $form.Close()
})

# 7. AÑADIR LOS CONTROLES AL FORMULARIO

#Lo que hace $form.Controls es: Es la colección de elementos (controles) que se muestran en el formulario.
#Lo que hace .Add($button) es: Agrega el objeto $button a la lista de controles visibles del formulario.
#lo que hace toda la línea es: Mostrar el botón 'OK' en la ventana.
$form.Controls.Add($button)

#lo que hace toda la línea es: Mostrar la primera etiqueta de texto en la ventana.
$form.Controls.Add($textLabel1)
#lo que hace toda la línea es: Mostrar la segunda etiqueta de texto en la ventana.
$form.Controls.Add($textLabel2)
#lo que hace toda la línea es: Mostrar la tercera etiqueta de texto en la ventana.
$form.Controls.Add($textLabel3)

#lo que hace toda la línea es: Mostrar el primer campo de entrada de texto en la ventana.
$form.Controls.Add($textBox1)
#lo que hace toda la línea es: Mostrar el segundo campo de entrada de texto en la ventana.
$form.Controls.Add($textBox2)
#lo que hace toda la línea es: Mostrar el tercer campo de entrada de texto en la ventana.
$form.Controls.Add($textBox3)

# 8. MOSTRAR EL FORMULARIO Y RECUPERAR DATOS

#Lo que hace $form.ShowDialog() es: Muestra la ventana de manera modal, bloqueando el script hasta que la ventana se cierra.
#Lo que hace | Out-Null es: Redirige cualquier salida estándar para que no se imprima en la consola.
#lo que hace toda la línea es: Abrir la ventana de la GUI y esperar a que el usuario presione 'OK' o la cierre.
$form.ShowDialog() | Out-Null

#Lo que hace return es: Comando para devolver valores al script de PowerShell que llamó a este formulario.
#Lo que hace $form.Tag.BoxX es: Accede a los valores (Box1, Box2, Box3) que se guardaron cuando se hizo clic en el botón 'OK'.
#lo que hace toda la línea es: Devolver los tres valores capturados por el usuario para que el script principal pueda utilizarlos.
return $form.Tag.Box1, $form.Tag.Box2, $form.Tag.Box3
