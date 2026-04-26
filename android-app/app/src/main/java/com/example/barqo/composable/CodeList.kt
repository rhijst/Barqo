package com.example.barqo.composable

import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.example.barqo.models.CodeItem
import com.example.barqo.composable.CodeRow

@Composable
fun CodeList(
    items: List<CodeItem>,
    modifier: Modifier = Modifier,
    onDelete: (Int) -> Unit,
    onEdit: (Int, String) -> Unit
) {
    LazyColumn(modifier = modifier) {
        items(items.size) { index ->
            val item = items[index]
            CodeRow(item, onDelete, onEdit)
        }
    }
}
