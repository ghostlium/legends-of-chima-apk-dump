.class final Lcom/google/android/gms/internal/de$a;
.super Landroid/graphics/drawable/Drawable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/de;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/de$a$a;
    }
.end annotation


# static fields
.field private static final mm:Lcom/google/android/gms/internal/de$a;

.field private static final mn:Lcom/google/android/gms/internal/de$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/de$a;

    invoke-direct {v0}, Lcom/google/android/gms/internal/de$a;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/de$a;->mm:Lcom/google/android/gms/internal/de$a;

    new-instance v0, Lcom/google/android/gms/internal/de$a$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/de$a$a;-><init>(Lcom/google/android/gms/internal/de$1;)V

    sput-object v0, Lcom/google/android/gms/internal/de$a;->mn:Lcom/google/android/gms/internal/de$a$a;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    return-void
.end method

.method static synthetic br()Lcom/google/android/gms/internal/de$a;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/de$a;->mm:Lcom/google/android/gms/internal/de$a;

    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    return-void
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/de$a;->mn:Lcom/google/android/gms/internal/de$a$a;

    return-object v0
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x2

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I

    .prologue
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    return-void
.end method
