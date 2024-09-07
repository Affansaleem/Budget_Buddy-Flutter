import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://mmvmgjgpcobxotqxvvri.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1tdm1namdwY29ieG90cXh2dnJpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU2OTIyNDAsImV4cCI6MjA0MTI2ODI0MH0.aNMNjriivN7MBGzPrV4TtkJzOyNv7CCmIBSykiK9hSE",
  );
  runApp(const MyApp());
}
