.class public interface abstract Lcom/amazon/insights/UserProfile;
.super Ljava/lang/Object;
.source "UserProfile.java"


# virtual methods
.method public abstract addDimensionAsNumber(Ljava/lang/String;Ljava/lang/Number;)Lcom/amazon/insights/UserProfile;
.end method

.method public abstract addDimensionAsString(Ljava/lang/String;Ljava/lang/String;)Lcom/amazon/insights/UserProfile;
.end method

.method public abstract getDimensions()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end method
