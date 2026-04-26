package com.example.barqo.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.barqo.models.CodeItem

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CreateScreen(
    onSave: (CodeItem) -> Unit,
    onCancel: () -> Unit
) {
    var title by remember { mutableStateOf("") }
    var content by remember { mutableStateOf("") }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("New Code") }
            )
        }
    ) { padding ->

        Column(
            modifier = Modifier
                .padding(padding)
                .padding(16.dp)
        ) {

            // 🔹 INPUT CARD
            Card(
                modifier = Modifier.fillMaxWidth(),
                shape = MaterialTheme.shapes.large
            ) {
                Column(Modifier.padding(16.dp)) {

                    OutlinedTextField(
                        value = title,
                        onValueChange = { title = it },
                        label = { Text("Title") },
                        modifier = Modifier.fillMaxWidth()
                    )

                    Spacer(Modifier.height(12.dp))

                    OutlinedTextField(
                        value = content,
                        onValueChange = { content = it },
                        label = { Text("Content (QR data)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            }

            Spacer(Modifier.height(24.dp))

            // 🔹 ACTIONS
            Row {

                Button(
                    onClick = {
                        onSave(
                            CodeItem(
                                id = 0,
                                title = title,
                                content = content
                            )
                        )
                    },
                    enabled = title.isNotBlank() && content.isNotBlank()
                ) {
                    Text("Save")
                }

                Spacer(Modifier.width(8.dp))

                OutlinedButton(onClick = onCancel) {
                    Text("Cancel")
                }
            }
        }
    }
}