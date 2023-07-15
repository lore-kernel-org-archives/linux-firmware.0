Return-Path: <SRS0=yCVj=DB=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E334C001DE
	for <linux-firmware@archiver.kernel.org>; Sat, 15 Jul 2023 11:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11C64C433C7; Sat, 15 Jul 2023 11:40:54 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 337A8C433C9;
	Sat, 15 Jul 2023 11:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 337A8C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b703a0453fso43691871fa.3;
        Sat, 15 Jul 2023 04:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689421251; x=1692013251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU8jKO7EhDxBe5+sNn2FUWHuuhwsoKuUHShTZGJt7fc=;
        b=nBxYngHFJHjHMTxG5eOjLh/CdxbebTt7qG+j0UHjtHbyQaqJSF2KNc3cci7T7lhM27
         kgr5FDJ5lGW90iN7O5rANv3T9/ZzH/oIPRdw11/LXxcwG42XIMtxsreOX/JY+51LhJKL
         jMjnoWHo0Q8dg6kOPO/vhALNDM/JRpIAt3+Dynf+VtkvJQpn+/BV5FNLjomvnKGPkJ2z
         MeaTECmFZ+lnMnoLs6EidVhIuPDwZ+lCa/iGQ+kQbulcitr4oiOYfwI0jAVx8XTI/HZc
         EWYRMEkmijO3Rjc17eUKR85d53YNoxcIDqUDZxxVDw8/OgnS8N0hYbAPDcqmP8V0csPJ
         syxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689421251; x=1692013251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GU8jKO7EhDxBe5+sNn2FUWHuuhwsoKuUHShTZGJt7fc=;
        b=kdYrxEZeECHAl7GVTVZNYBpyRAEhTv8anZYLLv+QR9CTY4BKOxdOdsc75xKSB8fJ2v
         UW9tYi++ftpvNC5eLOKnyf2qRFZ6bf22jPHlV84V+hufGJkM7X6TyDzb5VgRpBtVcLlx
         ZHI+bHXoMW0suZ8NbWaL59WmAeUrCHr0o9Fbm4d9g1TcQqjw55reQUpL+Qcf7ScZledB
         /4+iUF4oXH5EzTqRIxhg8tv2vqltBDW8C7meHXJQQzsDn5u5zaygfNUm5vOsZw1BeUG2
         F00GJMam2k573wuKnJpOhBKjvb4S48QM/AbpwfMfhRChrGy+Wo3ftFVZmnuz8jbh71t2
         cmYw==
X-Gm-Message-State: ABy/qLZDxmGYoj/utkcOA/v6qNo+rWkIAg8nX06MYmmZId13WuwcbOZX
	RMlsb8RPFfjyCOpTPZseC+q4Y7fN4co=
X-Google-Smtp-Source: APBJJlFz2AGJIonRS0s8WWrP+B2Zm+fuGNUdYpw0/n3eBOqk5pduoazX1KzlefzJt5JjbHwRHLWnaA==
X-Received: by 2002:a2e:b0d0:0:b0:2b7:25b2:e37a with SMTP id g16-20020a2eb0d0000000b002b725b2e37amr6217717ljl.44.1689421250585;
        Sat, 15 Jul 2023 04:40:50 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id v7-20020a05600c214700b003fbc681c8d1sm3467219wml.36.2023.07.15.04.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 04:40:50 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/2] qcom: sc8280xp: LENOVO: remove directory sym link
Date: Sat, 15 Jul 2023 12:40:46 +0100
Message-ID: <20230715114046.1301714-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715114046.1301714-1-pbrobinson@gmail.com>
References: <20230715114046.1301714-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware was only ever referenced in the 6.0 kernel by
two firmware, for less than a month, by the 6.1 LTS kernel
those references had been updated to the new location.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE | 1 -
 1 file changed, 1 deletion(-)

diff --git a/WHENCE b/WHENCE
index e53002fb..c3de0234 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5640,7 +5640,6 @@ File: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
 File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
-Link: qcom/LENOVO/21BX -> ../sc8280xp/LENOVO/21BX
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
-- 
2.41.0

