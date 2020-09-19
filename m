Return-Path: <SRS0=gQK0=C4=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686C5C43463
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Sep 2020 19:21:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32B0321707; Sat, 19 Sep 2020 19:21:20 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756382075E;
	Sat, 19 Sep 2020 19:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWGn4kYm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756382075E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wr1-f68.google.com with SMTP id x14so8813283wrl.12;
        Sat, 19 Sep 2020 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D3NVgdvdoxKstCbbLPPn2/yq0G3BYOTHshhyRGVSuaU=;
        b=jWGn4kYmQbOJm6GHQR4x8zAO2LRrsUwJS3frkYKO7fCtsF2JrAsylnRaN7JbokMFUu
         F5+BO+oTbUXLW53oeoJEpzLSm6liwKLJdsAvMKIZEjLK3EnpJuV4Hu64k5uu+owEaIIy
         Oae7eFJ2FbFKdXmrtBla/U703sSDbZUtyUY6C2UwY5c6LE8a57tEbwOjks+PLsYBq9IN
         omvWVwh8DKbtJi5i578uunu+6ynSbN7Or3qeDVN7uJLCoUGf7dOQ3tUdXKgz4yEL6epJ
         hhWDREasAxyN6i+2Ny4fO/KuM6eF9OCYsT2qPt7Z8zaoOO/PTtb7JuOpV81RNznEH8dg
         ww5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D3NVgdvdoxKstCbbLPPn2/yq0G3BYOTHshhyRGVSuaU=;
        b=FI+0mc7cWqKMba32lWUyC1inesS8KahhI31qPhF1ZRk2iRoUUGi8XKzZ65Uc/f3eQZ
         P8PA41OJsMv6V1aSEnzwc972cxfE7+0jeXGFF6m3Ps0crlwEiQdczLM7Cgtmrq3j59BJ
         Cw0Ktcle+UnsW3hR56X4E0C1/grBUz9J6smBEVI+fxbRm74e7fgy2mN/rMSIQYzx7f9A
         Sv2kQHyZbEnB97DEYyer8AyfmviNKC/abNyyEOBR+EPck0H00HeZwdBVi019j8qQV9xC
         PntpcQKTy2VnkuLIgEfPhmRERtIta2sv7VlC6bNv6dX9c4xnpnTi3n6ZRETWrFPm44p3
         YKOg==
X-Gm-Message-State: AOAM530yw4ckgi4mbsg4Umrqv8wPHbOZafPRh9VpMizbbn1j1iXJGgqB
	Uf81YTbkO1yJMesa5ZMCiJVOUUJHhbg=
X-Google-Smtp-Source: ABdhPJzdvvqL8bre7gDT81EUEqi18Hp0k4dPT1OvLw7x3u+MfM/Hj2lYI3D8nre46kbzXrYEZcORjw==
X-Received: by 2002:adf:d4c1:: with SMTP id w1mr44283809wrk.108.1600543277415;
        Sat, 19 Sep 2020 12:21:17 -0700 (PDT)
Received: from morpheus.home.roving-it.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id o16sm11251054wrp.52.2020.09.19.12.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 12:21:16 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Gourav Samaiya <gsamaiya@nvidia.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH] linux-firmware: nvidia: move firmware symlinks to WHENCE
Date: Sat, 19 Sep 2020 20:21:09 +0100
Message-Id: <20200919192109.805218-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a number of firmware symlinks in the nvidia firmware
directory, move the creation of these to the WHENCE file.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
CC: Gourav Samaiya <gsamaiya@nvidia.com>
CC: Ben Skeggs <bskeggs@redhat.com>
CC: Alexandre Courbot <acourbot@nvidia.com>
CC: Ajay Gupta <ajayg@nvidia.com>
---
 WHENCE                             | 230 ++++++++++++++---------------
 nvidia/gm204/acr/bl.bin            |   1 -
 nvidia/gm204/acr/ucode_load.bin    |   1 -
 nvidia/gm204/acr/ucode_unload.bin  |   1 -
 nvidia/gm204/gr/fecs_bl.bin        |   1 -
 nvidia/gm204/gr/fecs_inst.bin      |   1 -
 nvidia/gm204/gr/gpccs_bl.bin       |   1 -
 nvidia/gm204/gr/gpccs_inst.bin     |   1 -
 nvidia/gm204/gr/sw_bundle_init.bin |   1 -
 nvidia/gm204/gr/sw_ctx.bin         |   1 -
 nvidia/gm204/gr/sw_method_init.bin |   1 -
 nvidia/gm204/gr/sw_nonctx.bin      |   1 -
 nvidia/gm206/acr/bl.bin            |   1 -
 nvidia/gm206/gr/fecs_bl.bin        |   1 -
 nvidia/gm206/gr/fecs_inst.bin      |   1 -
 nvidia/gm206/gr/gpccs_bl.bin       |   1 -
 nvidia/gm206/gr/gpccs_inst.bin     |   1 -
 nvidia/gm206/gr/sw_bundle_init.bin |   1 -
 nvidia/gm206/gr/sw_ctx.bin         |   1 -
 nvidia/gm206/gr/sw_method_init.bin |   1 -
 nvidia/gm206/gr/sw_nonctx.bin      |   1 -
 nvidia/gm20b/gr/sw_method_init.bin |   1 -
 nvidia/gp100/gr/fecs_bl.bin        |   1 -
 nvidia/gp100/gr/gpccs_bl.bin       |   1 -
 nvidia/gp102/gr/fecs_bl.bin        |   1 -
 nvidia/gp102/gr/gpccs_bl.bin       |   1 -
 nvidia/gp104/acr/bl.bin            |   1 -
 nvidia/gp104/acr/ucode_load.bin    |   1 -
 nvidia/gp104/acr/ucode_unload.bin  |   1 -
 nvidia/gp104/acr/unload_bl.bin     |   1 -
 nvidia/gp104/gr/fecs_bl.bin        |   1 -
 nvidia/gp104/gr/gpccs_bl.bin       |   1 -
 nvidia/gp104/gr/sw_bundle_init.bin |   1 -
 nvidia/gp104/gr/sw_ctx.bin         |   1 -
 nvidia/gp104/gr/sw_method_init.bin |   1 -
 nvidia/gp104/gr/sw_nonctx.bin      |   1 -
 nvidia/gp104/nvdec/scrubber.bin    |   1 -
 nvidia/gp104/sec2/desc-1.bin       |   1 -
 nvidia/gp104/sec2/desc.bin         |   1 -
 nvidia/gp104/sec2/image-1.bin      |   1 -
 nvidia/gp104/sec2/image.bin        |   1 -
 nvidia/gp104/sec2/sig-1.bin        |   1 -
 nvidia/gp104/sec2/sig.bin          |   1 -
 nvidia/gp106/acr/bl.bin            |   1 -
 nvidia/gp106/acr/ucode_load.bin    |   1 -
 nvidia/gp106/acr/ucode_unload.bin  |   1 -
 nvidia/gp106/acr/unload_bl.bin     |   1 -
 nvidia/gp106/gr/fecs_bl.bin        |   1 -
 nvidia/gp106/gr/fecs_inst.bin      |   1 -
 nvidia/gp106/gr/gpccs_bl.bin       |   1 -
 nvidia/gp106/gr/gpccs_inst.bin     |   1 -
 nvidia/gp106/gr/sw_bundle_init.bin |   1 -
 nvidia/gp106/gr/sw_ctx.bin         |   1 -
 nvidia/gp106/gr/sw_method_init.bin |   1 -
 nvidia/gp106/gr/sw_nonctx.bin      |   1 -
 nvidia/gp106/nvdec/scrubber.bin    |   1 -
 nvidia/gp106/sec2/desc-1.bin       |   1 -
 nvidia/gp106/sec2/desc.bin         |   1 -
 nvidia/gp106/sec2/image-1.bin      |   1 -
 nvidia/gp106/sec2/image.bin        |   1 -
 nvidia/gp106/sec2/sig-1.bin        |   1 -
 nvidia/gp106/sec2/sig.bin          |   1 -
 nvidia/gp107/acr/bl.bin            |   1 -
 nvidia/gp107/acr/ucode_load.bin    |   1 -
 nvidia/gp107/acr/ucode_unload.bin  |   1 -
 nvidia/gp107/acr/unload_bl.bin     |   1 -
 nvidia/gp107/gr/sw_bundle_init.bin |   1 -
 nvidia/gp107/gr/sw_method_init.bin |   1 -
 nvidia/gp107/nvdec/scrubber.bin    |   1 -
 nvidia/gp107/sec2/desc-1.bin       |   1 -
 nvidia/gp107/sec2/desc.bin         |   1 -
 nvidia/gp107/sec2/image-1.bin      |   1 -
 nvidia/gp107/sec2/image.bin        |   1 -
 nvidia/gp107/sec2/sig-1.bin        |   1 -
 nvidia/gp107/sec2/sig.bin          |   1 -
 nvidia/gp108/acr/bl.bin            |   1 -
 nvidia/gp108/acr/ucode_load.bin    |   1 -
 nvidia/gp108/acr/ucode_unload.bin  |   1 -
 nvidia/gp108/acr/unload_bl.bin     |   1 -
 nvidia/gp108/nvdec/scrubber.bin    |   1 -
 nvidia/gp108/sec2/desc.bin         |   1 -
 nvidia/gp108/sec2/image.bin        |   1 -
 nvidia/gp108/sec2/sig.bin          |   1 -
 nvidia/tu104/acr/bl.bin            |   1 -
 nvidia/tu104/acr/ucode_ahesasc.bin |   1 -
 nvidia/tu104/acr/ucode_asb.bin     |   1 -
 nvidia/tu104/acr/ucode_unload.bin  |   1 -
 nvidia/tu104/acr/unload_bl.bin     |   1 -
 nvidia/tu104/gr/fecs_bl.bin        |   1 -
 nvidia/tu104/gr/gpccs_bl.bin       |   1 -
 nvidia/tu104/nvdec/scrubber.bin    |   1 -
 nvidia/tu104/sec2/desc.bin         |   1 -
 nvidia/tu104/sec2/image.bin        |   1 -
 nvidia/tu104/sec2/sig.bin          |   1 -
 nvidia/tu106/acr/bl.bin            |   1 -
 nvidia/tu106/acr/ucode_ahesasc.bin |   1 -
 nvidia/tu106/acr/ucode_asb.bin     |   1 -
 nvidia/tu106/acr/ucode_unload.bin  |   1 -
 nvidia/tu106/acr/unload_bl.bin     |   1 -
 nvidia/tu106/gr/fecs_bl.bin        |   1 -
 nvidia/tu106/gr/gpccs_bl.bin       |   1 -
 nvidia/tu106/nvdec/scrubber.bin    |   1 -
 nvidia/tu106/sec2/desc.bin         |   1 -
 nvidia/tu106/sec2/image.bin        |   1 -
 nvidia/tu106/sec2/sig.bin          |   1 -
 nvidia/tu117/acr/bl.bin            |   1 -
 nvidia/tu117/acr/ucode_ahesasc.bin |   1 -
 nvidia/tu117/acr/ucode_asb.bin     |   1 -
 nvidia/tu117/acr/ucode_unload.bin  |   1 -
 nvidia/tu117/acr/unload_bl.bin     |   1 -
 nvidia/tu117/gr/fecs_bl.bin        |   1 -
 nvidia/tu117/gr/gpccs_bl.bin       |   1 -
 nvidia/tu117/nvdec/scrubber.bin    |   1 -
 nvidia/tu117/sec2/desc.bin         |   1 -
 nvidia/tu117/sec2/image.bin        |   1 -
 nvidia/tu117/sec2/sig.bin          |   1 -
 116 files changed, 115 insertions(+), 230 deletions(-)
 delete mode 120000 nvidia/gm204/acr/bl.bin
 delete mode 120000 nvidia/gm204/acr/ucode_load.bin
 delete mode 120000 nvidia/gm204/acr/ucode_unload.bin
 delete mode 120000 nvidia/gm204/gr/fecs_bl.bin
 delete mode 120000 nvidia/gm204/gr/fecs_inst.bin
 delete mode 120000 nvidia/gm204/gr/gpccs_bl.bin
 delete mode 120000 nvidia/gm204/gr/gpccs_inst.bin
 delete mode 120000 nvidia/gm204/gr/sw_bundle_init.bin
 delete mode 120000 nvidia/gm204/gr/sw_ctx.bin
 delete mode 120000 nvidia/gm204/gr/sw_method_init.bin
 delete mode 120000 nvidia/gm204/gr/sw_nonctx.bin
 delete mode 120000 nvidia/gm206/acr/bl.bin
 delete mode 120000 nvidia/gm206/gr/fecs_bl.bin
 delete mode 120000 nvidia/gm206/gr/fecs_inst.bin
 delete mode 120000 nvidia/gm206/gr/gpccs_bl.bin
 delete mode 120000 nvidia/gm206/gr/gpccs_inst.bin
 delete mode 120000 nvidia/gm206/gr/sw_bundle_init.bin
 delete mode 120000 nvidia/gm206/gr/sw_ctx.bin
 delete mode 120000 nvidia/gm206/gr/sw_method_init.bin
 delete mode 120000 nvidia/gm206/gr/sw_nonctx.bin
 delete mode 120000 nvidia/gm20b/gr/sw_method_init.bin
 delete mode 120000 nvidia/gp100/gr/fecs_bl.bin
 delete mode 120000 nvidia/gp100/gr/gpccs_bl.bin
 delete mode 120000 nvidia/gp102/gr/fecs_bl.bin
 delete mode 120000 nvidia/gp102/gr/gpccs_bl.bin
 delete mode 120000 nvidia/gp104/acr/bl.bin
 delete mode 120000 nvidia/gp104/acr/ucode_load.bin
 delete mode 120000 nvidia/gp104/acr/ucode_unload.bin
 delete mode 120000 nvidia/gp104/acr/unload_bl.bin
 delete mode 120000 nvidia/gp104/gr/fecs_bl.bin
 delete mode 120000 nvidia/gp104/gr/gpccs_bl.bin
 delete mode 120000 nvidia/gp104/gr/sw_bundle_init.bin
 delete mode 120000 nvidia/gp104/gr/sw_ctx.bin
 delete mode 120000 nvidia/gp104/gr/sw_method_init.bin
 delete mode 120000 nvidia/gp104/gr/sw_nonctx.bin
 delete mode 120000 nvidia/gp104/nvdec/scrubber.bin
 delete mode 120000 nvidia/gp104/sec2/desc-1.bin
 delete mode 120000 nvidia/gp104/sec2/desc.bin
 delete mode 120000 nvidia/gp104/sec2/image-1.bin
 delete mode 120000 nvidia/gp104/sec2/image.bin
 delete mode 120000 nvidia/gp104/sec2/sig-1.bin
 delete mode 120000 nvidia/gp104/sec2/sig.bin
 delete mode 120000 nvidia/gp106/acr/bl.bin
 delete mode 120000 nvidia/gp106/acr/ucode_load.bin
 delete mode 120000 nvidia/gp106/acr/ucode_unload.bin
 delete mode 120000 nvidia/gp106/acr/unload_bl.bin
 delete mode 120000 nvidia/gp106/gr/fecs_bl.bin
 delete mode 120000 nvidia/gp106/gr/fecs_inst.bin
 delete mode 120000 nvidia/gp106/gr/gpccs_bl.bin
 delete mode 120000 nvidia/gp106/gr/gpccs_inst.bin
 delete mode 120000 nvidia/gp106/gr/sw_bundle_init.bin
 delete mode 120000 nvidia/gp106/gr/sw_ctx.bin
 delete mode 120000 nvidia/gp106/gr/sw_method_init.bin
 delete mode 120000 nvidia/gp106/gr/sw_nonctx.bin
 delete mode 120000 nvidia/gp106/nvdec/scrubber.bin
 delete mode 120000 nvidia/gp106/sec2/desc-1.bin
 delete mode 120000 nvidia/gp106/sec2/desc.bin
 delete mode 120000 nvidia/gp106/sec2/image-1.bin
 delete mode 120000 nvidia/gp106/sec2/image.bin
 delete mode 120000 nvidia/gp106/sec2/sig-1.bin
 delete mode 120000 nvidia/gp106/sec2/sig.bin
 delete mode 120000 nvidia/gp107/acr/bl.bin
 delete mode 120000 nvidia/gp107/acr/ucode_load.bin
 delete mode 120000 nvidia/gp107/acr/ucode_unload.bin
 delete mode 120000 nvidia/gp107/acr/unload_bl.bin
 delete mode 120000 nvidia/gp107/gr/sw_bundle_init.bin
 delete mode 120000 nvidia/gp107/gr/sw_method_init.bin
 delete mode 120000 nvidia/gp107/nvdec/scrubber.bin
 delete mode 120000 nvidia/gp107/sec2/desc-1.bin
 delete mode 120000 nvidia/gp107/sec2/desc.bin
 delete mode 120000 nvidia/gp107/sec2/image-1.bin
 delete mode 120000 nvidia/gp107/sec2/image.bin
 delete mode 120000 nvidia/gp107/sec2/sig-1.bin
 delete mode 120000 nvidia/gp107/sec2/sig.bin
 delete mode 120000 nvidia/gp108/acr/bl.bin
 delete mode 120000 nvidia/gp108/acr/ucode_load.bin
 delete mode 120000 nvidia/gp108/acr/ucode_unload.bin
 delete mode 120000 nvidia/gp108/acr/unload_bl.bin
 delete mode 120000 nvidia/gp108/nvdec/scrubber.bin
 delete mode 120000 nvidia/gp108/sec2/desc.bin
 delete mode 120000 nvidia/gp108/sec2/image.bin
 delete mode 120000 nvidia/gp108/sec2/sig.bin
 delete mode 120000 nvidia/tu104/acr/bl.bin
 delete mode 120000 nvidia/tu104/acr/ucode_ahesasc.bin
 delete mode 120000 nvidia/tu104/acr/ucode_asb.bin
 delete mode 120000 nvidia/tu104/acr/ucode_unload.bin
 delete mode 120000 nvidia/tu104/acr/unload_bl.bin
 delete mode 120000 nvidia/tu104/gr/fecs_bl.bin
 delete mode 120000 nvidia/tu104/gr/gpccs_bl.bin
 delete mode 120000 nvidia/tu104/nvdec/scrubber.bin
 delete mode 120000 nvidia/tu104/sec2/desc.bin
 delete mode 120000 nvidia/tu104/sec2/image.bin
 delete mode 120000 nvidia/tu104/sec2/sig.bin
 delete mode 120000 nvidia/tu106/acr/bl.bin
 delete mode 120000 nvidia/tu106/acr/ucode_ahesasc.bin
 delete mode 120000 nvidia/tu106/acr/ucode_asb.bin
 delete mode 120000 nvidia/tu106/acr/ucode_unload.bin
 delete mode 120000 nvidia/tu106/acr/unload_bl.bin
 delete mode 120000 nvidia/tu106/gr/fecs_bl.bin
 delete mode 120000 nvidia/tu106/gr/gpccs_bl.bin
 delete mode 120000 nvidia/tu106/nvdec/scrubber.bin
 delete mode 120000 nvidia/tu106/sec2/desc.bin
 delete mode 120000 nvidia/tu106/sec2/image.bin
 delete mode 120000 nvidia/tu106/sec2/sig.bin
 delete mode 120000 nvidia/tu117/acr/bl.bin
 delete mode 120000 nvidia/tu117/acr/ucode_ahesasc.bin
 delete mode 120000 nvidia/tu117/acr/ucode_asb.bin
 delete mode 120000 nvidia/tu117/acr/ucode_unload.bin
 delete mode 120000 nvidia/tu117/acr/unload_bl.bin
 delete mode 120000 nvidia/tu117/gr/fecs_bl.bin
 delete mode 120000 nvidia/tu117/gr/gpccs_bl.bin
 delete mode 120000 nvidia/tu117/nvdec/scrubber.bin
 delete mode 120000 nvidia/tu117/sec2/desc.bin
 delete mode 120000 nvidia/tu117/sec2/image.bin
 delete mode 120000 nvidia/tu117/sec2/sig.bin

diff --git a/WHENCE b/WHENCE
index 4faf0d0..6ceac11 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4195,36 +4195,36 @@ File: nvidia/gm200/gr/sw_bundle_init.bin
 File: nvidia/gm200/gr/sw_ctx.bin
 File: nvidia/gm200/gr/sw_method_init.bin
 File: nvidia/gm200/gr/sw_nonctx.bin
-File: nvidia/gm204/acr/bl.bin
-File: nvidia/gm204/acr/ucode_load.bin
-File: nvidia/gm204/acr/ucode_unload.bin
-File: nvidia/gm204/gr/fecs_bl.bin
+Link: nvidia/gm204/acr/bl.bin -> ../../gm200/acr/bl.bin
+Link: nvidia/gm204/acr/ucode_load.bin -> ../../gm200/acr/ucode_load.bin
+Link: nvidia/gm204/acr/ucode_unload.bin -> ../../gm200/acr/ucode_unload.bin
+Link: nvidia/gm204/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
 File: nvidia/gm204/gr/fecs_data.bin
-File: nvidia/gm204/gr/fecs_inst.bin
+Link: nvidia/gm204/gr/fecs_inst.bin -> ../../gm200/gr/fecs_inst.bin
 File: nvidia/gm204/gr/fecs_sig.bin
-File: nvidia/gm204/gr/gpccs_bl.bin
+Link: nvidia/gm204/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
 File: nvidia/gm204/gr/gpccs_data.bin
-File: nvidia/gm204/gr/gpccs_inst.bin
+Link: nvidia/gm204/gr/gpccs_inst.bin -> ../../gm200/gr/gpccs_inst.bin
 File: nvidia/gm204/gr/gpccs_sig.bin
-File: nvidia/gm204/gr/sw_bundle_init.bin
-File: nvidia/gm204/gr/sw_ctx.bin
-File: nvidia/gm204/gr/sw_method_init.bin
-File: nvidia/gm204/gr/sw_nonctx.bin
-File: nvidia/gm206/acr/bl.bin
+Link: nvidia/gm204/gr/sw_bundle_init.bin -> ../../gm200/gr/sw_bundle_init.bin
+Link: nvidia/gm204/gr/sw_ctx.bin -> ../../gm200/gr/sw_ctx.bin
+Link: nvidia/gm204/gr/sw_method_init.bin -> ../../gm200/gr/sw_method_init.bin
+Link: nvidia/gm204/gr/sw_nonctx.bin -> ../../gm200/gr/sw_nonctx.bin
+Link: nvidia/gm206/acr/bl.bin  -> ../../gm200/acr/bl.bin
 File: nvidia/gm206/acr/ucode_load.bin
 File: nvidia/gm206/acr/ucode_unload.bin
-File: nvidia/gm206/gr/fecs_bl.bin
+Link: nvidia/gm206/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
 File: nvidia/gm206/gr/fecs_data.bin
-File: nvidia/gm206/gr/fecs_inst.bin
+Link: nvidia/gm206/gr/fecs_inst.bin -> ../../gm200/gr/fecs_inst.bin
 File: nvidia/gm206/gr/fecs_sig.bin
-File: nvidia/gm206/gr/gpccs_bl.bin
+Link: nvidia/gm206/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
 File: nvidia/gm206/gr/gpccs_data.bin
-File: nvidia/gm206/gr/gpccs_inst.bin
+Link: nvidia/gm206/gr/gpccs_inst.bin -> ../../gm200/gr/gpccs_inst.bin
 File: nvidia/gm206/gr/gpccs_sig.bin
-File: nvidia/gm206/gr/sw_bundle_init.bin
-File: nvidia/gm206/gr/sw_ctx.bin
-File: nvidia/gm206/gr/sw_method_init.bin
-File: nvidia/gm206/gr/sw_nonctx.bin
+Link: nvidia/gm206/gr/sw_bundle_init.bin -> ../../gm200/gr/sw_bundle_init.bin
+File: nvidia/gm206/gr/sw_ctx.bin -> ../../gm200/gr/sw_ctx.bin
+Link: nvidia/gm206/gr/sw_method_init.bin -> ../../gm200/gr/sw_method_init.bin
+Link: nvidia/gm206/gr/sw_nonctx.bin -> ../../gm200/gr/sw_nonctx.bin
 File: nvidia/gm20b/acr/bl.bin
 File: nvidia/gm20b/acr/ucode_load.bin
 File: nvidia/gm20b/gr/fecs_bl.bin
@@ -4235,7 +4235,7 @@ File: nvidia/gm20b/gr/gpccs_data.bin
 File: nvidia/gm20b/gr/gpccs_inst.bin
 File: nvidia/gm20b/gr/sw_bundle_init.bin
 File: nvidia/gm20b/gr/sw_ctx.bin
-File: nvidia/gm20b/gr/sw_method_init.bin
+Link: nvidia/gm20b/gr/sw_method_init.bin -> ../../gm200/gr/sw_method_init.bin
 File: nvidia/gm20b/gr/sw_nonctx.bin
 File: nvidia/gm20b/pmu/desc.bin
 File: nvidia/gm20b/pmu/image.bin
@@ -4243,11 +4243,11 @@ File: nvidia/gm20b/pmu/sig.bin
 File: nvidia/gp100/acr/bl.bin
 File: nvidia/gp100/acr/ucode_load.bin
 File: nvidia/gp100/acr/ucode_unload.bin
-File: nvidia/gp100/gr/fecs_bl.bin
+Link: nvidia/gp100/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
 File: nvidia/gp100/gr/fecs_data.bin
 File: nvidia/gp100/gr/fecs_inst.bin
 File: nvidia/gp100/gr/fecs_sig.bin
-File: nvidia/gp100/gr/gpccs_bl.bin
+Link: nvidia/gp100/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
 File: nvidia/gp100/gr/gpccs_data.bin
 File: nvidia/gp100/gr/gpccs_inst.bin
 File: nvidia/gp100/gr/gpccs_sig.bin
@@ -4259,11 +4259,11 @@ File: nvidia/gp102/acr/bl.bin
 File: nvidia/gp102/acr/ucode_load.bin
 File: nvidia/gp102/acr/ucode_unload.bin
 File: nvidia/gp102/acr/unload_bl.bin
-File: nvidia/gp102/gr/fecs_bl.bin
+Link: nvidia/gp102/gr/fecs_bl.bin -> ../../gm200/gr/fecs_bl.bin
 File: nvidia/gp102/gr/fecs_data.bin
 File: nvidia/gp102/gr/fecs_inst.bin
 File: nvidia/gp102/gr/fecs_sig.bin
-File: nvidia/gp102/gr/gpccs_bl.bin
+Link: nvidia/gp102/gr/gpccs_bl.bin -> ../../gm200/gr/gpccs_bl.bin
 File: nvidia/gp102/gr/gpccs_data.bin
 File: nvidia/gp102/gr/gpccs_inst.bin
 File: nvidia/gp102/gr/gpccs_sig.bin
@@ -4278,56 +4278,56 @@ File: nvidia/gp102/sec2/sig.bin
 File: nvidia/gp102/sec2/desc-1.bin
 File: nvidia/gp102/sec2/image-1.bin
 File: nvidia/gp102/sec2/sig-1.bin
-File: nvidia/gp104/acr/bl.bin
-File: nvidia/gp104/acr/ucode_load.bin
-File: nvidia/gp104/acr/ucode_unload.bin
-File: nvidia/gp104/acr/unload_bl.bin
-File: nvidia/gp104/gr/fecs_bl.bin
+Link: nvidia/gp104/acr/bl.bin -> ../../gp102/acr/bl.bin
+Link: nvidia/gp104/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
+Link: nvidia/gp104/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
+Link: nvidia/gp104/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
+Link: nvidia/gp104/gr/fecs_bl.bin -> ../../gp102/gr/fecs_bl.bin
 File: nvidia/gp104/gr/fecs_data.bin
 File: nvidia/gp104/gr/fecs_inst.bin
 File: nvidia/gp104/gr/fecs_sig.bin
-File: nvidia/gp104/gr/gpccs_bl.bin
+Link: nvidia/gp104/gr/gpccs_bl.bin -> ../../gp102/gr/gpccs_bl.bin
 File: nvidia/gp104/gr/gpccs_data.bin
 File: nvidia/gp104/gr/gpccs_inst.bin
 File: nvidia/gp104/gr/gpccs_sig.bin
-File: nvidia/gp104/gr/sw_bundle_init.bin
-File: nvidia/gp104/gr/sw_ctx.bin
-File: nvidia/gp104/gr/sw_method_init.bin
-File: nvidia/gp104/gr/sw_nonctx.bin
-File: nvidia/gp104/nvdec/scrubber.bin
-File: nvidia/gp104/sec2/desc.bin
-File: nvidia/gp104/sec2/image.bin
-File: nvidia/gp104/sec2/sig.bin
-File: nvidia/gp104/sec2/desc-1.bin
-File: nvidia/gp104/sec2/image-1.bin
-File: nvidia/gp104/sec2/sig-1.bin
-File: nvidia/gp106/acr/bl.bin
-File: nvidia/gp106/acr/ucode_load.bin
-File: nvidia/gp106/acr/ucode_unload.bin
-File: nvidia/gp106/acr/unload_bl.bin
-File: nvidia/gp106/gr/fecs_bl.bin
+Link: nvidia/gp104/gr/sw_bundle_init.bin -> ../../gp102/gr/sw_bundle_init.bin
+Link: nvidia/gp104/gr/sw_ctx.bin -> ../../gp102/gr/sw_ctx.bin
+Link: nvidia/gp104/gr/sw_method_init.bin -> ../../gp102/gr/sw_method_init.bin
+Link: nvidia/gp104/gr/sw_nonctx.bin -> ../../gp102/gr/sw_nonctx.bin
+Link: nvidia/gp104/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
+Link: nvidia/gp104/sec2/desc.bin -> ../../gp102/sec2/desc.bin
+Link: nvidia/gp104/sec2/image.bin -> ../../gp102/sec2/image.bin
+Link: nvidia/gp104/sec2/sig.bin -> ../../gp102/sec2/sig.bin
+Link: nvidia/gp104/sec2/desc-1.bin -> ../../gp102/sec2/desc-1.bin
+Link: nvidia/gp104/sec2/image-1.bin -> ../../gp102/sec2/image-1.bin
+Link: nvidia/gp104/sec2/sig-1.bin -> ../../gp102/sec2/sig-1.bin
+Link: nvidia/gp106/acr/bl.bin -> ../../gp102/acr/bl.bin
+Link: nvidia/gp106/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
+Link: nvidia/gp106/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
+Link: nvidia/gp106/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
+Link: nvidia/gp106/gr/fecs_bl.bin -> ../../gp102/gr/fecs_bl.bin
 File: nvidia/gp106/gr/fecs_data.bin
-File: nvidia/gp106/gr/fecs_inst.bin
+Link: nvidia/gp106/gr/fecs_inst.bin -> ../../gp102/gr/fecs_inst.bin
 File: nvidia/gp106/gr/fecs_sig.bin
-File: nvidia/gp106/gr/gpccs_bl.bin
+Link: nvidia/gp106/gr/gpccs_bl.bin -> ../../gp102/gr/gpccs_bl.bin
 File: nvidia/gp106/gr/gpccs_data.bin
-File: nvidia/gp106/gr/gpccs_inst.bin
+Link: nvidia/gp106/gr/gpccs_inst.bin -> ../../gp102/gr/gpccs_inst.bin
 File: nvidia/gp106/gr/gpccs_sig.bin
-File: nvidia/gp106/gr/sw_bundle_init.bin
-File: nvidia/gp106/gr/sw_ctx.bin
-File: nvidia/gp106/gr/sw_method_init.bin
-File: nvidia/gp106/gr/sw_nonctx.bin
-File: nvidia/gp106/nvdec/scrubber.bin
-File: nvidia/gp106/sec2/desc.bin
-File: nvidia/gp106/sec2/image.bin
-File: nvidia/gp106/sec2/sig.bin
-File: nvidia/gp106/sec2/desc-1.bin
-File: nvidia/gp106/sec2/image-1.bin
-File: nvidia/gp106/sec2/sig-1.bin
-File: nvidia/gp107/acr/bl.bin
-File: nvidia/gp107/acr/ucode_load.bin
-File: nvidia/gp107/acr/ucode_unload.bin
-File: nvidia/gp107/acr/unload_bl.bin
+Link: nvidia/gp106/gr/sw_bundle_init.bin -> ../../gp102/gr/sw_bundle_init.bin
+Link: nvidia/gp106/gr/sw_ctx.bin -> ../../gp102/gr/sw_ctx.bin
+Link: nvidia/gp106/gr/sw_method_init.bin -> ../../gp102/gr/sw_method_init.bin
+Link: nvidia/gp106/gr/sw_nonctx.bin -> ../../gp102/gr/sw_nonctx.bin
+Link: nvidia/gp106/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
+Link: nvidia/gp106/sec2/desc.bin -> ../../gp102/sec2/desc.bin
+Link: nvidia/gp106/sec2/image.bin -> ../../gp102/sec2/image.bin
+Link: nvidia/gp106/sec2/sig.bin -> ../../gp102/sec2/sig.bin
+Link: nvidia/gp106/sec2/desc-1.bin -> ../../gp102/sec2/desc-1.bin
+Link: nvidia/gp106/sec2/image-1.bin -> ../../gp102/sec2/image-1.bin
+Link: nvidia/gp106/sec2/sig-1.bin -> ../../gp102/sec2/sig-1.bin
+Link: nvidia/gp107/acr/bl.bin -> ../../gp102/acr/bl.bin
+Link: nvidia/gp107/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
+Link: nvidia/gp107/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
+Link: nvidia/gp107/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
 File: nvidia/gp107/gr/fecs_bl.bin
 File: nvidia/gp107/gr/fecs_data.bin
 File: nvidia/gp107/gr/fecs_inst.bin
@@ -4336,17 +4336,17 @@ File: nvidia/gp107/gr/gpccs_bl.bin
 File: nvidia/gp107/gr/gpccs_data.bin
 File: nvidia/gp107/gr/gpccs_inst.bin
 File: nvidia/gp107/gr/gpccs_sig.bin
-File: nvidia/gp107/gr/sw_bundle_init.bin
+Link: nvidia/gp107/gr/sw_bundle_init.bin -> ../../gp102/gr/sw_bundle_init.bin
 File: nvidia/gp107/gr/sw_ctx.bin
-File: nvidia/gp107/gr/sw_method_init.bin
+Link: nvidia/gp107/gr/sw_method_init.bin -> ../../gp102/gr/sw_method_init.bin
 File: nvidia/gp107/gr/sw_nonctx.bin
-File: nvidia/gp107/nvdec/scrubber.bin
-File: nvidia/gp107/sec2/desc.bin
-File: nvidia/gp107/sec2/image.bin
-File: nvidia/gp107/sec2/sig.bin
-File: nvidia/gp107/sec2/desc-1.bin
-File: nvidia/gp107/sec2/image-1.bin
-File: nvidia/gp107/sec2/sig-1.bin
+Link: nvidia/gp107/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
+Link: nvidia/gp107/sec2/desc.bin -> ../../gp102/sec2/desc.bin
+Link: nvidia/gp107/sec2/image.bin -> ../../gp102/sec2/image.bin
+Link: nvidia/gp107/sec2/sig.bin -> ../../gp102/sec2/sig.bin
+Link: nvidia/gp107/sec2/desc-1.bin -> ../../gp102/sec2/desc-1.bin
+Link: nvidia/gp107/sec2/image-1.bin -> ../../gp102/sec2/image-1.bin
+Link: nvidia/gp107/sec2/sig-1.bin -> ../../gp102/sec2/sig-1.bin
 File: nvidia/gp10b/acr/bl.bin
 File: nvidia/gp10b/acr/ucode_load.bin
 File: nvidia/gp10b/gr/fecs_bl.bin
@@ -4364,10 +4364,10 @@ File: nvidia/gp10b/gr/sw_nonctx.bin
 File: nvidia/gp10b/pmu/desc.bin
 File: nvidia/gp10b/pmu/image.bin
 File: nvidia/gp10b/pmu/sig.bin
-File: nvidia/gp108/acr/bl.bin
-File: nvidia/gp108/acr/ucode_load.bin
-File: nvidia/gp108/acr/ucode_unload.bin
-File: nvidia/gp108/acr/unload_bl.bin
+Link: nvidia/gp108/acr/bl.bin -> ../../gp102/acr/bl.bin
+Link: nvidia/gp108/acr/ucode_load.bin -> ../../gp102/acr/ucode_load.bin
+Link: nvidia/gp108/acr/ucode_unload.bin -> ../../gp102/acr/ucode_unload.bin
+Link: nvidia/gp108/acr/unload_bl.bin -> ../../gp102/acr/unload_bl.bin
 File: nvidia/gp108/gr/fecs_bl.bin
 File: nvidia/gp108/gr/fecs_data.bin
 File: nvidia/gp108/gr/fecs_inst.bin
@@ -4380,10 +4380,10 @@ File: nvidia/gp108/gr/sw_bundle_init.bin
 File: nvidia/gp108/gr/sw_ctx.bin
 File: nvidia/gp108/gr/sw_method_init.bin
 File: nvidia/gp108/gr/sw_nonctx.bin
-File: nvidia/gp108/nvdec/scrubber.bin
-File: nvidia/gp108/sec2/desc.bin
-File: nvidia/gp108/sec2/image.bin
-File: nvidia/gp108/sec2/sig.bin
+Link: nvidia/gp108/nvdec/scrubber.bin -> ../../gp102/nvdec/scrubber.bin
+Link: nvidia/gp108/sec2/desc.bin -> ../../gp102/sec2/desc-1.bin
+Link: nvidia/gp108/sec2/image.bin -> ../../gp102/sec2/image-1.bin
+Link: nvidia/gp108/sec2/sig.bin -> ../../gp102/sec2/sig-1.bin
 File: nvidia/gv100/acr/bl.bin
 File: nvidia/gv100/acr/ucode_load.bin
 File: nvidia/gv100/acr/ucode_unload.bin
@@ -4426,16 +4426,16 @@ File: nvidia/tu102/nvdec/scrubber.bin
 File: nvidia/tu102/sec2/desc.bin
 File: nvidia/tu102/sec2/image.bin
 File: nvidia/tu102/sec2/sig.bin
-File: nvidia/tu104/acr/bl.bin
-File: nvidia/tu104/acr/ucode_ahesasc.bin
-File: nvidia/tu104/acr/ucode_asb.bin
-File: nvidia/tu104/acr/unload_bl.bin
-File: nvidia/tu104/acr/ucode_unload.bin
-File: nvidia/tu104/gr/fecs_bl.bin
+Link: nvidia/tu104/acr/bl.bin -> ../../tu102/acr/bl.bin
+Link: nvidia/tu104/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
+Link: nvidia/tu104/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
+Link: nvidia/tu104/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
+Link: nvidia/tu104/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
+Link: nvidia/tu104/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
 File: nvidia/tu104/gr/fecs_data.bin
 File: nvidia/tu104/gr/fecs_inst.bin
 File: nvidia/tu104/gr/fecs_sig.bin
-File: nvidia/tu104/gr/gpccs_bl.bin
+Link: nvidia/tu104/gr/gpccs_bl.bin -> ../../tu102/gr/gpccs_bl.bin
 File: nvidia/tu104/gr/gpccs_data.bin
 File: nvidia/tu104/gr/gpccs_inst.bin
 File: nvidia/tu104/gr/gpccs_sig.bin
@@ -4444,20 +4444,20 @@ File: nvidia/tu104/gr/sw_ctx.bin
 File: nvidia/tu104/gr/sw_method_init.bin
 File: nvidia/tu104/gr/sw_nonctx.bin
 File: nvidia/tu104/gr/sw_veid_bundle_init.bin
-File: nvidia/tu104/nvdec/scrubber.bin
-File: nvidia/tu104/sec2/desc.bin
-File: nvidia/tu104/sec2/image.bin
-File: nvidia/tu104/sec2/sig.bin
-File: nvidia/tu106/acr/bl.bin
-File: nvidia/tu106/acr/ucode_ahesasc.bin
-File: nvidia/tu106/acr/ucode_asb.bin
-File: nvidia/tu106/acr/unload_bl.bin
-File: nvidia/tu106/acr/ucode_unload.bin
-File: nvidia/tu106/gr/fecs_bl.bin
+Link: nvidia/tu104/nvdec/scrubber.bin -> ../../tu102/nvdec/scrubber.bin
+Link: nvidia/tu104/sec2/desc.bin -> ../../tu102/sec2/desc.bin
+Link: nvidia/tu104/sec2/image.bin -> ../../tu102/sec2/image.bin
+Link: nvidia/tu104/sec2/sig.bin -> ../../tu102/sec2/sig.bin
+Link: nvidia/tu106/acr/bl.bin -> ../../tu102/acr/bl.bin
+Link: nvidia/tu106/acr/ucode_ahesasc.bin -> ../../tu102/acr/ucode_ahesasc.bin
+Link: nvidia/tu106/acr/ucode_asb.bin -> ../../tu102/acr/ucode_asb.bin
+Link: nvidia/tu106/acr/unload_bl.bin -> ../../tu102/acr/ucode_unload.bin
+Link: nvidia/tu106/acr/ucode_unload.bin -> ../../tu102/acr/unload_bl.bin
+Link: nvidia/tu106/gr/fecs_bl.bin -> ../../tu102/gr/fecs_bl.bin
 File: nvidia/tu106/gr/fecs_data.bin
 File: nvidia/tu106/gr/fecs_inst.bin
 File: nvidia/tu106/gr/fecs_sig.bin
-File: nvidia/tu106/gr/gpccs_bl.bin
+Link: nvidia/tu106/gr/gpccs_bl.bin -> ../../tu102/gr/gpccs_bl.bin
 File: nvidia/tu106/gr/gpccs_data.bin
 File: nvidia/tu106/gr/gpccs_inst.bin
 File: nvidia/tu106/gr/gpccs_sig.bin
@@ -4466,10 +4466,10 @@ File: nvidia/tu106/gr/sw_ctx.bin
 File: nvidia/tu106/gr/sw_method_init.bin
 File: nvidia/tu106/gr/sw_nonctx.bin
 File: nvidia/tu106/gr/sw_veid_bundle_init.bin
-File: nvidia/tu106/nvdec/scrubber.bin
-File: nvidia/tu106/sec2/desc.bin
-File: nvidia/tu106/sec2/image.bin
-File: nvidia/tu106/sec2/sig.bin
+Link: nvidia/tu106/nvdec/scrubber.bin -> ../../tu102/nvdec/scrubber.bin
+Link: nvidia/tu106/sec2/desc.bin -> ../../tu102/sec2/desc.bin
+Link: nvidia/tu106/sec2/image.bin -> ../../tu102/sec2/image.bin
+Link: nvidia/tu106/sec2/sig.bin -> ../../tu102/sec2/sig.bin
 File: nvidia/tu116/acr/bl.bin
 File: nvidia/tu116/acr/ucode_ahesasc.bin
 File: nvidia/tu116/acr/ucode_asb.bin
@@ -4492,16 +4492,16 @@ File: nvidia/tu116/nvdec/scrubber.bin
 File: nvidia/tu116/sec2/desc.bin
 File: nvidia/tu116/sec2/image.bin
 File: nvidia/tu116/sec2/sig.bin
-File: nvidia/tu117/acr/bl.bin
-File: nvidia/tu117/acr/ucode_ahesasc.bin
-File: nvidia/tu117/acr/ucode_asb.bin
-File: nvidia/tu117/acr/ucode_unload.bin
-File: nvidia/tu117/acr/unload_bl.bin
-File: nvidia/tu117/gr/fecs_bl.bin
+Link: nvidia/tu117/acr/bl.bin -> ../../tu116/acr/bl.bin
+Link: nvidia/tu117/acr/ucode_ahesasc.bin -> ../../tu116/acr/ucode_ahesasc.bin
+Link: nvidia/tu117/acr/ucode_asb.bin -> ../../tu116/acr/ucode_asb.bin
+Link: nvidia/tu117/acr/ucode_unload.bin -> ../../tu116/acr/ucode_unload.bin
+Link: nvidia/tu117/acr/unload_bl.bin -> ../../tu116/acr/unload_bl.bin
+Link: nvidia/tu117/gr/fecs_bl.bin -> ../../tu116/gr/fecs_bl.bin
 File: nvidia/tu117/gr/fecs_data.bin
 File: nvidia/tu117/gr/fecs_inst.bin
 File: nvidia/tu117/gr/fecs_sig.bin
-File: nvidia/tu117/gr/gpccs_bl.bin
+Link: nvidia/tu117/gr/gpccs_bl.bin -> ../../tu116/gr/gpccs_bl.bin
 File: nvidia/tu117/gr/gpccs_data.bin
 File: nvidia/tu117/gr/gpccs_inst.bin
 File: nvidia/tu117/gr/gpccs_sig.bin
@@ -4510,10 +4510,10 @@ File: nvidia/tu117/gr/sw_ctx.bin
 File: nvidia/tu117/gr/sw_method_init.bin
 File: nvidia/tu117/gr/sw_nonctx.bin
 File: nvidia/tu117/gr/sw_veid_bundle_init.bin
-File: nvidia/tu117/nvdec/scrubber.bin
-File: nvidia/tu117/sec2/desc.bin
-File: nvidia/tu117/sec2/image.bin
-File: nvidia/tu117/sec2/sig.bin
+Link: nvidia/tu117/nvdec/scrubber.bin -> ../../tu116/nvdec/scrubber.bin
+Link: nvidia/tu117/sec2/desc.bin -> ../../tu116/sec2/desc.bin
+Link: nvidia/tu117/sec2/image.bin -> ../../tu116/sec2/image.bin
+Link: nvidia/tu117/sec2/sig.bin -> ../../tu116/sec2/sig.bin
 
 File: nvidia/tu10x/typec/ccg_primary.cyacd
 File: nvidia/tu10x/typec/ccg_secondary.cyacd
diff --git a/nvidia/gm204/acr/bl.bin b/nvidia/gm204/acr/bl.bin
deleted file mode 120000
index af6b991..0000000
--- a/nvidia/gm204/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/gm204/acr/ucode_load.bin b/nvidia/gm204/acr/ucode_load.bin
deleted file mode 120000
index 015da47..0000000
--- a/nvidia/gm204/acr/ucode_load.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/acr/ucode_load.bin
\ No newline at end of file
diff --git a/nvidia/gm204/acr/ucode_unload.bin b/nvidia/gm204/acr/ucode_unload.bin
deleted file mode 120000
index 2f4e7b1..0000000
--- a/nvidia/gm204/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/fecs_bl.bin b/nvidia/gm204/gr/fecs_bl.bin
deleted file mode 120000
index 2cadb52..0000000
--- a/nvidia/gm204/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/fecs_inst.bin b/nvidia/gm204/gr/fecs_inst.bin
deleted file mode 120000
index ad40ed4..0000000
--- a/nvidia/gm204/gr/fecs_inst.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/fecs_inst.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/gpccs_bl.bin b/nvidia/gm204/gr/gpccs_bl.bin
deleted file mode 120000
index c99d4a3..0000000
--- a/nvidia/gm204/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/gpccs_inst.bin b/nvidia/gm204/gr/gpccs_inst.bin
deleted file mode 120000
index 8bf4ebc..0000000
--- a/nvidia/gm204/gr/gpccs_inst.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/gpccs_inst.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/sw_bundle_init.bin b/nvidia/gm204/gr/sw_bundle_init.bin
deleted file mode 120000
index a003fd7..0000000
--- a/nvidia/gm204/gr/sw_bundle_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_bundle_init.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/sw_ctx.bin b/nvidia/gm204/gr/sw_ctx.bin
deleted file mode 120000
index 7b3e012..0000000
--- a/nvidia/gm204/gr/sw_ctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_ctx.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/sw_method_init.bin b/nvidia/gm204/gr/sw_method_init.bin
deleted file mode 120000
index 13114cb..0000000
--- a/nvidia/gm204/gr/sw_method_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_method_init.bin
\ No newline at end of file
diff --git a/nvidia/gm204/gr/sw_nonctx.bin b/nvidia/gm204/gr/sw_nonctx.bin
deleted file mode 120000
index 9743f23..0000000
--- a/nvidia/gm204/gr/sw_nonctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_nonctx.bin
\ No newline at end of file
diff --git a/nvidia/gm206/acr/bl.bin b/nvidia/gm206/acr/bl.bin
deleted file mode 120000
index af6b991..0000000
--- a/nvidia/gm206/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/fecs_bl.bin b/nvidia/gm206/gr/fecs_bl.bin
deleted file mode 120000
index 2cadb52..0000000
--- a/nvidia/gm206/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/fecs_inst.bin b/nvidia/gm206/gr/fecs_inst.bin
deleted file mode 120000
index ad40ed4..0000000
--- a/nvidia/gm206/gr/fecs_inst.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/fecs_inst.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/gpccs_bl.bin b/nvidia/gm206/gr/gpccs_bl.bin
deleted file mode 120000
index c99d4a3..0000000
--- a/nvidia/gm206/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/gpccs_inst.bin b/nvidia/gm206/gr/gpccs_inst.bin
deleted file mode 120000
index 8bf4ebc..0000000
--- a/nvidia/gm206/gr/gpccs_inst.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/gpccs_inst.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/sw_bundle_init.bin b/nvidia/gm206/gr/sw_bundle_init.bin
deleted file mode 120000
index a003fd7..0000000
--- a/nvidia/gm206/gr/sw_bundle_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_bundle_init.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/sw_ctx.bin b/nvidia/gm206/gr/sw_ctx.bin
deleted file mode 120000
index 7b3e012..0000000
--- a/nvidia/gm206/gr/sw_ctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_ctx.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/sw_method_init.bin b/nvidia/gm206/gr/sw_method_init.bin
deleted file mode 120000
index 13114cb..0000000
--- a/nvidia/gm206/gr/sw_method_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_method_init.bin
\ No newline at end of file
diff --git a/nvidia/gm206/gr/sw_nonctx.bin b/nvidia/gm206/gr/sw_nonctx.bin
deleted file mode 120000
index 9743f23..0000000
--- a/nvidia/gm206/gr/sw_nonctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_nonctx.bin
\ No newline at end of file
diff --git a/nvidia/gm20b/gr/sw_method_init.bin b/nvidia/gm20b/gr/sw_method_init.bin
deleted file mode 120000
index 13114cb..0000000
--- a/nvidia/gm20b/gr/sw_method_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/sw_method_init.bin
\ No newline at end of file
diff --git a/nvidia/gp100/gr/fecs_bl.bin b/nvidia/gp100/gr/fecs_bl.bin
deleted file mode 120000
index 2cadb52..0000000
--- a/nvidia/gp100/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp100/gr/gpccs_bl.bin b/nvidia/gp100/gr/gpccs_bl.bin
deleted file mode 120000
index c99d4a3..0000000
--- a/nvidia/gp100/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp102/gr/fecs_bl.bin b/nvidia/gp102/gr/fecs_bl.bin
deleted file mode 120000
index 2cadb52..0000000
--- a/nvidia/gp102/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp102/gr/gpccs_bl.bin b/nvidia/gp102/gr/gpccs_bl.bin
deleted file mode 120000
index c99d4a3..0000000
--- a/nvidia/gp102/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gm200/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp104/acr/bl.bin b/nvidia/gp104/acr/bl.bin
deleted file mode 120000
index 1aee06b..0000000
--- a/nvidia/gp104/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/gp104/acr/ucode_load.bin b/nvidia/gp104/acr/ucode_load.bin
deleted file mode 120000
index cf78a87..0000000
--- a/nvidia/gp104/acr/ucode_load.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_load.bin
\ No newline at end of file
diff --git a/nvidia/gp104/acr/ucode_unload.bin b/nvidia/gp104/acr/ucode_unload.bin
deleted file mode 120000
index 3d7bf76..0000000
--- a/nvidia/gp104/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/gp104/acr/unload_bl.bin b/nvidia/gp104/acr/unload_bl.bin
deleted file mode 120000
index 67bc4ab..0000000
--- a/nvidia/gp104/acr/unload_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/unload_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp104/gr/fecs_bl.bin b/nvidia/gp104/gr/fecs_bl.bin
deleted file mode 120000
index c36d749..0000000
--- a/nvidia/gp104/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp104/gr/gpccs_bl.bin b/nvidia/gp104/gr/gpccs_bl.bin
deleted file mode 120000
index 82f8824..0000000
--- a/nvidia/gp104/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp104/gr/sw_bundle_init.bin b/nvidia/gp104/gr/sw_bundle_init.bin
deleted file mode 120000
index f9647d5..0000000
--- a/nvidia/gp104/gr/sw_bundle_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_bundle_init.bin
\ No newline at end of file
diff --git a/nvidia/gp104/gr/sw_ctx.bin b/nvidia/gp104/gr/sw_ctx.bin
deleted file mode 120000
index 4381a88..0000000
--- a/nvidia/gp104/gr/sw_ctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_ctx.bin
\ No newline at end of file
diff --git a/nvidia/gp104/gr/sw_method_init.bin b/nvidia/gp104/gr/sw_method_init.bin
deleted file mode 120000
index 9e03f7c..0000000
--- a/nvidia/gp104/gr/sw_method_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_method_init.bin
\ No newline at end of file
diff --git a/nvidia/gp104/gr/sw_nonctx.bin b/nvidia/gp104/gr/sw_nonctx.bin
deleted file mode 120000
index f480468..0000000
--- a/nvidia/gp104/gr/sw_nonctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_nonctx.bin
\ No newline at end of file
diff --git a/nvidia/gp104/nvdec/scrubber.bin b/nvidia/gp104/nvdec/scrubber.bin
deleted file mode 120000
index 06a089c..0000000
--- a/nvidia/gp104/nvdec/scrubber.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/nvdec/scrubber.bin
\ No newline at end of file
diff --git a/nvidia/gp104/sec2/desc-1.bin b/nvidia/gp104/sec2/desc-1.bin
deleted file mode 120000
index 81f7815..0000000
--- a/nvidia/gp104/sec2/desc-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/desc-1.bin
\ No newline at end of file
diff --git a/nvidia/gp104/sec2/desc.bin b/nvidia/gp104/sec2/desc.bin
deleted file mode 120000
index e098655..0000000
--- a/nvidia/gp104/sec2/desc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/desc.bin
\ No newline at end of file
diff --git a/nvidia/gp104/sec2/image-1.bin b/nvidia/gp104/sec2/image-1.bin
deleted file mode 120000
index e2dc9d4..0000000
--- a/nvidia/gp104/sec2/image-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/image-1.bin
\ No newline at end of file
diff --git a/nvidia/gp104/sec2/image.bin b/nvidia/gp104/sec2/image.bin
deleted file mode 120000
index fb46bf6..0000000
--- a/nvidia/gp104/sec2/image.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/image.bin
\ No newline at end of file
diff --git a/nvidia/gp104/sec2/sig-1.bin b/nvidia/gp104/sec2/sig-1.bin
deleted file mode 120000
index 0de0448..0000000
--- a/nvidia/gp104/sec2/sig-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/sig-1.bin
\ No newline at end of file
diff --git a/nvidia/gp104/sec2/sig.bin b/nvidia/gp104/sec2/sig.bin
deleted file mode 120000
index c7acc34..0000000
--- a/nvidia/gp104/sec2/sig.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/sig.bin
\ No newline at end of file
diff --git a/nvidia/gp106/acr/bl.bin b/nvidia/gp106/acr/bl.bin
deleted file mode 120000
index 1aee06b..0000000
--- a/nvidia/gp106/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/gp106/acr/ucode_load.bin b/nvidia/gp106/acr/ucode_load.bin
deleted file mode 120000
index cf78a87..0000000
--- a/nvidia/gp106/acr/ucode_load.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_load.bin
\ No newline at end of file
diff --git a/nvidia/gp106/acr/ucode_unload.bin b/nvidia/gp106/acr/ucode_unload.bin
deleted file mode 120000
index 3d7bf76..0000000
--- a/nvidia/gp106/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/gp106/acr/unload_bl.bin b/nvidia/gp106/acr/unload_bl.bin
deleted file mode 120000
index 67bc4ab..0000000
--- a/nvidia/gp106/acr/unload_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/unload_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/fecs_bl.bin b/nvidia/gp106/gr/fecs_bl.bin
deleted file mode 120000
index c36d749..0000000
--- a/nvidia/gp106/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/fecs_inst.bin b/nvidia/gp106/gr/fecs_inst.bin
deleted file mode 120000
index be8749f..0000000
--- a/nvidia/gp106/gr/fecs_inst.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/fecs_inst.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/gpccs_bl.bin b/nvidia/gp106/gr/gpccs_bl.bin
deleted file mode 120000
index 82f8824..0000000
--- a/nvidia/gp106/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/gpccs_inst.bin b/nvidia/gp106/gr/gpccs_inst.bin
deleted file mode 120000
index 17af2f4..0000000
--- a/nvidia/gp106/gr/gpccs_inst.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/gpccs_inst.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/sw_bundle_init.bin b/nvidia/gp106/gr/sw_bundle_init.bin
deleted file mode 120000
index f9647d5..0000000
--- a/nvidia/gp106/gr/sw_bundle_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_bundle_init.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/sw_ctx.bin b/nvidia/gp106/gr/sw_ctx.bin
deleted file mode 120000
index 4381a88..0000000
--- a/nvidia/gp106/gr/sw_ctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_ctx.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/sw_method_init.bin b/nvidia/gp106/gr/sw_method_init.bin
deleted file mode 120000
index 9e03f7c..0000000
--- a/nvidia/gp106/gr/sw_method_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_method_init.bin
\ No newline at end of file
diff --git a/nvidia/gp106/gr/sw_nonctx.bin b/nvidia/gp106/gr/sw_nonctx.bin
deleted file mode 120000
index f480468..0000000
--- a/nvidia/gp106/gr/sw_nonctx.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_nonctx.bin
\ No newline at end of file
diff --git a/nvidia/gp106/nvdec/scrubber.bin b/nvidia/gp106/nvdec/scrubber.bin
deleted file mode 120000
index 06a089c..0000000
--- a/nvidia/gp106/nvdec/scrubber.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/nvdec/scrubber.bin
\ No newline at end of file
diff --git a/nvidia/gp106/sec2/desc-1.bin b/nvidia/gp106/sec2/desc-1.bin
deleted file mode 120000
index 81f7815..0000000
--- a/nvidia/gp106/sec2/desc-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/desc-1.bin
\ No newline at end of file
diff --git a/nvidia/gp106/sec2/desc.bin b/nvidia/gp106/sec2/desc.bin
deleted file mode 120000
index e098655..0000000
--- a/nvidia/gp106/sec2/desc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/desc.bin
\ No newline at end of file
diff --git a/nvidia/gp106/sec2/image-1.bin b/nvidia/gp106/sec2/image-1.bin
deleted file mode 120000
index e2dc9d4..0000000
--- a/nvidia/gp106/sec2/image-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/image-1.bin
\ No newline at end of file
diff --git a/nvidia/gp106/sec2/image.bin b/nvidia/gp106/sec2/image.bin
deleted file mode 120000
index fb46bf6..0000000
--- a/nvidia/gp106/sec2/image.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/image.bin
\ No newline at end of file
diff --git a/nvidia/gp106/sec2/sig-1.bin b/nvidia/gp106/sec2/sig-1.bin
deleted file mode 120000
index 0de0448..0000000
--- a/nvidia/gp106/sec2/sig-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/sig-1.bin
\ No newline at end of file
diff --git a/nvidia/gp106/sec2/sig.bin b/nvidia/gp106/sec2/sig.bin
deleted file mode 120000
index c7acc34..0000000
--- a/nvidia/gp106/sec2/sig.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/sig.bin
\ No newline at end of file
diff --git a/nvidia/gp107/acr/bl.bin b/nvidia/gp107/acr/bl.bin
deleted file mode 120000
index 1aee06b..0000000
--- a/nvidia/gp107/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/gp107/acr/ucode_load.bin b/nvidia/gp107/acr/ucode_load.bin
deleted file mode 120000
index cf78a87..0000000
--- a/nvidia/gp107/acr/ucode_load.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_load.bin
\ No newline at end of file
diff --git a/nvidia/gp107/acr/ucode_unload.bin b/nvidia/gp107/acr/ucode_unload.bin
deleted file mode 120000
index 3d7bf76..0000000
--- a/nvidia/gp107/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/gp107/acr/unload_bl.bin b/nvidia/gp107/acr/unload_bl.bin
deleted file mode 120000
index 67bc4ab..0000000
--- a/nvidia/gp107/acr/unload_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/unload_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp107/gr/sw_bundle_init.bin b/nvidia/gp107/gr/sw_bundle_init.bin
deleted file mode 120000
index f9647d5..0000000
--- a/nvidia/gp107/gr/sw_bundle_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_bundle_init.bin
\ No newline at end of file
diff --git a/nvidia/gp107/gr/sw_method_init.bin b/nvidia/gp107/gr/sw_method_init.bin
deleted file mode 120000
index 9e03f7c..0000000
--- a/nvidia/gp107/gr/sw_method_init.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/gr/sw_method_init.bin
\ No newline at end of file
diff --git a/nvidia/gp107/nvdec/scrubber.bin b/nvidia/gp107/nvdec/scrubber.bin
deleted file mode 120000
index 06a089c..0000000
--- a/nvidia/gp107/nvdec/scrubber.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/nvdec/scrubber.bin
\ No newline at end of file
diff --git a/nvidia/gp107/sec2/desc-1.bin b/nvidia/gp107/sec2/desc-1.bin
deleted file mode 120000
index 81f7815..0000000
--- a/nvidia/gp107/sec2/desc-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/desc-1.bin
\ No newline at end of file
diff --git a/nvidia/gp107/sec2/desc.bin b/nvidia/gp107/sec2/desc.bin
deleted file mode 120000
index e098655..0000000
--- a/nvidia/gp107/sec2/desc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/desc.bin
\ No newline at end of file
diff --git a/nvidia/gp107/sec2/image-1.bin b/nvidia/gp107/sec2/image-1.bin
deleted file mode 120000
index e2dc9d4..0000000
--- a/nvidia/gp107/sec2/image-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/image-1.bin
\ No newline at end of file
diff --git a/nvidia/gp107/sec2/image.bin b/nvidia/gp107/sec2/image.bin
deleted file mode 120000
index fb46bf6..0000000
--- a/nvidia/gp107/sec2/image.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/image.bin
\ No newline at end of file
diff --git a/nvidia/gp107/sec2/sig-1.bin b/nvidia/gp107/sec2/sig-1.bin
deleted file mode 120000
index 0de0448..0000000
--- a/nvidia/gp107/sec2/sig-1.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/sig-1.bin
\ No newline at end of file
diff --git a/nvidia/gp107/sec2/sig.bin b/nvidia/gp107/sec2/sig.bin
deleted file mode 120000
index c7acc34..0000000
--- a/nvidia/gp107/sec2/sig.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/sig.bin
\ No newline at end of file
diff --git a/nvidia/gp108/acr/bl.bin b/nvidia/gp108/acr/bl.bin
deleted file mode 120000
index 1aee06b..0000000
--- a/nvidia/gp108/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/gp108/acr/ucode_load.bin b/nvidia/gp108/acr/ucode_load.bin
deleted file mode 120000
index cf78a87..0000000
--- a/nvidia/gp108/acr/ucode_load.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_load.bin
\ No newline at end of file
diff --git a/nvidia/gp108/acr/ucode_unload.bin b/nvidia/gp108/acr/ucode_unload.bin
deleted file mode 120000
index 3d7bf76..0000000
--- a/nvidia/gp108/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/gp108/acr/unload_bl.bin b/nvidia/gp108/acr/unload_bl.bin
deleted file mode 120000
index 67bc4ab..0000000
--- a/nvidia/gp108/acr/unload_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/acr/unload_bl.bin
\ No newline at end of file
diff --git a/nvidia/gp108/nvdec/scrubber.bin b/nvidia/gp108/nvdec/scrubber.bin
deleted file mode 120000
index 06a089c..0000000
--- a/nvidia/gp108/nvdec/scrubber.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/nvdec/scrubber.bin
\ No newline at end of file
diff --git a/nvidia/gp108/sec2/desc.bin b/nvidia/gp108/sec2/desc.bin
deleted file mode 120000
index 81f7815..0000000
--- a/nvidia/gp108/sec2/desc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/desc-1.bin
\ No newline at end of file
diff --git a/nvidia/gp108/sec2/image.bin b/nvidia/gp108/sec2/image.bin
deleted file mode 120000
index e2dc9d4..0000000
--- a/nvidia/gp108/sec2/image.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/image-1.bin
\ No newline at end of file
diff --git a/nvidia/gp108/sec2/sig.bin b/nvidia/gp108/sec2/sig.bin
deleted file mode 120000
index 0de0448..0000000
--- a/nvidia/gp108/sec2/sig.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../gp102/sec2/sig-1.bin
\ No newline at end of file
diff --git a/nvidia/tu104/acr/bl.bin b/nvidia/tu104/acr/bl.bin
deleted file mode 120000
index aa012a2..0000000
--- a/nvidia/tu104/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/tu104/acr/ucode_ahesasc.bin b/nvidia/tu104/acr/ucode_ahesasc.bin
deleted file mode 120000
index 7c69051..0000000
--- a/nvidia/tu104/acr/ucode_ahesasc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/ucode_ahesasc.bin
\ No newline at end of file
diff --git a/nvidia/tu104/acr/ucode_asb.bin b/nvidia/tu104/acr/ucode_asb.bin
deleted file mode 120000
index 3ff7558..0000000
--- a/nvidia/tu104/acr/ucode_asb.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/ucode_asb.bin
\ No newline at end of file
diff --git a/nvidia/tu104/acr/ucode_unload.bin b/nvidia/tu104/acr/ucode_unload.bin
deleted file mode 120000
index a96d703..0000000
--- a/nvidia/tu104/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/tu104/acr/unload_bl.bin b/nvidia/tu104/acr/unload_bl.bin
deleted file mode 120000
index 15e0905..0000000
--- a/nvidia/tu104/acr/unload_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/unload_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu104/gr/fecs_bl.bin b/nvidia/tu104/gr/fecs_bl.bin
deleted file mode 120000
index dda1e65..0000000
--- a/nvidia/tu104/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu104/gr/gpccs_bl.bin b/nvidia/tu104/gr/gpccs_bl.bin
deleted file mode 120000
index 4983072..0000000
--- a/nvidia/tu104/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu104/nvdec/scrubber.bin b/nvidia/tu104/nvdec/scrubber.bin
deleted file mode 120000
index 892d6fd..0000000
--- a/nvidia/tu104/nvdec/scrubber.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/nvdec/scrubber.bin
\ No newline at end of file
diff --git a/nvidia/tu104/sec2/desc.bin b/nvidia/tu104/sec2/desc.bin
deleted file mode 120000
index 67fc6d9..0000000
--- a/nvidia/tu104/sec2/desc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/sec2/desc.bin
\ No newline at end of file
diff --git a/nvidia/tu104/sec2/image.bin b/nvidia/tu104/sec2/image.bin
deleted file mode 120000
index 7bc2df1..0000000
--- a/nvidia/tu104/sec2/image.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/sec2/image.bin
\ No newline at end of file
diff --git a/nvidia/tu104/sec2/sig.bin b/nvidia/tu104/sec2/sig.bin
deleted file mode 120000
index 24a48bb..0000000
--- a/nvidia/tu104/sec2/sig.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/sec2/sig.bin
\ No newline at end of file
diff --git a/nvidia/tu106/acr/bl.bin b/nvidia/tu106/acr/bl.bin
deleted file mode 120000
index aa012a2..0000000
--- a/nvidia/tu106/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/tu106/acr/ucode_ahesasc.bin b/nvidia/tu106/acr/ucode_ahesasc.bin
deleted file mode 120000
index 7c69051..0000000
--- a/nvidia/tu106/acr/ucode_ahesasc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/ucode_ahesasc.bin
\ No newline at end of file
diff --git a/nvidia/tu106/acr/ucode_asb.bin b/nvidia/tu106/acr/ucode_asb.bin
deleted file mode 120000
index 3ff7558..0000000
--- a/nvidia/tu106/acr/ucode_asb.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/ucode_asb.bin
\ No newline at end of file
diff --git a/nvidia/tu106/acr/ucode_unload.bin b/nvidia/tu106/acr/ucode_unload.bin
deleted file mode 120000
index a96d703..0000000
--- a/nvidia/tu106/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/tu106/acr/unload_bl.bin b/nvidia/tu106/acr/unload_bl.bin
deleted file mode 120000
index 15e0905..0000000
--- a/nvidia/tu106/acr/unload_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/acr/unload_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu106/gr/fecs_bl.bin b/nvidia/tu106/gr/fecs_bl.bin
deleted file mode 120000
index dda1e65..0000000
--- a/nvidia/tu106/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu106/gr/gpccs_bl.bin b/nvidia/tu106/gr/gpccs_bl.bin
deleted file mode 120000
index 4983072..0000000
--- a/nvidia/tu106/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu106/nvdec/scrubber.bin b/nvidia/tu106/nvdec/scrubber.bin
deleted file mode 120000
index 892d6fd..0000000
--- a/nvidia/tu106/nvdec/scrubber.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/nvdec/scrubber.bin
\ No newline at end of file
diff --git a/nvidia/tu106/sec2/desc.bin b/nvidia/tu106/sec2/desc.bin
deleted file mode 120000
index 67fc6d9..0000000
--- a/nvidia/tu106/sec2/desc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/sec2/desc.bin
\ No newline at end of file
diff --git a/nvidia/tu106/sec2/image.bin b/nvidia/tu106/sec2/image.bin
deleted file mode 120000
index 7bc2df1..0000000
--- a/nvidia/tu106/sec2/image.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/sec2/image.bin
\ No newline at end of file
diff --git a/nvidia/tu106/sec2/sig.bin b/nvidia/tu106/sec2/sig.bin
deleted file mode 120000
index 24a48bb..0000000
--- a/nvidia/tu106/sec2/sig.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu102/sec2/sig.bin
\ No newline at end of file
diff --git a/nvidia/tu117/acr/bl.bin b/nvidia/tu117/acr/bl.bin
deleted file mode 120000
index 888d361..0000000
--- a/nvidia/tu117/acr/bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/acr/bl.bin
\ No newline at end of file
diff --git a/nvidia/tu117/acr/ucode_ahesasc.bin b/nvidia/tu117/acr/ucode_ahesasc.bin
deleted file mode 120000
index 346b514..0000000
--- a/nvidia/tu117/acr/ucode_ahesasc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/acr/ucode_ahesasc.bin
\ No newline at end of file
diff --git a/nvidia/tu117/acr/ucode_asb.bin b/nvidia/tu117/acr/ucode_asb.bin
deleted file mode 120000
index f3c6b7d..0000000
--- a/nvidia/tu117/acr/ucode_asb.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/acr/ucode_asb.bin
\ No newline at end of file
diff --git a/nvidia/tu117/acr/ucode_unload.bin b/nvidia/tu117/acr/ucode_unload.bin
deleted file mode 120000
index 19db442..0000000
--- a/nvidia/tu117/acr/ucode_unload.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/acr/ucode_unload.bin
\ No newline at end of file
diff --git a/nvidia/tu117/acr/unload_bl.bin b/nvidia/tu117/acr/unload_bl.bin
deleted file mode 120000
index 384d358..0000000
--- a/nvidia/tu117/acr/unload_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/acr/unload_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu117/gr/fecs_bl.bin b/nvidia/tu117/gr/fecs_bl.bin
deleted file mode 120000
index bc2f0f5..0000000
--- a/nvidia/tu117/gr/fecs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/gr/fecs_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu117/gr/gpccs_bl.bin b/nvidia/tu117/gr/gpccs_bl.bin
deleted file mode 120000
index fb8c01a..0000000
--- a/nvidia/tu117/gr/gpccs_bl.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/gr/gpccs_bl.bin
\ No newline at end of file
diff --git a/nvidia/tu117/nvdec/scrubber.bin b/nvidia/tu117/nvdec/scrubber.bin
deleted file mode 120000
index 6ce6040..0000000
--- a/nvidia/tu117/nvdec/scrubber.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/nvdec/scrubber.bin
\ No newline at end of file
diff --git a/nvidia/tu117/sec2/desc.bin b/nvidia/tu117/sec2/desc.bin
deleted file mode 120000
index 61ffd78..0000000
--- a/nvidia/tu117/sec2/desc.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/sec2/desc.bin
\ No newline at end of file
diff --git a/nvidia/tu117/sec2/image.bin b/nvidia/tu117/sec2/image.bin
deleted file mode 120000
index 2d523bf..0000000
--- a/nvidia/tu117/sec2/image.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/sec2/image.bin
\ No newline at end of file
diff --git a/nvidia/tu117/sec2/sig.bin b/nvidia/tu117/sec2/sig.bin
deleted file mode 120000
index 5bb9cb7..0000000
--- a/nvidia/tu117/sec2/sig.bin
+++ /dev/null
@@ -1 +0,0 @@
-../../tu116/sec2/sig.bin
\ No newline at end of file
-- 
2.26.2

