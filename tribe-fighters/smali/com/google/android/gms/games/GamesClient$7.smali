.class Lcom/google/android/gms/games/GamesClient$7;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/a$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/games/GamesClient;->loadAchievements(Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/a$c",
        "<",
        "Lcom/google/android/gms/games/achievement/b$a;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic qo:Lcom/google/android/gms/games/GamesClient;

.field final synthetic qr:Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;


# direct methods
.method constructor <init>(Lcom/google/android/gms/games/GamesClient;Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/games/GamesClient$7;->qo:Lcom/google/android/gms/games/GamesClient;

    iput-object p2, p0, Lcom/google/android/gms/games/GamesClient$7;->qr:Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/gms/games/achievement/b$a;)V
    .locals 3

    invoke-interface {p1}, Lcom/google/android/gms/games/achievement/b$a;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->getStatusCode()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/games/GamesClient$7;->qr:Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;

    invoke-interface {p1}, Lcom/google/android/gms/games/achievement/b$a;->cK()Lcom/google/android/gms/games/achievement/AchievementBuffer;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/google/android/gms/games/achievement/OnAchievementsLoadedListener;->onAchievementsLoaded(ILcom/google/android/gms/games/achievement/AchievementBuffer;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/games/achievement/b$a;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/games/GamesClient$7;->a(Lcom/google/android/gms/games/achievement/b$a;)V

    return-void
.end method