package com.example.barqo.models

data class CodeItem(
    val id: Int,
    val title: String,
    val content: String,
)

enum class CodeType {
    TEXT,
    URL,
    CARD
}