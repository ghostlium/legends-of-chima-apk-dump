.class public final enum Lcom/playhaven/android/data/DataCollectionField$FieldNames;
.super Ljava/lang/Enum;
.source "DataCollectionField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/data/DataCollectionField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FieldNames"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/data/DataCollectionField$FieldNames;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/data/DataCollectionField$FieldNames;

.field public static final enum cssClass:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

.field public static final enum name:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

.field public static final enum type:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

.field public static final enum value:Lcom/playhaven/android/data/DataCollectionField$FieldNames;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 42
    new-instance v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    const-string v1, "type"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;-><init>(Ljava/lang/String;I)V

    .line 43
    sput-object v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->type:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    .line 44
    new-instance v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    const-string v1, "name"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;-><init>(Ljava/lang/String;I)V

    .line 45
    sput-object v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->name:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    .line 46
    new-instance v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    const-string v1, "cssClass"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;-><init>(Ljava/lang/String;I)V

    .line 47
    sput-object v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->cssClass:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    .line 48
    new-instance v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    const-string v1, "value"

    invoke-direct {v0, v1, v5}, Lcom/playhaven/android/data/DataCollectionField$FieldNames;-><init>(Ljava/lang/String;I)V

    .line 49
    sput-object v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->value:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    .line 41
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    sget-object v1, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->type:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    aput-object v1, v0, v2

    sget-object v1, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->name:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->cssClass:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->value:Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    aput-object v1, v0, v5

    sput-object v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->ENUM$VALUES:[Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/data/DataCollectionField$FieldNames;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/data/DataCollectionField$FieldNames;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/data/DataCollectionField$FieldNames;->ENUM$VALUES:[Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/data/DataCollectionField$FieldNames;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
