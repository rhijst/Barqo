package com.example.barqo.Navigation

sealed class Destinations(val route: String) {
    object List : Destinations("list")
    object Create : Destinations("create")
}