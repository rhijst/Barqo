package com.example.barqo.composable

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.barqo.models.CodeItem

@Composable
fun CodeRow(
    item: CodeItem,
    onDelete: (Int) -> Unit,
    onEdit: (Int, String) -> Unit
) {
    var editing by remember { mutableStateOf(false) }
    var text by remember { mutableStateOf(item.content) }

    Row(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        if (editing) {
            TextField(
                value = text,
                onValueChange = { text = it },
                modifier = Modifier.weight(1f)
            )
        } else {
            Text(
                text = item.content,
                modifier = Modifier.weight(1f)
            )
        }

        if (editing) {
            Text(
                "Save",
                modifier = Modifier.padding(start = 8.dp)
                    .clickable {
                        onEdit(item.id, text)
                        editing = false
                    }
            )
        } else {
            Text(
                "Edit",
                modifier = Modifier.padding(start = 8.dp)
                    .clickable { editing = true }
            )
        }

        Text(
            "Delete",
            modifier = Modifier.padding(start = 8.dp)
                .clickable { onDelete(item.id) }
        )
    }
}