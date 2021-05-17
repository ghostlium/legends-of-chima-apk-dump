.class public final enum Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;
.super Ljava/lang/Enum;
.source "VendorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/compat/VendorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DRAWABLE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

.field public static final enum playhaven_badge:Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 37
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    const-string v1, "playhaven_badge"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;->playhaven_badge:Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    .line 35
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;->playhaven_badge:Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    aput-object v1, v0, v2

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;->ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;->ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/compat/VendorCompat$DRAWABLE;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
