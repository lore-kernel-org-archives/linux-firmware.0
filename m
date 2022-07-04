Return-Path: <SRS0=zW0y=XJ=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC85C433EF
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Jul 2022 11:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98EA4C341CE; Mon,  4 Jul 2022 11:24:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1B44C3411E;
	Mon,  4 Jul 2022 11:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1B44C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id q9so13018296wrd.8;
        Mon, 04 Jul 2022 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yW+8s2lH8upLhQGybwX4997T+1iLGu15P/RprGmJM7s=;
        b=nPuXCPo0cxhevoc57HxYQ9v4ps+2gZc2JGHIODPqxBdep4gsCMbh18ktgRkNRrIK96
         ZuMxc/pH4e9Nq71bhZ86n9yOvllqfzVpMoiXoAjc4vrucEgEqQ9Wjpr7YgnEy2qc8p+Y
         I4WPjjyzUnvV4/tCTMXqpexNY+CkJuPu8oGCMOXFM7YsPpT+n7PrQyoP4V2XOMyA0khl
         YnILaya9dfD+HVASQXbwLZoO6i228A9ZgLN8khSibc96VuTOG9TSRyPfVSWhcHSbUmko
         sfiznL7EAWHypT+s9hatj5H0x1UB7PHH/dEsE8fOqaZIdp+QjCb+uy4scIoWYTtfNwsX
         3IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yW+8s2lH8upLhQGybwX4997T+1iLGu15P/RprGmJM7s=;
        b=q5RZWSLOLO2L4nx7T/NVqt6leI+OKFF9j5OE5+vq/RdLpVgu3hXwIFySho39nTKjxh
         E6pcHrte2vs+GnbbpcqwMYo/geKRMBWJ6ajyBLZKAUqoai56IWeONKM/22dzrLgpoE/r
         XlDzX2OxFlZmKFRn1LpnUt6x+yoc7RQ2cZy1MKO5ZSYDHggMjSM3PR/F6DV85FIK43bu
         bGDCPM82BYHshozpg6s7aUhADXmRiczs0rhWkDvvscJSullAyd1zyoxkr37I43rMp7zu
         rAh9oQeNxo6cV19FSLCC79ftxxtWVadzj4fCxZ8vYm8Cja8A+HAMuBvWBwDsvpW/Rlws
         rYrg==
X-Gm-Message-State: AJIora+nA6VigrGLfWigAVaDWTzFJHWVfXoi4rr1Q0HHEjWTCBTHRgce
	8lSfnHufWijFVVdSTuZtLPiG8G7jV00=
X-Google-Smtp-Source: AGRyM1vIOd/3v7YrLsnx7RRTAHZ2rp/i60tOAePn9xjtwKJunZPH9bOMrvfo28wSsYeAB63c0WSVVw==
X-Received: by 2002:adf:f245:0:b0:21b:c705:8b1 with SMTP id b5-20020adff245000000b0021bc70508b1mr25784231wrp.282.1656933890043;
        Mon, 04 Jul 2022 04:24:50 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id n7-20020a5d67c7000000b0021b9e8d4c22sm29988500wrw.61.2022.07.04.04.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 04:24:49 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/3] bnx2: sort firmware names in filesystem order
Date: Mon,  4 Jul 2022 12:24:42 +0100
Message-Id: <20220704112443.732092-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704112443.732092-1-pbrobinson@gmail.com>
References: <20220704112443.732092-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the WHENCE entries in the same order they appear on the
filesystem.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE | 68 +++++++++++++++++++++++++++++-----------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/WHENCE b/WHENCE
index 236b50c..500a152 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1566,56 +1566,56 @@ Found in hex form in kernel source.
 Driver: bnx2x: Broadcom Everest
 
 File: bnx2x/bnx2x-e1-6.0.34.0.fw
-File: bnx2x/bnx2x-e1h-6.0.34.0.fw
-File: bnx2x/bnx2x-e2-6.0.34.0.fw
 File: bnx2x/bnx2x-e1-6.2.5.0.fw
-File: bnx2x/bnx2x-e1h-6.2.5.0.fw
-File: bnx2x/bnx2x-e2-6.2.5.0.fw
 File: bnx2x/bnx2x-e1-6.2.9.0.fw
-File: bnx2x/bnx2x-e1h-6.2.9.0.fw
-File: bnx2x/bnx2x-e2-6.2.9.0.fw
-File: bnx2x/bnx2x-e2-7.0.20.0.fw
 File: bnx2x/bnx2x-e1-7.0.20.0.fw
-File: bnx2x/bnx2x-e1h-7.0.20.0.fw
-File: bnx2x/bnx2x-e2-7.0.23.0.fw
 File: bnx2x/bnx2x-e1-7.0.23.0.fw
-File: bnx2x/bnx2x-e1h-7.0.23.0.fw
-File: bnx2x/bnx2x-e2-7.0.29.0.fw
 File: bnx2x/bnx2x-e1-7.0.29.0.fw
-File: bnx2x/bnx2x-e1h-7.0.29.0.fw
-File: bnx2x/bnx2x-e2-7.2.16.0.fw
+File: bnx2x/bnx2x-e1-7.10.51.0.fw
+File: bnx2x/bnx2x-e1-7.12.30.0.fw
+File: bnx2x/bnx2x-e1-7.13.1.0.fw
+File: bnx2x/bnx2x-e1-7.13.11.0.fw
+File: bnx2x/bnx2x-e1-7.13.15.0.fw
+File: bnx2x/bnx2x-e1-7.13.21.0.fw
 File: bnx2x/bnx2x-e1-7.2.16.0.fw
-File: bnx2x/bnx2x-e1h-7.2.16.0.fw
-File: bnx2x/bnx2x-e2-7.2.51.0.fw
 File: bnx2x/bnx2x-e1-7.2.51.0.fw
-File: bnx2x/bnx2x-e1h-7.2.51.0.fw
-File: bnx2x/bnx2x-e1-7.8.2.0.fw
-File: bnx2x/bnx2x-e1h-7.8.2.0.fw
-File: bnx2x/bnx2x-e2-7.8.2.0.fw
 File: bnx2x/bnx2x-e1-7.8.17.0.fw
-File: bnx2x/bnx2x-e1h-7.8.17.0.fw
-File: bnx2x/bnx2x-e2-7.8.17.0.fw
 File: bnx2x/bnx2x-e1-7.8.19.0.fw
-File: bnx2x/bnx2x-e1h-7.8.19.0.fw
-File: bnx2x/bnx2x-e2-7.8.19.0.fw
-File: bnx2x/bnx2x-e1-7.10.51.0.fw
+File: bnx2x/bnx2x-e1-7.8.2.0.fw
+File: bnx2x/bnx2x-e1h-6.0.34.0.fw
+File: bnx2x/bnx2x-e1h-6.2.5.0.fw
+File: bnx2x/bnx2x-e1h-6.2.9.0.fw
+File: bnx2x/bnx2x-e1h-7.0.20.0.fw
+File: bnx2x/bnx2x-e1h-7.0.23.0.fw
+File: bnx2x/bnx2x-e1h-7.0.29.0.fw
 File: bnx2x/bnx2x-e1h-7.10.51.0.fw
-File: bnx2x/bnx2x-e2-7.10.51.0.fw
-File: bnx2x/bnx2x-e1-7.12.30.0.fw
 File: bnx2x/bnx2x-e1h-7.12.30.0.fw
-File: bnx2x/bnx2x-e2-7.12.30.0.fw
-File: bnx2x/bnx2x-e1-7.13.1.0.fw
 File: bnx2x/bnx2x-e1h-7.13.1.0.fw
-File: bnx2x/bnx2x-e2-7.13.1.0.fw
-File: bnx2x/bnx2x-e1-7.13.11.0.fw
 File: bnx2x/bnx2x-e1h-7.13.11.0.fw
-File: bnx2x/bnx2x-e2-7.13.11.0.fw
-File: bnx2x/bnx2x-e1-7.13.15.0.fw
 File: bnx2x/bnx2x-e1h-7.13.15.0.fw
-File: bnx2x/bnx2x-e2-7.13.15.0.fw
-File: bnx2x/bnx2x-e1-7.13.21.0.fw
 File: bnx2x/bnx2x-e1h-7.13.21.0.fw
+File: bnx2x/bnx2x-e1h-7.2.16.0.fw
+File: bnx2x/bnx2x-e1h-7.2.51.0.fw
+File: bnx2x/bnx2x-e1h-7.8.17.0.fw
+File: bnx2x/bnx2x-e1h-7.8.19.0.fw
+File: bnx2x/bnx2x-e1h-7.8.2.0.fw
+File: bnx2x/bnx2x-e2-6.0.34.0.fw
+File: bnx2x/bnx2x-e2-6.2.5.0.fw
+File: bnx2x/bnx2x-e2-6.2.9.0.fw
+File: bnx2x/bnx2x-e2-7.0.20.0.fw
+File: bnx2x/bnx2x-e2-7.0.23.0.fw
+File: bnx2x/bnx2x-e2-7.0.29.0.fw
+File: bnx2x/bnx2x-e2-7.10.51.0.fw
+File: bnx2x/bnx2x-e2-7.12.30.0.fw
+File: bnx2x/bnx2x-e2-7.13.1.0.fw
+File: bnx2x/bnx2x-e2-7.13.11.0.fw
+File: bnx2x/bnx2x-e2-7.13.15.0.fw
 File: bnx2x/bnx2x-e2-7.13.21.0.fw
+File: bnx2x/bnx2x-e2-7.2.16.0.fw
+File: bnx2x/bnx2x-e2-7.2.51.0.fw
+File: bnx2x/bnx2x-e2-7.8.17.0.fw
+File: bnx2x/bnx2x-e2-7.8.19.0.fw
+File: bnx2x/bnx2x-e2-7.8.2.0.fw
 
 
 License:
-- 
2.36.1

