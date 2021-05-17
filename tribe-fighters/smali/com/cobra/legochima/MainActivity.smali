.class public Lcom/cobra/legochima/MainActivity;
.super Lcom/cobra/zufflin/ZufflinActivity;
.source "MainActivity.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const-string v0, "legochima"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/cobra/zufflin/ZufflinActivity;-><init>()V

    .line 17
    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh3JUAfzs42FhryGco/FSH0xidHX15GgcnDP3i/TzbGVqJz3gU+BwtcifEByKaL0vKc/6QWJ5WDGjy6QSNumzqPNsgD4N/drsMkVmDBDa5goXVdlYpLlOe/ORoJzkUwad8clJOiW0OnTxSp79WcnYWJWpIX3odGkt/+LT3QipyvjcReFeOhQYzDJCvapp8FNIMkhSjRiZcEo41xqPQ8laiSnZs4w4o1fPzdtgOTIPyb7WFzCbpVH2jCkW3A6Sj5Wf8XhEtugdja4YnJq1tE/ruAtL+vdzBkMyUzPmH7hoPKlyr3UKR66oRF7C5pF+L3B6My8e08SVSeFaiiWlgCpBkQIDAQAB"

    invoke-virtual {p0, v0}, Lcom/cobra/legochima/MainActivity;->setPublisherPublicKey(Ljava/lang/String;)V

    .line 31
    const-wide/32 v0, 0x3a7570a

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cobra/legochima/MainActivity;->addOBBFile(JJ)V

    .line 32
    return-void
.end method
