//
//  RecipeTranslation.swift
//  Kitchen
//
//  Created by Daniel Leal PImenta on 03/06/25.
//

import Foundation

struct RecipeTranslation: Codable {
    let idMeal: String
    let translatedInstructions: String
    
    let translatedMeasures: [String: String]?
}

// RecipeTranslations.swift
import Foundation

struct RecipeTranslations {

    static let translations: [String: RecipeTranslation] = [
        
        "53032": RecipeTranslation( // idMeal para Tonkatsu Pork
            idMeal: "53032",
            translatedInstructions: """
            Remova o pedaço grande de gordura da borda de cada lombo de porco. Em seguida, bata cada lombo entre duas folhas de papel manteiga até atingir cerca de 1 cm de espessura – você pode fazer isso usando um amaciador de carne ou um rolo de macarrão. Depois de batido, use as mãos para remodelar a carne ao seu formato e espessura originais – este passo garantirá que a carne fique o mais suculenta possível.

            Coloque a farinha, os ovos e a farinha de rosca panko em três tigelas largas separadas. Tempere a carne e, em seguida, passe primeiro na farinha, depois nos ovos e, por último, na farinha de rosca.

            Em uma frigideira grande ou panela de refogar, adicione óleo suficiente para cobrir 2 cm da lateral da panela. Aqueça o óleo a 180°C – se você não tiver um termômetro, jogue um pouco de panko no óleo; se afundar um pouco e depois começar a fritar, o óleo está pronto. Adicione duas costeletas de porco e cozinhe por 1 minuto e 30 segundos de cada lado. Retire e deixe descansar sobre uma grade por 5 minutos. Repita com as costeletas de porco restantes.

            Enquanto o porco descansa, faça o molho misturando o ketchup, o molho inglês, o molho de ostra e o açúcar de confeiteiro, adicionando um pouco de água se estiver muito grosso. Fatie o tonkatsu e sirva regado com o molho.
            """,
            translatedMeasures: [
                "Pork chops": "4 costeletas",
                "Flour": "100g",
                "Eggs": "2 batidos",
                "Breadcrumbs": "100g",
                "Vegetable Oil": "Óleo para fritar",
                "Tomato Ketchup": "2 colheres de sopa",
                "Worcestershire Sauce": "2 colheres de sopa",
                "Oyster Sauce": "1 colher de sopa",
                "Caster Sugar": "2 colheres de sopa"
            ]
        ),
        "53034": RecipeTranslation( // idMeal para Japanese Katsudon
            idMeal: "53034",
            translatedInstructions: """
            Aqueça o óleo em uma panela, frite a cebola fatiada até dourar, depois adicione o tonkatsu (costeleta de porco empanada), colocando-o no meio da panela. Misture o caldo dashi, o molho de soja, o mirin e o açúcar e despeje três quartos da mistura ao redor do tonkatsu. Deixe ferver por alguns minutos para que o molho engrosse um pouco e o tonkatsu reaqueça.

            Despeje os ovos batidos ao redor do tonkatsu e cozinhe por 2-3 minutos até o ovo estar cozido, mas ainda um pouco líquido. Divida o arroz entre duas tigelas, depois cubra cada uma com metade da mistura de ovo e tonkatsu, polvilhe com a cebolinha picada e sirva imediatamente, regando com um pouco mais de molho de soja se quiser um toque extra de umami.
            """,
            translatedMeasures: [
                "Vegetable Oil": "1 colher de sopa",
                "Onion": "1 grande",
                "Pork chops": "1 porção picada", 
                "Vegetable Stock": "150ml",
                "Soy Sauce": "1 colher de sopa",
                "Mirin": "1 colher de chá",
                "Sugar": "1 colher de chá",
                "Eggs": "2 batidos",
                "Sushi Rice": "200g",
                "Chives": "Picada(s) a gosto"
            ]
        ),
        "52908": RecipeTranslation( // idMeal para Ratatouille
            idMeal: "52908",
            translatedInstructions: """
            Corte as berinjelas ao meio no sentido do comprimento. Coloque-as na tábua com o lado cortado para baixo, corte ao meio no sentido do comprimento novamente e depois em pedaços de 1,5 cm. Corte as pontas das abobrinhas e depois em fatias de 1,5 cm. Descasque os pimentões do talo até a base. Segure-os na vertical, corte ao redor do talo e depois em 3 pedaços. Remova qualquer membrana e pique em pedaços pequenos.
            
            Faça um pequeno corte em forma de cruz na base de cada tomate e coloque-os em uma tigela refratária. Despeje água fervente sobre os tomates, deixe por 20 segundos e retire-os. Jogue fora a água, coloque os tomates de volta e cubra com água fria. Deixe esfriar e retire a pele. Corte os tomates em quatro, raspe as sementes com uma colher e pique a polpa grosseiramente.
            
            Aqueça uma frigideira grande ou panela de refogar em fogo médio e, quando estiver quente, adicione 2 colheres de sopa de azeite. Doure as berinjelas por 5 minutos de cada lado até os pedaços ficarem macios. Reserve-as e frite as abobrinhas em outra colher de sopa de azeite por 5 minutos, até dourarem dos dois lados. Repita com os pimentões. Não cozinhe demais os vegetais nesta fase, pois eles ainda cozinharão mais no próximo passo.
            
            Rasgue as folhas de manjericão e reserve. Cozinhe a cebola na panela por 5 minutos. Adicione o alho e frite por mais um minuto. Misture o vinagre e o açúcar, depois adicione os tomates e metade do manjericão. Volte os vegetais para a panela com um pouco de sal e pimenta e cozinhe por 5 minutos. Sirva com o restante do manjericão.
            """,
            translatedMeasures: [
                "Aubergine": "2 grandes",
                "Courgettes": "4 unidades",
                "Yellow Pepper": "2 unidades",
                "Tomato": "4 grandes",
                "Olive Oil": "5 colheres de sopa",
                "Basil": "1 maço",
                "Onion": "1 média",
                "Garlic": "3 dentes finamente picados", // Chave é o seu Ingredient.name
                "Red Wine Vinegar": "1 colher de chá",
                "Sugar": "1 colher de chá"
            ]
        ),
        "52935": RecipeTranslation( // idMeal para Steak Diane
            idMeal: "52935",
            translatedInstructions: """
            Aqueça o óleo em uma frigideira de 30 cm em fogo médio-alto. 
            
            Tempere os bifes com sal e pimenta e adicione-os à frigideira; cozinhe, virando uma vez, até dourar dos dois lados e atingir o ponto desejado, cerca de 4 a 5 minutos para mal passado. 
            
            Transfira os bifes para um prato e reserve.
            
            Volte a frigideira para fogo alto e adicione o caldo de carne; cozinhe até reduzir para ½ xícara, cerca de 10 minutos. Despeje em uma tigela e reserve.
            
            Volte a frigideira ao fogo e adicione a manteiga; adicione o alho e as chalotas e cozinhe, mexendo, até ficarem macios, cerca de 2 minutos. 
            
            Adicione os cogumelos e cozinhe, mexendo, até liberarem qualquer líquido, este evaporar e os cogumelos começarem a dourar, cerca de 2 minutos. 
            
            Adicione o conhaque e acenda com um fósforo para flambar; cozinhe até a chama apagar. Misture o caldo reservado, o creme de leite, a mostarda Dijon, o molho inglês e o molho picante. 
            
            Em seguida, retorne os bifes à frigideira; cozinhe, virando-os no molho, até aquecerem e o molho engrossar, cerca de 4 minutos.
            
            Transfira os bifes para pratos de servir e misture a salsinha e a cebolinha ao molho; despeje o molho sobre os bifes para servir.
            """,
            translatedMeasures: [
                "Canola Oil": "2 colheres de sopa",
                "Beef Fillet": "4 filés",
                "Beef Stock": "1 1/2 xícara",
                "Butter": "2 colheres de sopa",
                "Garlic": "2 dentes picados",
                "Challots": "1 média finamente picada",
                "Mushrooms": "110g",
                "Brandy": "¼ xícara",
                "Heavy Cream": "¼ xícara",
                "Dijon Mustard": "1 colher de sopa",
                "Worcestershire Sauce": "1 colher de sopa",
                "Tabasco Sauce": "Algumas gotas",
                "Parsley": "1 colher de sopa picada",
                "Chives": "1 colher de sopa picada",
                "Salt": "A gosto",
                "Pepper": "A gosto"
            ]
        ),
        "52765": RecipeTranslation( // idMeal para Chicken Enchilada Casserole
            idMeal: "52765",
            translatedInstructions: """
            Corte cada peito de frango em cerca de 3 pedaços, para que cozinhe mais rápido, e coloque em uma panela pequena. Despeje o molho Enchilada sobre ele e cozinhe tampado em fogo baixo a médio até o frango estar cozido por completo, cerca de 20 minutos. Não é necessário adicionar água, o frango cozinhará no molho Enchilada. Certifique-se de mexer ocasionalmente para que não grude no fundo.
            Retire o frango da panela e desfie com dois garfos.
            Pré-aqueça o forno a 190°C (375°F).
            Comece a montar as camadas da caçarola. Comece com cerca de ¼ xícara do molho Enchilada restante no fundo de uma assadeira. (Se usar uma assadeira mais comprida, pode colocar 2 tortilhas de milho lado a lado). Coloque 2 tortilhas no fundo, cubra com ⅓ do frango e ⅓ do molho restante. Polvilhe com ⅓ do queijo e repita começando com mais 2 tortilhas, depois frango, molho, queijo. Repita com a última camada com os ingredientes restantes: tortilhas, frango, molho e queijo.
            Asse descoberto por 20 a 30 minutos, até borbulhar e o queijo derreter e começar a dourar por cima.
            Sirva quente.
            """,
            translatedMeasures: [
                "Enchilada sauce": "1 pote de 400g (aprox.)", // Chave é o seu Ingredient.name
                "Grated Cheese": "3 xícaras",
                "corn tortillas": "6 unidades",
                "chicken breasts": "2 unidades"
            ]
        ),
        "52819": RecipeTranslation( // idMeal para Cajun spiced fish tacos
            idMeal: "52819",
            translatedInstructions: """
            Cozinhar em uma marinada de tempero cajun e pimenta caiena torna este peixe super suculento e saboroso. Cubra com um molho cítrico e sirva em uma tortilha para um prato principal rápido, sem complicações e deliciosamente veranil.

            Em um prato grande, misture o tempero cajun e a pimenta caiena com um pouco de sal e pimenta a gosto e use para cobrir o peixe por completo.

            Aqueça um pouco de óleo em uma frigideira, adicione o peixe e cozinhe em fogo médio até dourar. Reduza o fogo e continue fritando até o peixe estar cozido por completo, cerca de 10 minutos. Cozinhe em lotes se não houver espaço suficiente na frigideira.

            Enquanto isso, prepare o molho combinando todos os ingredientes com um pouco de sal e pimenta a gosto.
            Aqueça as tortilhas no micro-ondas por 5-10 segundos para amolecê-las. Monte as tortilhas com abacate, alface e cebolinha, adicione uma colherada de salsa (molho), cubra com lascas grandes de peixe e regue com o molho (dressing).
            """,
            translatedMeasures: [
                "cajun": "2 colheres de sopa",
                "cayenne pepper": "1 colher de chá",
                "white fish": "4 filés",
                "Vegetable Oil": "1 colher de chá",
                "flour tortilla": "8 unidades",
                "avocado": "1 fatiado",
                "little gem lettuce": "2 desfiadas",
                "Chives": "4 talos picados/desfiados",
                "Salsa Sauce": "1 pote de 300ml", // <<< ATENÇÃO: Use esta chave se você adicionar "Salsa Sauce" aos seus Ingredients. Se mapear para "Parsley", a medida não fará sentido.
                "sour cream": "1 pote",
                "Lime": "1 unidade",
                "Garlic": "1 dente finamente picado"
            ]
        ),
        "53064": RecipeTranslation( // idMeal para Fettuccine Alfredo
            idMeal: "53064",
            translatedInstructions: """
            Cozinhe o macarrão de acordo com as instruções da embalagem em uma panela grande com água fervente e sal. Adicione o creme de leite fresco e a manteiga a uma frigideira grande em fogo médio até o creme borbulhar e a manteiga derreter. Misture o queijo parmesão e adicione temperos (sal e pimenta do reino). Deixe o molho engrossar levemente e então adicione o macarrão e misture até ficar coberto pelo molho. Decore com salsinha e está pronto.
            """,
            translatedMeasures: [
                "Fettuccine": "450g",
                "Heavy Cream": "1/2 xícara",
                "Butter": "1/2 xícara (113g)",
                "Parmesan": "1/2 xícara ralado",
                "Parsley": "2 colheres de sopa picada",
                "Pepper": "A gosto" // Chave é o seu Ingredient.name "Pepper"
            ]
        ),
        "52823": RecipeTranslation( // idMeal para Salmon Prawn Risotto
            idMeal: "52823",
            translatedInstructions: """
            Derreta a manteiga em uma panela de fundo grosso e cozinhe a cebola delicadamente, sem dourar, até ficar macia. Adicione o arroz e mexa para cobrir todos os grãos com a manteiga. Adicione o vinho e cozinhe delicadamente, mexendo até ser absorvido. Adicione gradualmente o caldo quente, mexendo até que cada adição seja absorvida. Continue mexendo até o arroz ficar macio. Tempere com o suco e as raspas de limão, e pimenta a gosto (provavelmente haverá sal suficiente do salmão para não precisar adicionar sal). Mexa delicadamente para aquecer. Sirva polvilhado com o parmesão e vegetais da estação. Grelhe o salmão e coloque-o delicadamente sobre o risoto com os camarões e os aspargos.
            """,
            translatedMeasures: [
                "Butter": "50g",
                "Onion": "1 finamente picada",
                "rice": "150g",
                "white wine": "125ml",
                "Vegetable Stock": "1 litro quente",
                "Lime": "Suco e raspas de 1", // Mapeado de "lemon"
                "King Prawns": "240g grandes",
                "salmon": "150g",
                "asparagus": "100g de pontas, branqueadas brevemente em água fervente",
                "Pepper": "Moída a gosto", // Mapeado de "black pepper"
                "Parmesan": "50g em lascas"
            ]
        )
        // Se esta for a última entrada, não precisa de vírgula.
        // Adicione uma vírgula aqui se esta não for a última entrada no dicionário.
    ]

    static func getTranslation(for idMeal: String) -> RecipeTranslation? {
        return translations[idMeal]
    }
}
