package com.example.barqo.screens

import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Scaffold
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.example.barqo.composable.CodeList
import com.example.barqo.composable.TopBar
import com.example.barqo.models.CodeItem

@Composable
fun MainScreen(
    items: List<CodeItem>,
    onAddClick: () -> Unit,
    onDelete: (Int) -> Unit,
    onEdit: (Int, String) -> Unit
) {
    Scaffold(
        topBar = {
            TopBar(onAdd = onAddClick)
        }
    ) { padding ->
        CodeList(
            items = items,
            modifier = Modifier.padding(padding),
            onDelete = onDelete,
            onEdit = onEdit
        )
    }
}