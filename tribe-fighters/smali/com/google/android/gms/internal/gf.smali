.class public Lcom/google/android/gms/internal/gf;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/gf$a;
    }
.end annotation


# static fields
.field private static xe:I

.field private static xf:I


# instance fields
.field private final xg:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lcom/google/android/gms/internal/gf$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x2710

    sput v0, Lcom/google/android/gms/internal/gf;->xe:I

    const/16 v0, 0x3e8

    sput v0, Lcom/google/android/gms/internal/gf;->xf:I

    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/gf;->xg:Ljava/util/concurrent/BlockingQueue;

    new-instance v1, Lcom/google/android/gms/internal/gf$a;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/internal/gf$a;-><init>(Lcom/google/android/gms/internal/gf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    return-void
.end method
