use axum::{
    routing::get,
    Router,
};
use tokio::net::TcpListener;
use tracing_subscriber;

#[tokio::main]
async fn main() {
    // Initialize tracing
    tracing_subscriber::fmt::init();

    // Build our application with a route
    let app = Router::new()
        .route("/", get(root))
        .route("/health", get(health_check));

    // Run it with hyper on localhost:3000
    let listener = TcpListener::bind("0.0.0.0:3000").await.unwrap();
    println!("Server running on http://0.0.0.0:3000");
    
    axum::serve(listener, app).await.unwrap();
}

// Basic handler that responds with a static string
async fn root() -> &'static str {
    "Hello, Lobsters-like Rust Application!"
}

// Health check endpoint
async fn health_check() -> &'static str {
    "OK"
}
