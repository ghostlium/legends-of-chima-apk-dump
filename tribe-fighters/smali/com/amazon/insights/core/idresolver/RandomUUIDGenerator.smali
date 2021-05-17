.class public Lcom/amazon/insights/core/idresolver/RandomUUIDGenerator;
.super Ljava/lang/Object;
.source "RandomUUIDGenerator.java"

# interfaces
.implements Lcom/amazon/insights/core/idresolver/UniqueIdGenerator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public generateUniqueIdString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
