.class public abstract Lcom/flurry/sdk/jr;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/jr$a;,
        Lcom/flurry/sdk/jr$b;
    }
.end annotation


# static fields
.field public static final a:Lcom/flurry/sdk/jr;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 168
    new-instance v0, Lcom/flurry/sdk/jr$a;

    invoke-direct {v0}, Lcom/flurry/sdk/jr$a;-><init>()V

    sput-object v0, Lcom/flurry/sdk/jr;->a:Lcom/flurry/sdk/jr;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 222
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mp;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mp;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 54
    return-object p3
.end method

.method public a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mr;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mr;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 75
    return-object p3
.end method

.method public a(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mt;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mt;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 114
    return-object p3
.end method

.method public b(Lcom/flurry/sdk/jo;Lcom/flurry/sdk/mr;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/jo",
            "<*>;",
            "Lcom/flurry/sdk/mr;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 95
    return-object p3
.end method
