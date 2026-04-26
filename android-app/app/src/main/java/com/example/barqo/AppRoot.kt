package com.example.barqo

import androidx.compose.runtime.*
import androidx.navigation.compose.*
import com.example.barqo.Navigation.Destinations
import com.example.barqo.models.CodeItem
import com.example.barqo.models.CodeType
import com.example.barqo.screens.CreateScreen
import com.example.barqo.screens.MainScreen

@Composable
fun AppRoot() {
    val navController = rememberNavController()

    var items by remember {
        mutableStateOf(
            listOf(
                CodeItem(
                    id = 1,
                    title = "My Card",
                    content = "CARD:NAME=Test;NUMBER=123;",
                )
            )
        )
    }

    var nextId by remember { mutableStateOf(2) }

    NavHost(
        navController = navController,
        startDestination = Destinations.List.route
    ) {

        // LIST SCREEN
        composable(Destinations.List.route) {
            MainScreen(
                items = items,
                onAddClick = {
                    navController.navigate(Destinations.Create.route)
                },
                onDelete = { id ->
                    items = items.filterNot { it.id == id }
                },
                onEdit = { id, newValue ->
                    items = items.map {
                        if (it.id == id) it.copy(content = newValue) else it
                    }
                }
            )
        }

        // CREATE SCREEN
        composable(Destinations.Create.route) {
            CreateScreen(
                onSave = { newItem ->
                    val itemWithId = newItem.copy(id = nextId++)

                    items = items + itemWithId

                    navController.popBackStack()
                },
                onCancel = {
                    navController.popBackStack()
                }
            )
        }
    }
}