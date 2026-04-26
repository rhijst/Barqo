package com.example.barqo.composable

import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.IconButton
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun TopBar(onAdd: () -> Unit) {
    TopAppBar(
        title = { Text("Barqo") },
        actions = {
            IconButton(onClick = onAdd) {
                Text("+")
            }
        }
    )
}